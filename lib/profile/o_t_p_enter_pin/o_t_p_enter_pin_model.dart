import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'o_t_p_enter_pin_widget.dart' show OTPEnterPinWidget;
import 'package:flutter/material.dart';

class OTPEnterPinModel extends FlutterFlowModel<OTPEnterPinWidget> {
  ///  Local state fields for this component.

  String? secret;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (OTPVerify)] action in Button widget.
  ApiCallResponse? apiVerifyOtpResult;
  // Stores action output result for [Backend Call - API (OTPGenerate)] action in Text widget.
  ApiCallResponse? apiRGenerateOtpResult;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
