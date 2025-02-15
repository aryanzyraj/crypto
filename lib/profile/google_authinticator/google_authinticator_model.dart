import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'google_authinticator_widget.dart' show GoogleAuthinticatorWidget;
import 'package:flutter/material.dart';

class GoogleAuthinticatorModel
    extends FlutterFlowModel<GoogleAuthinticatorWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (OTPVerify)] action in Button widget.
  ApiCallResponse? apiOtpVerify;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
