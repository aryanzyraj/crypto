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

import 'package:syncfusion_flutter_gauges/gauges.dart';

class GreedIndex extends StatefulWidget {
  const GreedIndex({
    Key? key,
    this.width,
    this.height,
    this.value,
    this.needelcolor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? value;
  final Color? needelcolor;

  @override
  State<GreedIndex> createState() => _GreedIndexState();
}

class _GreedIndexState extends State<GreedIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = Size(
              widget.width ?? constraints.maxWidth,
              widget.height ?? constraints.maxHeight,
            );
            return SizedBox(
              width: size.width,
              height: size.height,
              child: SfRadialGauge(
                enableLoadingAnimation: true, // Enable animation
                animationDuration:
                    4500, // Duration of the animation in milliseconds
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 25,
                          color: Colors.red,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 25,
                          endValue: 46,
                          color: Colors.orange,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 46,
                          endValue: 54,
                          color: Colors.yellow,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 54,
                          endValue: 75,
                          color:
                              Color.fromARGB(255, 131, 244, 234), // Light Green
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 75,
                          endValue: 100,
                          color: Color(0xFF00d3c2), // Green
                          startWidth: 10,
                          endWidth: 10),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: widget.value ?? 50,
                        needleLength: 0.7,
                        needleStartWidth: 1,
                        needleEndWidth: 6,
                        needleColor: widget.needelcolor ?? Colors.black,
                        knobStyle: KnobStyle(
                          knobRadius: 0.08,
                          color: Colors.black,
                          borderColor: widget.needelcolor,
                          borderWidth: 0.02,
                        ),
                        tailStyle: TailStyle(
                          length: 0.2,
                          width: 5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${widget.value?.toStringAsFixed(1) ?? '50.0'}',
                              style: TextStyle(
                                fontSize: size.width * 0.08,
                                fontWeight: FontWeight.bold,
                                color: _getColorForValue(widget.value ?? 50),
                              ),
                            ),
                            Text(
                              _getGreedLevel(widget.value ?? 50),
                              style: TextStyle(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: _getColorForValue(widget.value ?? 50),
                              ),
                            ),
                          ],
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _getGreedLevel(double value) {
    if (value <= 25) return 'Extreme Fear';
    if (value <= 46) return 'Fear';
    if (value <= 54) return 'Neutral';
    if (value <= 75) return 'Greed';
    return 'Extreme Greed';
  }

  Color _getColorForValue(double value) {
    if (value <= 25) return Colors.red;
    if (value <= 46) return Colors.orange;
    if (value <= 54) return Colors.yellow;
    if (value <= 75) return Color.fromARGB(255, 131, 244, 234); // Light Green
    return Color(0xFF00d3c2); // Green
  }
}
