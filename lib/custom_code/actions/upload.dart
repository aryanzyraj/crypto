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
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mime/mime.dart';

Future<dynamic> upload(
  String dir,
  FFUploadedFile? file,
  int height,
  int width,
  String? oldPath,
) async {
  if (file == null) {
    throw Exception('No file provided');
  }

  final url = Uri.parse('${FFAppConstants.Domain}/api/upload');

  // Prepare the headers
  final headers = {
    'Content-Type': 'application/json',
    'platform': 'app',
    'Accept': 'application/json',
    'accessToken': FFAppState().accesstoken,
    'csrfToken': FFAppState().csrftoken,
    'sessionId': FFAppState().sessionId,
  };

  // Determine MIME type
  final mimeType =
      lookupMimeType(file.name ?? '') ?? 'application/octet-stream';

  // Convert file to base64
  final base64File =
      'data:$mimeType;base64,${base64Encode(file.bytes ?? Uint8List(0))}';

  // Prepare the request body
  final body = jsonEncode({
    'dir': dir,
    'file': base64File,
    'height': height,
    'width': width,
    if (oldPath != null) 'oldPath': oldPath,
  });

  try {
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to upload file: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error uploading file: $e');
  }
}
