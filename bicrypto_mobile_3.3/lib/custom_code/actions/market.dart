// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

WebSocketChannel? _marketChannel;
String? _currentMarketSymbol;
String? _currentInterval;
Timer? _reconnectionTimer;
bool _isConnecting = false;

List<dynamic> _processOrderList(List<dynamic> data, bool isAskList) {
  var formattedList = data.map((entry) {
    if (entry is List && entry.length >= 2) {
      return {
        'price': entry[0] is num ? (entry[0] as num).toDouble() : 0.0,
        'amount': entry[1] is num ? (entry[1] as num).toDouble() : 0.0,
        'cumulative': 0.0,
      };
    }
    return {'price': 0.0, 'amount': 0.0, 'cumulative': 0.0};
  }).toList();

  double highestCumulativeAmount = 0.0;
  for (int i = 0; i < formattedList.length; i++) {
    highestCumulativeAmount += formattedList[i]['amount'] as double;
    formattedList[i]['cumulative'] = highestCumulativeAmount;
  }

  for (var entry in formattedList) {
    double widthRatio =
        (entry['cumulative'] as double) / highestCumulativeAmount;
    int width = (widthRatio * 120).round();
    entry['width'] = (width > 120 ? 120 : width).toDouble();
  }

  return formattedList;
}

String _formatDateTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  return DateFormat('HH:mm:ss').format(dateTime);
}

void unsubscribeFromMarketData(String symbol, String? interval) {
  if (_marketChannel == null) return;

  _marketChannel!.sink.add(json.encode({
    "action": "UNSUBSCRIBE",
    "payload": {"type": "orderbook", "limit": 40, "symbol": symbol}
  }));
  _marketChannel!.sink.add(json.encode({
    "action": "UNSUBSCRIBE",
    "payload": {"type": "ticker", "symbol": symbol}
  }));
  _marketChannel!.sink.add(json.encode({
    "action": "UNSUBSCRIBE",
    "payload": {"type": "trades", "symbol": symbol}
  }));
  if (interval != null) {
    _marketChannel!.sink.add(json.encode({
      "action": "UNSUBSCRIBE",
      "payload": {"type": "ohlcv", "interval": interval, "symbol": symbol}
    }));
  }
// Clear SingleTicker, tradeAsks, and tradeBids states

  FFAppState().singleTicker = null;
  FFAppState().tradeAsks = [];
  FFAppState().tradeBids = [];
  FFAppState().recentTrades = [];
}

void subscribeToMarketData(String symbol, String? interval) {
  if (_marketChannel == null) return;

  _marketChannel!.sink.add(json.encode({
    "action": "SUBSCRIBE",
    "payload": {"type": "orderbook", "limit": 40, "symbol": symbol}
  }));
  _marketChannel!.sink.add(json.encode({
    "action": "SUBSCRIBE",
    "payload": {"type": "ticker", "symbol": symbol}
  }));
  _marketChannel!.sink.add(json.encode({
    "action": "SUBSCRIBE",
    "payload": {"type": "trades", "symbol": symbol}
  }));
  if (interval != null) {
    _marketChannel!.sink.add(json.encode({
      "action": "SUBSCRIBE",
      "payload": {"type": "ohlcv", "interval": interval, "symbol": symbol}
    }));
  }
}

void changeSymbol(String newSymbol, String? interval) {
  if (_currentMarketSymbol != null) {
    unsubscribeFromMarketData(_currentMarketSymbol!, _currentInterval);
  }
  _currentMarketSymbol = newSymbol;
  _currentInterval = interval;
  subscribeToMarketData(newSymbol, interval);
}

void changeInterval(String newInterval) {
  if (_currentMarketSymbol != null && _currentInterval != null) {
    _marketChannel!.sink.add(json.encode({
      "action": "UNSUBSCRIBE",
      "payload": {
        "type": "ohlcv",
        "interval": _currentInterval,
        "symbol": _currentMarketSymbol
      }
    }));
  }
  _currentInterval = newInterval;
  if (_currentMarketSymbol != null) {
    _marketChannel!.sink.add(json.encode({
      "action": "SUBSCRIBE",
      "payload": {
        "type": "ohlcv",
        "interval": newInterval,
        "symbol": _currentMarketSymbol
      }
    }));
  }
}

