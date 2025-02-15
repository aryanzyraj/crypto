import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'p2p_dispute_trade_widget.dart' show P2pDisputeTradeWidget;
import 'package:flutter/material.dart';

class P2pDisputeTradeModel extends FlutterFlowModel<P2pDisputeTradeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (disput)] action in Button widget.
  ApiCallResponse? apiDisputeResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
