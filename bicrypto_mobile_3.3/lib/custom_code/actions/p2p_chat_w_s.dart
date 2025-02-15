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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

WebSocketChannel? _p2pChatSocketChannel;
String? _currentP2PUserId;
String? _currentTradeId;
Timer? _p2pReconnectTimer;
bool _isP2PConnecting = false;
int _p2pReconnectAttempts = 0;
final int _maxP2PReconnectAttempts = 5;

Future<void> p2pChatWS(
  String userId,
  String tradeId,
  dynamic message,
) async {
  if (_isP2PConnecting) {
    print('P2P chat connection attempt already in progress. Skipping.');
    return;
  }

  final url = '${FFAppConstants.webSocket}/api/ext/p2p/trade?userId=$userId';

  void closeP2PConnection() {
    if (_p2pChatSocketChannel != null) {
      _p2pChatSocketChannel!.sink.close();
      _p2pChatSocketChannel = null;
    }
    _p2pReconnectTimer?.cancel();
    _currentP2PUserId = null;
    _currentTradeId = null;
    _isP2PConnecting = false;
    _p2pReconnectAttempts = 0;
  }

  void subscribeToTrade(String newTradeId) {
    if (_p2pChatSocketChannel != null) {
      final subscribeMessage = json.encode({
        "action": "SUBSCRIBE",
        "payload": {"id": newTradeId}
      });
      print('Sending subscribe message: $subscribeMessage');
      _p2pChatSocketChannel!.sink.add(subscribeMessage);
      _currentTradeId = newTradeId;
    } else {
      print('P2P chat WebSocket is not connected. Cannot subscribe.');
    }
  }

  void sendChatMessage(dynamic messageData) {
    if (_p2pChatSocketChannel != null && messageData != null) {
      final chatMessage = json.encode(messageData);
      print('Sending P2P chat message: $chatMessage');
      _p2pChatSocketChannel!.sink.add(chatMessage);
    } else {
      print(
          'P2P chat WebSocket is not connected or message is null. Cannot send message.');
    }
  }

  void handleP2PDisconnection() {
    _p2pChatSocketChannel = null;
    _isP2PConnecting = false;

    if (_currentP2PUserId != null && _currentTradeId != null) {
      if (_p2pReconnectAttempts < _maxP2PReconnectAttempts) {
        _p2pReconnectAttempts++;
        final delay = Duration(seconds: _p2pReconnectAttempts * 5);
        print(
            'Attempting to reconnect P2P chat in ${delay.inSeconds} seconds. Attempt $_p2pReconnectAttempts of $_maxP2PReconnectAttempts');
        _p2pReconnectTimer = Timer(delay, () {
          p2pChatWS(_currentP2PUserId!, _currentTradeId!, null);
        });
      } else {
        print(
            'Max P2P chat reconnection attempts reached. Please try again later.');
      }
    }
  }

  Future<void> connectP2PChatWebSocket() async {
    if (_p2pChatSocketChannel != null) {
      print('P2P chat WebSocket connection already exists.');
      if (_currentTradeId != tradeId) {
        subscribeToTrade(tradeId);
      } else if (message != null) {
        sendChatMessage(message);
      }
      return;
    }

    _isP2PConnecting = true;
    print('Attempting to connect to P2P chat WebSocket');

    try {
      _p2pChatSocketChannel = WebSocketChannel.connect(Uri.parse(url));
      await _p2pChatSocketChannel!.ready;
      print('P2P chat WebSocket connected successfully');
      _currentP2PUserId = userId;
      _isP2PConnecting = false;
      _p2pReconnectAttempts = 0;

      _p2pChatSocketChannel!.stream.listen(
        (message) {
          print('Received P2P chat message: $message');
          if (message != null && message.isNotEmpty) {
            try {
              final Map<String, dynamic> parsedJson = json.decode(message);

              // Update FFAppState().p2pChat with the new message
              FFAppState().update(() {
                FFAppState().p2pChat = [...FFAppState().p2pChat, parsedJson];
              });
            } catch (e) {
              print('Error parsing P2P chat message: $e');
            }
          } else {
            print('Received empty P2P chat message');
          }
        },
        onDone: () {
          print('P2P chat WebSocket connection closed by the server.');
          handleP2PDisconnection();
        },
        onError: (error) {
          print('P2P chat WebSocket error: $error');
          handleP2PDisconnection();
        },
      );

      subscribeToTrade(tradeId);
      if (message != null) {
        sendChatMessage(message);
      }
    } catch (e) {
      print('Error connecting to P2P chat WebSocket: $e');
      _isP2PConnecting = false;
      handleP2PDisconnection();
    }
  }

  // If the user ID has changed, close the existing connection
  if (_currentP2PUserId != userId) {
    closeP2PConnection();
  }

  // Start a new connection or reuse existing one
  await connectP2PChatWebSocket();
}
