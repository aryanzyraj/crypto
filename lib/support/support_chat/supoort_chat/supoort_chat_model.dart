import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/support/support_chat/support_chat_component/support_chat_component_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'supoort_chat_widget.dart' show SupoortChatWidget;
import 'package:flutter/material.dart';

class SupoortChatModel extends FlutterFlowModel<SupoortChatWidget> {
  ///  Local state fields for this page.

  bool isStatusChanged = false;

  bool isTransactionSubmited = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (closeTicket)] action in Button widget.
  ApiCallResponse? apicloseResult;
  // Model for supportChatComponent component.
  late SupportChatComponentModel supportChatComponentModel;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;

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
    supportChatComponentModel =
        createModel(context, () => SupportChatComponentModel());
  }

  @override
  void dispose() {
    supportChatComponentModel.dispose();

    /// Dispose query cache managers for this widget.

    clearProfileCache();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
