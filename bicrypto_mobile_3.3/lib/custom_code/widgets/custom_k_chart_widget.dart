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

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:k_chart/flutter_k_chart.dart';
import 'dart:async';

enum DataState { loading, success, error }

class CustomKChartWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final List<dynamic>? historicalData;
  final bool isLine;
  final bool showVolumes;
  final bool showMA;
  final bool showBOLL;
  final bool showMACD;
  final bool showKDJ;
  final bool showRSI;
  final bool showWR;
  final bool showCCI;
  final bool showNowPrice;
  final bool hideGrid;
  final bool isChinese;
  final bool isTrendLine;
  final bool priceOnRight;
  final int fixedLength;
  final Color upColor;
  final Color dnColor;
  final List<Color> bgColor;
  final Color loadingColor;
  final String duration;
  final bool isLiveMode;

  const CustomKChartWidget({
    Key? key,
    this.width,
    this.height,
    this.historicalData,
    required this.isLine,
    required this.showVolumes,
    required this.showMA,
    required this.showBOLL,
    required this.showMACD,
    required this.showKDJ,
    required this.showRSI,
    required this.showWR,
    required this.showCCI,
    required this.showNowPrice,
    required this.hideGrid,
    required this.isChinese,
    required this.isTrendLine,
    required this.priceOnRight,
    required this.fixedLength,
    required this.upColor,
    required this.dnColor,
    required this.bgColor,
    this.loadingColor = Colors.red,
    required this.duration,
    this.isLiveMode = false,
  }) : super(key: key);

  @override
  State<CustomKChartWidget> createState() => _CustomKChartWidgetState();
}

class _CustomKChartWidgetState extends State<CustomKChartWidget> {
  late DataState dataState = DataState.loading;
  List<KLineEntity> data = [];
  late ChartColors chartColors;
  dynamic lastOHLCVData;
  bool get _isLiveOrShortInterval =>
      widget.isLiveMode || widget.duration == '1s';

  @override
  void initState() {
    super.initState();
    chartColors = ChartColors()
      ..upColor = widget.upColor
      ..dnColor = widget.dnColor
      ..bgColor = widget.bgColor;
    initializeData();
    _startDataUpdateListener();
    FFAppState().addListener(_onOHLCVDataChanged);
    lastOHLCVData = FFAppState().ohlcv;
  }

