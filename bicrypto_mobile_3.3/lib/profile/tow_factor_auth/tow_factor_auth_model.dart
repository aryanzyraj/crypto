import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tow_factor_auth_widget.dart' show TowFactorAuthWidget;
import 'package:flutter/material.dart';

class TowFactorAuthModel extends FlutterFlowModel<TowFactorAuthWidget> {
  ///  Local state fields for this page.

  String? secret;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (OTPGenerate)] action in Container widget.
  ApiCallResponse? apiResult2v4;
  // Stores action output result for [Backend Call - API (OTPGenerate)] action in Container widget.
  ApiCallResponse? apiOTPGenerateEmail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
