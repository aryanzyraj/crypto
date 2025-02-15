// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/flutter_flow/flutter_flow_web_view.dart';

class CustomWebView extends StatelessWidget {
  const CustomWebView({
    Key? key,
    this.width,
    this.height,
    required this.link,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String link;

  @override
  Widget build(BuildContext context) {
    // Modify the URL to include custom headers as query parameters
    final Uri uri = Uri.parse(link);
    final Map<String, String> queryParams = {
      ...uri.queryParameters,
      'accessToken': FFAppState().accesstoken,
      'csrfToken': FFAppState().csrftoken,
      'sessionId': FFAppState().sessionId,
      'platform': 'app',
    };
    final String modifiedUrl =
        uri.replace(queryParameters: queryParams).toString();

    return FlutterFlowWebView(
      content: modifiedUrl,
      bypass: false,
      height: height ?? MediaQuery.of(context).size.height * 0.9,
      verticalScroll: true,
      horizontalScroll: true,
    );
  }
}
