import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'all_t_i_c_k_e_r_s_component_copy_widget.dart'
    show AllTICKERSComponentCopyWidget;
import 'package:flutter/material.dart';

class AllTICKERSComponentCopyModel
    extends FlutterFlowModel<AllTICKERSComponentCopyWidget> {
  ///  Local state fields for this component.

  bool isOpen = true;

  bool isSeached = false;

  int retryCount = 0;

  int maxretries = 5;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (grtAllTickers)] action in allTICKERSComponentCopy widget.
  ApiCallResponse? apiAllTickersResult;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
