import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 's_m_s_auth_widget.dart' show SMSAuthWidget;
import 'package:flutter/material.dart';

class SMSAuthModel extends FlutterFlowModel<SMSAuthWidget> {
  ///  Local state fields for this page.

  String? secret;

  ///  State fields for stateful widgets in this page.

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // Stores action output result for [Backend Call - API (OTPGenerate)] action in continueBTN widget.
  ApiCallResponse? apiGenerateOtp;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
