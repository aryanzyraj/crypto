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

// Declare these variables at the top level of your file
WebSocketChannel? _socketChannel;
bool _isListenerAttached = false;
Timer? _reconnectTimer;

Future<void> updateTickersFromWebSocket(BuildContext context) async {
  void unsubscribeAndCloseConnection() {
    if (_socketChannel != null) {
      print('Unsubscribing and closing WebSocket connection.');
      _socketChannel!.sink.add(json.encode({
        "action": "UNSUBSCRIBE",
        "payload": {"type": "tickers"}
      }));
      // Wait a moment for the unsubscribe message to be sent before closing
      Future.delayed(Duration(milliseconds: 500), () {
        _socketChannel!.sink.close();
        _socketChannel = null;
      });
    }
  }

  void connectWebSocket() {
    if (!FFAppState().isWebSocketOpen || _socketChannel != null) {
      return;
    }

    // Cancel any existing reconnect timer
    _reconnectTimer?.cancel();

    print('Attempting to connect to WebSocket');
    _socketChannel = WebSocketChannel.connect(
        Uri.parse('${FFAppConstants.webSocket}/api/exchange/ticker'));

    _socketChannel!.sink.add(json.encode({
      "action": "SUBSCRIBE",
      "payload": {"type": "tickers"}
    }));

    _socketChannel!.stream.listen((message) {
      final Map<String, dynamic> parsedJson = json.decode(message);
      final Map<String, dynamic> data = parsedJson['data'] ?? {};

      FFAppState().update(() {
        final List<dynamic> updatedAllTickers =
            List.from(FFAppState().allTickers);
        final List<dynamic> updatedFilterTicker =
            List.from(FFAppState().filterTicker);

        data.forEach((key, value) {
          final dynamic lastDynamic = value['last'];
          final double lastDouble = (lastDynamic is int)
              ? lastDynamic.toDouble()
              : lastDynamic as double;
          String change = value['change'].toString();
          final double baseVolume = (value['baseVolume'] is int)
              ? (value['baseVolume'] as int).toDouble()
              : value['baseVolume'];
          final double quoteVolume = (value['quoteVolume'] is int)
              ? (value['quoteVolume'] as int).toDouble()
              : value['quoteVolume'];

          // Process change value
          final RegExp regExpInt = RegExp(r"^-?\d+$");
          final RegExp regExpDouble = RegExp(r"^-?\d*\.\d+$");

          if (regExpInt.hasMatch(change)) {
            int changeInt = int.parse(change);
            change = changeInt.toDouble().toStringAsFixed(1);
            change = changeInt >= 0 ? '+$change' : change;
          } else if (regExpDouble.hasMatch(change)) {
            double changeDouble = double.parse(change);
            change = changeDouble.toStringAsFixed(1);
            change = changeDouble >= 0 ? '+$change' : change;
          }

          String direction = change.startsWith('+')
              ? 'up'
              : (change.startsWith('-') ? 'down' : 'same');

          // Update allTickers
          for (int i = 0; i < updatedAllTickers.length; i++) {
            if (updatedAllTickers[i]['symbol'] == key) {
              updatedAllTickers[i] = {
                ...updatedAllTickers[i],
                "last": lastDouble,
                "change": change,
                "baseVolume": baseVolume,
                "direction": direction,
                "quoteVolume": quoteVolume
              };
              break;
            }
          }

          // Update filterTicker
          for (int i = 0; i < updatedFilterTicker.length; i++) {
            if (updatedFilterTicker[i]['symbol'] == key) {
              updatedFilterTicker[i] = {
                ...updatedFilterTicker[i],
                "last": lastDouble,
                "change": change,
                "baseVolume": baseVolume,
                "direction": direction,
                "quoteVolume": quoteVolume
              };
              break;
            }
          }
        });

        FFAppState().allTickers = updatedAllTickers;
        FFAppState().filterTicker = updatedFilterTicker;
      });
    }, onDone: () {
      print('WebSocket connection closed by the server.');
      _socketChannel = null;
      FFAppState().update(() {
        FFAppState().isWebSocketOpen = false;
      });
      // Attempt to reconnect after a delay
      _reconnectTimer = Timer(Duration(seconds: 5), () {
        if (FFAppState().isWebSocketOpen) {
          connectWebSocket();
        }
      });
    }, onError: (error) {
      print('WebSocket error: $error');
      _socketChannel = null;
      FFAppState().update(() {
        FFAppState().isWebSocketOpen = false;
      });
      // Attempt to reconnect after a delay
      _reconnectTimer = Timer(Duration(seconds: 5), () {
        if (FFAppState().isWebSocketOpen) {
          connectWebSocket();
        }
      });
    });
  }

  // Ensure listener is attached only once
  if (!_isListenerAttached) {
    FFAppState().addListener(() {
      if (FFAppState().isWebSocketOpen) {
        if (_socketChannel == null) {
          connectWebSocket();
        }
      } else {
        unsubscribeAndCloseConnection();
      }
    });
    _isListenerAttached = true;
  }

  // Initial attempt to connect if the state indicates it should be open
  if (FFAppState().isWebSocketOpen) {
    if (_socketChannel == null) {
      connectWebSocket();
    }
  } else {
    unsubscribeAndCloseConnection();
  }
}
