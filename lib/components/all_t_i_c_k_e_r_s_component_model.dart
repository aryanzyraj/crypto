import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import 'all_t_i_c_k_e_r_s_component_widget.dart' show AllTICKERSComponentWidget;
import 'package:flutter/material.dart';

class AllTICKERSComponentModel
    extends FlutterFlowModel<AllTICKERSComponentWidget> {
  ///  Local state fields for this component.

  bool isOpen = true;

  bool isSeached = false;

  int retryCount = 0;

  int maxretries = 5;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (grtAllTickers)] action in allTICKERSComponent widget.
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

  /// Query cache managers for this widget.

  final _tickersALLManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> tickersALL({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _tickersALLManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTickersALLCache() => _tickersALLManager.clear();
  void clearTickersALLCacheKey(String? uniqueKey) =>
      _tickersALLManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearTickersALLCache();
  }
}
