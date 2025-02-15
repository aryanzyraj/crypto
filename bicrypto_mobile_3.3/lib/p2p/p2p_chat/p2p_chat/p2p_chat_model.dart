import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/p2p/p2p_chat/p2pchat_component/p2pchat_component_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'p2p_chat_widget.dart' show P2pChatWidget;
import 'package:flutter/material.dart';

class P2pChatModel extends FlutterFlowModel<P2pChatWidget> {
  ///  Local state fields for this page.

  bool isStatusChanged = false;

  bool isTransactionSubmited = false;

  bool isDispute = false;

  bool isDisputeCancelled = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (POSTCancelTrade)] action in Button widget.
  ApiCallResponse? apiCancelTradeResult;
  // Stores action output result for [Backend Call - API (cancelDispute)] action in Button widget.
  ApiCallResponse? apiCancelDisputeResult;
  // Stores action output result for [Backend Call - API (POSTCancelTrade)] action in Button widget.
  ApiCallResponse? apiSELLERCancelTradeResult;
  // Stores action output result for [Backend Call - API (release)] action in Button widget.
  ApiCallResponse? apiReleaseResult;
  // Stores action output result for [Backend Call - API (release)] action in Button widget.
  ApiCallResponse? apiReleaseResult2;
  // Stores action output result for [Backend Call - API (release)] action in Button widget.
  ApiCallResponse? apiReleaseResult3;
  // Stores action output result for [Backend Call - API (release)] action in Button widget.
  ApiCallResponse? apiReleaseResult4;
  // Stores action output result for [Backend Call - API (release)] action in Button widget.
  ApiCallResponse? apiReleaseResult5;
  // Model for p2pchatComponent component.
  late P2pchatComponentModel p2pchatComponentModel;

  /// Query cache managers for this widget.

  final _profileManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> profile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _profileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfileCache() => _profileManager.clear();
  void clearProfileCacheKey(String? uniqueKey) =>
      _profileManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    p2pchatComponentModel = createModel(context, () => P2pchatComponentModel());
  }

  @override
  void dispose() {
    p2pchatComponentModel.dispose();

    /// Dispose query cache managers for this widget.

    clearProfileCache();
  }
}
