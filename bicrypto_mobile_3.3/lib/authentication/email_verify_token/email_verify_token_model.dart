import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'email_verify_token_widget.dart' show EmailVerifyTokenWidget;
import 'package:flutter/material.dart';

class EmailVerifyTokenModel extends FlutterFlowModel<EmailVerifyTokenWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (VerifyEmailToken)] action in Button widget.
  ApiCallResponse? apiEmailVerifyToken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
