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

WebSocketChannel? _depositWebSocketChannel;

Future<void> subscribeToDepositECO(
  String userId,
  String currency,
  String chain,
  String address,
) async {
  final url =
      '${FFAppConstants.webSocket}/api/ext/ecosystem/deposit?userId=$userId';

  void closeWebSocketConnection() {
    if (_depositWebSocketChannel != null) {
      _depositWebSocketChannel!.sink.close();
      _depositWebSocketChannel = null;
    }
  }

  Future<void> connectWebSocket() async {
    if (_depositWebSocketChannel != null) {
      print(
          'WebSocket connection already exists. Closing existing connection.');
      closeWebSocketConnection();
    }

    print('Attempting to connect to WebSocket');

    try {
      _depositWebSocketChannel = WebSocketChannel.connect(Uri.parse(url));
      await _depositWebSocketChannel!.ready;
      print('WebSocket connected successfully');

      // Send subscription message
      final subscribeMessage = json.encode({
        "action": "SUBSCRIBE",
        "payload": {"currency": currency, "chain": chain, "address": address}
      });
      print('Sending subscribe message: $subscribeMessage');
      _depositWebSocketChannel!.sink.add(subscribeMessage);

      _depositWebSocketChannel!.stream.listen(
        (message) {
          print('Received message: $message');
          if (message != null && message.isNotEmpty) {
            try {
              final Map<String, dynamic> parsedJson = json.decode(message);
              // Handle the received message as needed
              // For example, you might want to update the app state or trigger some action
            } catch (e) {
              print('Error parsing message: $e');
            }
          } else {
            print('Received empty message');
          }
        },
        onDone: () {
          print('WebSocket connection closed by the server.');
          closeWebSocketConnection();
        },
        onError: (error) {
          print('WebSocket error: $error');
          closeWebSocketConnection();
        },
      );
    } catch (e) {
      print('Error connecting to WebSocket: $e');
      closeWebSocketConnection();
    }
  }

  // Start a new connection
  await connectWebSocket();
}