  void initializeData() {
    setState(() => dataState = DataState.loading);
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      if (widget.historicalData != null) {
        data = widget.historicalData!
            .map<KLineEntity>(
                (e) => KLineEntity.fromJson(e as Map<String, dynamic>))
            .toList();
        DataUtil.calculate(data);
        if (mounted) setState(() => dataState = DataState.success);
      } else {
        if (mounted) setState(() => dataState = DataState.loading);
      }
    });
  }

  @override
  void dispose() {
    FFAppState().removeListener(_onOHLCVDataChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomKChartWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      initializeData();
    }
  }

  void _onOHLCVDataChanged() {
    var currentOHLCVData = FFAppState().ohlcv;
    if (currentOHLCVData != lastOHLCVData) {
      _updateChartData(currentOHLCVData);
      lastOHLCVData = currentOHLCVData;
    }
  }

  void _startDataUpdateListener() {
    dynamic ohlcvData = FFAppState().ohlcv;
    if (ohlcvData != null) {
      _updateChartData(ohlcvData);
    }
  }

  Map<String, int> durationMap = {
    '1s': 1000,
    '1m': 60000,
    '3m': 180000,
    '5m': 300000,
    '15m': 900000,
    '30m': 1800000,
    '1h': 3600000,
    '2h': 7200000,
    '4h': 14400000,
    '6h': 21600000,
    '8h': 28800000,
    '12h': 43200000,
    '1d': 86400000,
  };

  void _updateChartData(dynamic ohlcvData) {
    if (ohlcvData == null) return;

    int currentTime =
        ohlcvData['timestamp'] ?? DateTime.now().toUtc().millisecondsSinceEpoch;

    if (data.isNotEmpty) {
      KLineEntity lastEntry = data.last;
      int lastCandleStartTime = lastEntry.time ?? currentTime;
      int candleDurationInMillis = durationMap[widget.duration] ?? 3600000;

      if (_isLiveOrShortInterval ||
          currentTime >= lastCandleStartTime + candleDurationInMillis) {
        // Create a new entry for live mode or when a new candle should start
        KLineEntity newEntry = KLineEntity.fromCustom(
          time: currentTime,
          open: ohlcvData['open']?.toDouble() ?? lastEntry.close,
          high: ohlcvData['high']?.toDouble() ?? lastEntry.close,
          low: ohlcvData['low']?.toDouble() ?? lastEntry.close,
          close: ohlcvData['close']?.toDouble() ?? lastEntry.close,
          vol: _isLiveOrShortInterval
              ? 0
              : (ohlcvData['volume']?.toDouble() ?? 0),
        );
        data.add(newEntry);

        // Limit the number of data points for performance in live mode
        if (_isLiveOrShortInterval && data.length > 300) {
          data.removeAt(0);
        }
      } else {
        // Update the last candle for non-live mode
        lastEntry.close = ohlcvData['close']?.toDouble() ?? lastEntry.close;
        lastEntry.high = max(
            lastEntry.high, ohlcvData['high']?.toDouble() ?? lastEntry.high);
        lastEntry.low =
            min(lastEntry.low, ohlcvData['low']?.toDouble() ?? lastEntry.low);
        if (!_isLiveOrShortInterval) {
          lastEntry.vol = ohlcvData['volume']?.toDouble() ?? lastEntry.vol;
        }
      }

      setState(() {});
      DataUtil.calculate(data);
    } else if (ohlcvData != null) {
      // If data is empty, create the first entry
      KLineEntity firstEntry = KLineEntity.fromCustom(
        time: currentTime,
        open: ohlcvData['open']?.toDouble() ?? 0,
        high: ohlcvData['high']?.toDouble() ?? 0,
        low: ohlcvData['low']?.toDouble() ?? 0,
        close: ohlcvData['close']?.toDouble() ?? 0,
        vol:
            _isLiveOrShortInterval ? 0 : (ohlcvData['volume']?.toDouble() ?? 0),
      );
      data.add(firstEntry);
      setState(() {});
      DataUtil.calculate(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: Center(
        child: _buildContentBasedOnState(),
      ),
    );
  }

  Widget _buildContentBasedOnState() {
    if (dataState == DataState.loading || widget.historicalData == null) {
      return SpinKitDoubleBounce(
        color: widget.loadingColor,
        size: 40.0,
      );
    } else if (dataState == DataState.error) {
      return Text('Error loading data', style: TextStyle(color: Colors.red));
    } else if (dataState == DataState.success) {
      return renderChart();
    } else {
      return Text('Unexpected state');
    }
  }

  Widget renderChart() {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: KChartWidget(
        data,
        ChartStyle(),
        chartColors,
        isLine: widget.isLine || _isLiveOrShortInterval,
        mainState: _getMainState(),
        volHidden: !widget.showVolumes || _isLiveOrShortInterval,
        secondaryState: _getSecondaryState(),
        fixedLength: widget.fixedLength,
        timeFormat: TimeFormat.YEAR_MONTH_DAY,
        isChinese: widget.isChinese,
        hideGrid: widget.hideGrid,
        showNowPrice: widget.showNowPrice,
        isTrendLine: widget.isTrendLine,
        verticalTextAlignment: _getVerticalTextAlignment(),
      ),
    );
  }

  MainState _getMainState() {
    if (widget.showMA) return MainState.MA;
    if (widget.showBOLL) return MainState.BOLL;
    return MainState.NONE;
  }

  SecondaryState _getSecondaryState() {
    if (widget.showMACD) return SecondaryState.MACD;
    if (widget.showKDJ) return SecondaryState.KDJ;
    if (widget.showRSI) return SecondaryState.RSI;
    if (widget.showWR) return SecondaryState.WR;
    if (widget.showCCI) return SecondaryState.CCI;
    return SecondaryState.NONE;
  }

  VerticalTextAlignment _getVerticalTextAlignment() {
    return widget.priceOnRight
        ? VerticalTextAlignment.right
        : VerticalTextAlignment.left;
  }
}
