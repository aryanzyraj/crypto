import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/exchange/chart_colors_component/chart_colors_component_widget.dart';
import '/exchange/recent_trades/recent_trades_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/shimmer/shimmer_market_single_ticker/shimmer_market_single_ticker_widget.dart';
import 'exchange_chart_widget.dart' show ExchangeChartWidget;
import 'package:flutter/material.dart';

class ExchangeChartModel extends FlutterFlowModel<ExchangeChartWidget> {
  ///  Local state fields for this page.

  dynamic dataHistorical;

  bool updatechart = false;

  Color upCandle = const Color(0xff36c9b8);

  List<Color> back = [const Color(0x00000000), const Color(0x00000000)];
  void addToBack(Color item) => back.add(item);
  void removeFromBack(Color item) => back.remove(item);
  void removeAtIndexFromBack(int index) => back.removeAt(index);
  void insertAtIndexInBack(int index, Color item) => back.insert(index, item);
  void updateBackAtIndex(int index, Function(Color) updateFn) =>
      back[index] = updateFn(back[index]);

  Color downCandle = const Color(0xfff06a6a);

  bool isLine = false;

  bool volume = true;

  bool ma = false;

  bool boll = false;

  bool macd = false;

  bool kdj = false;

  bool rsi = false;

  bool wr = false;

  bool cci = false;

  bool nowPrice = true;

  bool grid = false;

  bool trendLine = false;

  bool priceOnRight = true;

  String dataState = 'success';

  int retryCount = 0;

  int maxRetries = 5;

  bool reload = false;

  bool closeWS = false;

  int? durations;

  bool live = false;

  dynamic analysis;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Historical)] action in exchangeChart widget.
  ApiCallResponse? historical;
  // Model for shimmerMarketSingleTicker component.
  late ShimmerMarketSingleTickerModel shimmerMarketSingleTickerModel;
  // State field(s) for ChoiceChipsIntervals widget.
  FormFieldController<List<String>>? choiceChipsIntervalsValueController;
  String? get choiceChipsIntervalsValue =>
      choiceChipsIntervalsValueController?.value?.firstOrNull;
  set choiceChipsIntervalsValue(String? val) =>
      choiceChipsIntervalsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (Historical)] action in ChoiceChipsIntervals widget.
  ApiCallResponse? historicalDD;
  // Model for Loading component.
  late LoadingModel loadingModel1;
  // State field(s) for Mstate widget.
  FormFieldController<List<String>>? mstateValueController;
  String? get mstateValue => mstateValueController?.value?.firstOrNull;
  set mstateValue(String? val) =>
      mstateValueController?.value = val != null ? [val] : [];
  // State field(s) for Sstate widget.
  FormFieldController<List<String>>? sstateValueController;
  String? get sstateValue => sstateValueController?.value?.firstOrNull;
  set sstateValue(String? val) =>
      sstateValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for recentTrades component.
  late RecentTradesModel recentTradesModel;
  // Model for Loading component.
  late LoadingModel loadingModel2;
  // Model for chartColorsComponent component.
  late ChartColorsComponentModel chartColorsComponentModel;

  @override
  void initState(BuildContext context) {
    shimmerMarketSingleTickerModel =
        createModel(context, () => ShimmerMarketSingleTickerModel());
    loadingModel1 = createModel(context, () => LoadingModel());
    recentTradesModel = createModel(context, () => RecentTradesModel());
    loadingModel2 = createModel(context, () => LoadingModel());
    chartColorsComponentModel =
        createModel(context, () => ChartColorsComponentModel());
  }

  @override
  void dispose() {
    shimmerMarketSingleTickerModel.dispose();
    loadingModel1.dispose();
    recentTradesModel.dispose();
    loadingModel2.dispose();
    chartColorsComponentModel.dispose();
  }
}
