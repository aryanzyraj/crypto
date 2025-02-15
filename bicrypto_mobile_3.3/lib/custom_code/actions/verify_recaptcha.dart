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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> verifyRecaptcha(String responseToken) async {
  final String secretKey = '6Lc0teYpAAAAAHsjD7O8dViuPlDaqCuciU0PxMCl';
  final String verificationUrl =
      'https://www.google.com/recaptcha/api/siteverify';

  final response = await http.post(
    Uri.parse(verificationUrl),
    body: {
      'secret': secretKey,
      'response': responseToken,
    },
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return jsonResponse['success'] as bool;
  } else {
    // Handle error case
    return false;
  }
}
