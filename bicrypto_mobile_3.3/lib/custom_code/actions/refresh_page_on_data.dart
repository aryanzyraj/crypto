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

Future<void> refreshPageOnData(BuildContext context) async {
  // Use a Timer for periodic refresh
  Timer.periodic(Duration(milliseconds: 1000), (Timer t) {
    (context as Element).reassemble();
  });

  // (context as Element).reassemble();
}
