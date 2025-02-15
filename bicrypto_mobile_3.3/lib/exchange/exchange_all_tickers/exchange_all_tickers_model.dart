import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import 'dart:async';
import '/flutter_flow/request_manager.dart';

import 'exchange_all_tickers_widget.dart' show ExchangeAllTickersWidget;
import 'package:flutter/material.dart';

class ExchangeAllTickersModel
    extends FlutterFlowModel<ExchangeAllTickersWidget> {
  ///  Local state fields for this page.

  bool isOpen = true;

  bool isSeached = false;

  int retryCount = 0;

  int maxretries = 5;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (grtAllTickers)] action in exchangeAllTickers widget.
  ApiCallResponse? apiAllTickersResult;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Query cache managers for this widget.

  final _tickersallManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> tickersall({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _tickersallManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTickersallCache() => _tickersallManager.clear();
  void clearTickersallCacheKey(String? uniqueKey) =>
      _tickersallManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    navBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearTickersallCache();
  }
}
