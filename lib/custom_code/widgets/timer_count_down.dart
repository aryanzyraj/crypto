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

import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerCountDown extends StatefulWidget {
  const TimerCountDown({
    super.key,
    this.width,
    this.height,
    required this.seconds,
    required this.color,
    required this.fontSize,
  });

  final double? width;
  final double? height;
  final int seconds;
  final Color color;
  final double fontSize;

  @override
  State<TimerCountDown> createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown> {
  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: widget.seconds,
      build: (BuildContext context, double time) => Text(
        formatTime(time),
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.color,
        ),
      ),
      interval: Duration(milliseconds: 100),
      onFinished: () {
        print('Timer is done!');
      },
    );
  }

  String formatTime(double time) {
    int totalSeconds = time.toInt();
    int days = totalSeconds ~/ (3600 * 24);
    int hours = (totalSeconds % (3600 * 24)) ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    String formattedTime = '';
    if (days > 0) {
      formattedTime += "${days}d ";
    }
    formattedTime += "${hours.toString().padLeft(2, '0')}h ";
    formattedTime += "${minutes.toString().padLeft(2, '0')}m ";
    formattedTime += "${seconds.toString().padLeft(2, '0')}s";

    return formattedTime.trim(); // Remove any trailing spaces
  }
}
