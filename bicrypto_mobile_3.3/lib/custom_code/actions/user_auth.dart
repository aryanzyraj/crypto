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

WebSocketChannel? _userAuthSocketChannel;
String? _currentAuthUserId;
Timer? _authReconnectTimer;
bool _isAuthConnecting = false;
int _authReconnectAttempts = 0;
final int _maxAuthReconnectAttempts = 5;

Future<void> userAuth(String userId) async {
  if (_isAuthConnecting) {
    print('Auth connection attempt already in progress. Skipping.');
    return;
  }

  final url = '${FFAppConstants.webSocket}/api/user?userId=$userId';

  void closeAuthConnection() {
    if (_userAuthSocketChannel != null) {
      _userAuthSocketChannel!.sink.close();
      _userAuthSocketChannel = null;
    }
    _authReconnectTimer?.cancel();
    _currentAuthUserId = null;
    _isAuthConnecting = false;
    _authReconnectAttempts = 0;
  }

  void handleAuthDisconnection() {
    _userAuthSocketChannel = null;
    _isAuthConnecting = false;

    if (_currentAuthUserId != null) {
      if (_authReconnectAttempts < _maxAuthReconnectAttempts) {
        _authReconnectAttempts++;
        final delay = Duration(seconds: _authReconnectAttempts * 5);
        print(
            'Attempting to reconnect auth in ${delay.inSeconds} seconds. Attempt $_authReconnectAttempts of $_maxAuthReconnectAttempts');
        _authReconnectTimer = Timer(delay, () {
          userAuth(_currentAuthUserId!);
        });
      } else {
        print(
            'Max auth reconnection attempts reached. Please try again later.');
      }
    }
  }

  void subscribeToAuth() {
    if (_userAuthSocketChannel != null) {
      final subscribeMessage = json.encode({
        "type": "SUBSCRIBE",
        "payload": {"type": "auth"}
      });
      print('Sending auth subscribe message: $subscribeMessage');
      _userAuthSocketChannel!.sink.add(subscribeMessage);
    } else {
      print('Auth WebSocket is not connected. Cannot subscribe.');
    }
  }

  Future<void> connectAuthWebSocket() async {
    if (_userAuthSocketChannel != null) {
      print(
          'Auth WebSocket connection already exists. Reusing existing connection.');
      subscribeToAuth();
      return;
    }

    _isAuthConnecting = true;
    print('Attempting to connect to Auth WebSocket');

    try {
      _userAuthSocketChannel = WebSocketChannel.connect(Uri.parse(url));
      await _userAuthSocketChannel!.ready;
      print('Auth WebSocket connected successfully');
      _currentAuthUserId = userId;
      _isAuthConnecting = false;
      _authReconnectAttempts = 0;

      _userAuthSocketChannel!.stream.listen(
        (message) {
          print('Received auth message: $message');
          if (message != null && message.isNotEmpty) {
            try {
              final Map<String, dynamic> parsedJson = json.decode(message);

              if (parsedJson['type'] == 'notifications') {
                FFAppState().update(() {
                  FFAppState().notifications =
                      List<dynamic>.from(parsedJson['payload'] ?? []);
                });
              } else if (parsedJson['type'] == 'announcements') {
                FFAppState().update(() {
                  FFAppState().announcements =
                      List<dynamic>.from(parsedJson['payload'] ?? []);
                });
              }
            } catch (e) {
              print('Error parsing auth message: $e');
            }
          } else {
            print('Received empty auth message');
          }
        },
        onDone: () {
          print('Auth WebSocket connection closed by the server.');
          handleAuthDisconnection();
        },
        onError: (error) {
          print('Auth WebSocket error: $error');
          handleAuthDisconnection();
        },
      );

      subscribeToAuth();
    } catch (e) {
      print('Error connecting to Auth WebSocket: $e');
      _isAuthConnecting = false;
      handleAuthDisconnection();
    }
  }

  // If the user ID has changed, close the existing connection
  if (_currentAuthUserId != userId) {
    closeAuthConnection();
  }

  // Start a new connection or reuse existing one
  await connectAuthWebSocket();
}
