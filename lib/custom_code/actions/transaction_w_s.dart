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

WebSocketChannel? _transactionSocketChannel;
String? _currentUserId;
String? _currentTrx;
Timer? _reconnectTimer;
bool _isConnecting = false;
int _reconnectAttempts = 0;
final int _maxReconnectAttempts = 5;

Future<void> transactionWS(
  String action,
  String walletType,
  String userID,
  String trx,
) async {
  if (_isConnecting) {
    print('Connection attempt already in progress. Skipping.');
    return;
  }

  final url =
      '${FFAppConstants.webSocket}/api/finance/$action/$walletType?userId=$userID';

  void closeConnection() {
    if (_transactionSocketChannel != null) {
      _transactionSocketChannel!.sink.close();
      _transactionSocketChannel = null;
    }
    _reconnectTimer?.cancel();
    _currentUserId = null;
    _currentTrx = null;
    _isConnecting = false;
    _reconnectAttempts = 0;
  }

  void handleDisconnection() {
    _transactionSocketChannel = null;
    _isConnecting = false;

    if (FFAppState().transactionStatus == 'PENDING' &&
        _currentTrx != null &&
        _currentUserId != null) {
      if (_reconnectAttempts < _maxReconnectAttempts) {
        _reconnectAttempts++;
        final delay = Duration(seconds: _reconnectAttempts * 5);
        print(
            'Attempting to reconnect in ${delay.inSeconds} seconds. Attempt $_reconnectAttempts of $_maxReconnectAttempts');
        _reconnectTimer = Timer(delay, () {
          transactionWS(action, walletType, _currentUserId!, _currentTrx!);
        });
      } else {
        print('Max reconnection attempts reached. Please try again later.');
        FFAppState().update(() {
          FFAppState().transactionStatus = 'CONNECTION_FAILED';
        });
      }
    }
  }

  void subscribeToTransaction(String trx) {
    if (_transactionSocketChannel != null) {
      final subscribeMessage = json.encode({
        "action": "SUBSCRIBE",
        "payload": {"trx": trx}
      });
      print('Sending subscribe message: $subscribeMessage');
      _transactionSocketChannel!.sink.add(subscribeMessage);
      _currentTrx = trx;

      FFAppState().update(() {
        FFAppState().transactionStatus = 'PENDING';
      });
    } else {
      print('WebSocket is not connected. Cannot subscribe.');
    }
  }

  Future<void> connectWebSocket() async {
    if (_transactionSocketChannel != null) {
      print(
          'WebSocket connection already exists. Reusing existing connection.');
      subscribeToTransaction(trx);
      return;
    }

    _isConnecting = true;
    print('Attempting to connect to Transaction WebSocket');

    try {
      _transactionSocketChannel = WebSocketChannel.connect(Uri.parse(url));
      await _transactionSocketChannel!.ready;
      print('WebSocket connected successfully');
      _currentUserId = userID;
      _isConnecting = false;
      _reconnectAttempts = 0;

      _transactionSocketChannel!.stream.listen(
        (message) {
          print('Received message: $message');
          if (message != null && message.isNotEmpty) {
            try {
              final Map<String, dynamic> parsedJson = json.decode(message);

              if (parsedJson['stream'] == 'verification') {
                final Map<String, dynamic> data = parsedJson['data'] ?? {};

                FFAppState().update(() {
                  FFAppState().transactionResult = parsedJson;
                  if (data['transaction'] != null &&
                      data['transaction']['status'] != null) {
                    FFAppState().transactionStatus =
                        data['transaction']['status'];
                  }
                });

                if (FFAppState().transactionStatus != 'PENDING') {
                  closeConnection();
                }
              }
            } catch (e) {
              print('Error parsing message: $e');
            }
          } else {
            print('Received empty message');
          }
        },
        onDone: () {
          print('WebSocket connection closed by the server.');
          handleDisconnection();
        },
        onError: (error) {
          print('WebSocket error: $error');
          handleDisconnection();
        },
      );

      subscribeToTransaction(trx);
    } catch (e) {
      print('Error connecting to WebSocket: $e');
      _isConnecting = false;
      handleDisconnection();
    }
  }

  // If the user ID or transaction has changed, close the existing connection
  if (_currentUserId != userID || _currentTrx != trx) {
    closeConnection();
  }

  // Start a new connection or reuse existing one
  await connectWebSocket();
}
