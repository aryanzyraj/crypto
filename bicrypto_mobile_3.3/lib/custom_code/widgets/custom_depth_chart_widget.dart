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

import 'package:k_chart/flutter_k_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomDepthChartWidget extends StatefulWidget {
  final double? width;
  final double? height;

  const CustomDepthChartWidget({Key? key, this.width, this.height})
      : super(key: key);

  @override
  _CustomDepthChartWidgetState createState() => _CustomDepthChartWidgetState();
}

class _CustomDepthChartWidgetState extends State<CustomDepthChartWidget> {
  List<DepthEntity>? _bids, _asks;

  @override
  void initState() {
    super.initState();
    FFAppState().addListener(_updateDepthData);
    _updateDepthData(); // Initial load
  }

  @override
  void dispose() {
    FFAppState().removeListener(_updateDepthData);
    super.dispose();
  }

  void _updateDepthData() {
    print("Updating depth data...");
    if (FFAppState().depthBids != null && FFAppState().depthAsks != null) {
      print("Depth bids and asks are not null...");
      setState(() {
        final List<DepthEntity> bids =
            (FFAppState().depthBids as List<dynamic>).map((item) {
          //print("Processing bid: $item"); // Debug output
          return DepthEntity(
              (item[0] is int
                  ? (item[0] as int).toDouble()
                  : item[0] as double),
              (item[1] is int
                  ? (item[1] as int).toDouble()
                  : item[1] as double));
        }).toList();
        final List<DepthEntity> asks =
            (FFAppState().depthAsks as List<dynamic>).map((item) {
          //print("Processing ask: $item"); // Debug output
          return DepthEntity(
              (item[0] is int
                  ? (item[0] as int).toDouble()
                  : item[0] as double),
              (item[1] is int
                  ? (item[1] as int).toDouble()
                  : item[1] as double));
        }).toList();
        initDepth(bids, asks);
      });
    } else {
      print("Depth data is null, setting bids and asks to null...");
      setState(() {
        _bids = null;
        _asks = null;
      });
    }
  }

  void initDepth(List<DepthEntity> bids, List<DepthEntity> asks) {
    if (bids.isEmpty || asks.isEmpty) {
      _bids = null;
      _asks = null;
      return;
    }
    _bids = [];
    _asks = [];
    double amount = 0.0;
    bids.sort((left, right) => left.price.compareTo(right.price));
    // Accumulate buy volumes
    bids.reversed.forEach((item) {
      amount += item.vol;
      item.vol = amount;
      _bids!.insert(0, item);
    });

    amount = 0.0;
    asks.sort((left, right) => left.price.compareTo(right.price));
    // Accumulate sell volumes
    asks.forEach((item) {
      amount += item.vol;
      item.vol = amount;
      _asks!.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    ChartColors chartColors = ChartColors()
      ..depthBuyColor = Color(0xFF00D3C2)
      ..depthSellColor = Color(0xFFfe6767);

    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: (_bids == null || _asks == null)
          ? Center(
              child: SpinKitDualRing(
                color: Color(0xFF0781E7),
                size: 40.0,
              ),
            )
          : DepthChart(
              _bids!,
              _asks!,
              chartColors,
              fixedLength: 2,
              // Additional parameters can be specified here
            ),
    );
  }
}
