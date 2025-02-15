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

import 'package:flutter_xlider/flutter_xlider.dart';

class BinanceStyleSlider extends StatefulWidget {
  const BinanceStyleSlider({
    Key? key,
    this.width,
    this.height,
    required this.onChanged,
    this.min = 0.0,
    this.max = 100.0,
    this.initialValue = 0.0,
    this.activeColor = const Color(0xFF02C076),
    this.inactiveColor = const Color(0xFFE0E3EB),
  }) : super(key: key);

  final double? width;
  final double? height;
  final Function(double) onChanged;
  final double min;
  final double max;
  final double initialValue;
  final Color activeColor;
  final Color inactiveColor;

  @override
  _BinanceStyleSliderState createState() => _BinanceStyleSliderState();
}

class _BinanceStyleSliderState extends State<BinanceStyleSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: FlutterSlider(
        values: [_currentValue],
        min: widget.min,
        max: widget.max,
        onDragging: (handlerIndex, lowerValue, upperValue) {
          setState(() {
            _currentValue = lowerValue;
          });
          widget.onChanged(lowerValue);
        },
        handler: FlutterSliderHandler(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0.05,
                blurRadius: 5,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Container(),
        ),
        trackBar: FlutterSliderTrackBar(
          inactiveTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.inactiveColor,
          ),
          activeTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: widget.activeColor,
          ),
        ),
        tooltip: FlutterSliderTooltip(
          leftPrefix: Icon(
            Icons.attach_money,
            size: 18,
            color: Colors.black54,
          ),
          format: (String value) {
            return value;
          },
          textStyle: TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
          boxStyle: FlutterSliderTooltipBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                )
              ],
            ),
          ),
        ),
        hatchMark: FlutterSliderHatchMark(
          density: 0.5,
          labels: [
            FlutterSliderHatchMarkLabel(
              percent: 0,
              label: Text('0%', style: TextStyle(fontSize: 12)),
            ),
            FlutterSliderHatchMarkLabel(
              percent: 25,
              label: Text('25%', style: TextStyle(fontSize: 12)),
            ),
            FlutterSliderHatchMarkLabel(
              percent: 50,
              label: Text('50%', style: TextStyle(fontSize: 12)),
            ),
            FlutterSliderHatchMarkLabel(
              percent: 75,
              label: Text('75%', style: TextStyle(fontSize: 12)),
            ),
            FlutterSliderHatchMarkLabel(
              percent: 100,
              label: Text('100%', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