void closeMarketConnection() {
  _reconnectionTimer?.cancel();
  if (_marketChannel != null) {
    unsubscribeFromMarketData(_currentMarketSymbol!, _currentInterval);
    Future.delayed(Duration(milliseconds: 500), () {
      _marketChannel!.sink.close();
      _marketChannel = null;
      _currentMarketSymbol = null;
      _currentInterval = null;
    });
  }
  _isConnecting = false;
}

void connectMarketWebSocket(BuildContext context) {
  if (_isConnecting) return;
  _isConnecting = true;

  if (_marketChannel != null) {
    if (FFAppState().symbol != _currentMarketSymbol) {
      changeSymbol(FFAppState().symbol, FFAppState().interval);
    } else if (FFAppState().interval != _currentInterval) {
      changeInterval(FFAppState().interval);
    }
    _isConnecting = false;
    return;
  }

  final String wsBaseUrl = '${FFAppConstants.webSocket}/api/exchange/market';
  _marketChannel = WebSocketChannel.connect(Uri.parse(wsBaseUrl));
  _currentMarketSymbol = FFAppState().symbol;
  _currentInterval = FFAppState().interval;

  _marketChannel!.stream.listen((message) {
    final decodedMessage = json.decode(message);
    final String streamType = decodedMessage['stream'];
    final data = decodedMessage['data'];

    if (streamType.startsWith('orderbook')) {
      FFAppState().update(() {
        if (data.containsKey('bids') && data.containsKey('asks')) {
          List<dynamic> bids =
              _processOrderList(data['bids'] as List<dynamic>, false);
          List<dynamic> asks =
              _processOrderList(data['asks'] as List<dynamic>, true);

          FFAppState().bids = bids;
          FFAppState().asks = asks;
          FFAppState().tradeBids = bids;
          FFAppState().tradeAsks = asks.reversed.toList();
          FFAppState().depthBids = data['bids'];
          FFAppState().depthAsks = data['asks'];
        }
      });
    } else if (streamType == 'ticker') {
      FFAppState().update(() {
        FFAppState().singleTicker = Map<String, dynamic>.from(data);
      });
    } else if (streamType == 'trades') {
      FFAppState().update(() {
        // Update marketTrade
        FFAppState().marketTrade = List<dynamic>.from(data);

        // Process all trades in the data
        List<Map<String, dynamic>> newTrades = [];
        for (var trade in data) {
          Map<String, dynamic> formattedTrade =
              Map<String, dynamic>.from(trade);
          formattedTrade['formattedTime'] =
              _formatDateTime(formattedTrade['datetime']);
          newTrades.add(formattedTrade);
        }

        // Get existing recent trades
        List<dynamic> recentTrades =
            List<dynamic>.from(FFAppState().recentTrades ?? []);

        // Add new trades at the beginning of the list
        recentTrades.insertAll(0, newTrades);

        // Limit the list to a certain number of trades (e.g., 50)
        if (recentTrades.length > 50) {
          recentTrades = recentTrades.sublist(0, 50);
        }

        // Update the recentTrades state
        FFAppState().recentTrades = recentTrades;
      });
    } else if (streamType.startsWith('ohlcv')) {
      FFAppState().update(() {
        // Update the OHLCV data
        if (data is List && data.isNotEmpty && data[0] is List) {
          List<dynamic> ohlcvData = data[0];
          if (ohlcvData.length >= 6) {
            FFAppState().ohlcv = {
              'timestamp': ohlcvData[0],
              'open': ohlcvData[1],
              'high': ohlcvData[2],
              'low': ohlcvData[3],
              'close': ohlcvData[4],
              'volume': ohlcvData[5],
            };
          }
        }

        // Keep the existing marketOHLCV update as well
        FFAppState().marketOHLCV = List<dynamic>.from(data);
      });
    }
  }, onDone: () {
    closeMarketConnection();
    _reconnectionTimer =
        Timer(Duration(seconds: 5), () => connectMarketWebSocket(context));
  }, onError: (error) {
    closeMarketConnection();
    _reconnectionTimer =
        Timer(Duration(seconds: 5), () => connectMarketWebSocket(context));
  });

  subscribeToMarketData(_currentMarketSymbol!, _currentInterval);
  _isConnecting = false;
}

Future<void> market(BuildContext context) async {
  connectMarketWebSocket(context);

  FFAppState().addListener(() {
    if (FFAppState().isOrderBookOpen) {
      if (FFAppState().symbol != _currentMarketSymbol ||
          FFAppState().interval != _currentInterval) {
        connectMarketWebSocket(context);
      }
    } else {
      closeMarketConnection();
    }
  });
}
