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

class Tickers extends StatefulWidget {
  const Tickers({
    super.key,
    this.width,
    this.height,
    required this.symbolTextSize,
    required this.symbolTextColor,
    required this.qvTextSize,
    required this.qvTextColor,
    required this.lastTextSize,
    required this.lastTextColor,
    required this.sLastTextSize,
    required this.sLastTextColor,
    required this.changeTextSize,
    required this.changeTextColor,
    required this.containerUpColor,
    required this.containerDownColor,
    required this.containerEqualColor,
  });

  final double? width;
  final double? height;
  final double symbolTextSize;
  final Color symbolTextColor;
  final double qvTextSize;
  final Color qvTextColor;
  final double lastTextSize;
  final Color lastTextColor;
  final double sLastTextSize;
  final Color sLastTextColor;
  final double changeTextSize;
  final Color changeTextColor;
  final Color containerUpColor;
  final Color containerDownColor;
  final Color containerEqualColor;

  @override
  State<Tickers> createState() => _TickersState();
}

class _TickersState extends State<Tickers> {
  String formatVolume(double value) {
    if (value >= 1000000000) {
      return (value / 1000000000).toStringAsFixed(3) + 'B';
    } else if (value >= 1000000) {
      return (value / 1000000).toStringAsFixed(3) + 'M';
    } else if (value >= 1000) {
      return (value / 1000).toStringAsFixed(2) + 'K';
    } else {
      return value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    var tickerData = FFAppState()
        .filterTicker; // Assuming this is a List<Map<String, dynamic>>

    return Container(
      width: widget.width,
      height: widget.height,
      child: ListView.builder(
        itemCount: tickerData.length,
        itemBuilder: (BuildContext context, int index) {
          var ticker = tickerData[index];
          var change =
              double.parse(ticker['change'].toString()).toStringAsFixed(1);
          var quoteVolume = double.parse(ticker['quoteVolume'].toString());
          double changeValue = double.parse(
              change); // Parsing the change string to a double for comparison

          Color changeColor = changeValue > 0
              ? widget.containerUpColor
              : (changeValue < 0
                  ? widget.containerDownColor
                  : widget.containerEqualColor);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticker['symbol'],
                        style: TextStyle(
                          fontSize: widget.symbolTextSize,
                          color: widget.symbolTextColor,
                        ),
                      ),
                      Text(
                        formatVolume(quoteVolume),
                        style: TextStyle(
                          fontSize: widget.qvTextSize,
                          color: widget.qvTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ticker['last'].toString(),
                      style: TextStyle(
                        fontSize: widget.lastTextSize,
                        color: widget.lastTextColor,
                      ),
                    ),
                    Text(
                      '\$${ticker['last']}',
                      style: TextStyle(
                        fontSize: widget.sLastTextSize,
                        color: widget.sLastTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    width:
                        12), // Adding space between the last price and change container
                Container(
                  width: 100, // Fixed width for change container
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: changeColor,
                    borderRadius:
                        BorderRadius.circular(6), // Rounded corners set to 6
                  ),
                  child: Text(
                    '$change %',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: widget.changeTextSize,
                      color: widget.changeTextColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    FFAppState().addListener(_onTickerDataChanged);
  }

  void _onTickerDataChanged() {
    if (mounted) {
      setState(() {}); // Trigger a rebuild whenever ticker data changes.
    }
  }

  @override
  void dispose() {
    FFAppState().removeListener(_onTickerDataChanged);
    super.dispose();
  }
}
