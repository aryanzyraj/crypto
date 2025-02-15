import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'p2p_submit_transaction_id_widget.dart'
    show P2pSubmitTransactionIdWidget;
import 'package:flutter/material.dart';

class P2pSubmitTransactionIdModel
    extends FlutterFlowModel<P2pSubmitTransactionIdWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (POSTTransaction)] action in Button widget.
  ApiCallResponse? apiMAPResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
