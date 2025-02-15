import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  Local state fields for this page.

  bool status = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for OldPassword widget.
  FocusNode? oldPasswordFocusNode;
  TextEditingController? oldPasswordTextController;
  late bool oldPasswordVisibility;
  String? Function(BuildContext, String?)? oldPasswordTextControllerValidator;
  String? _oldPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jtiv2f7c' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  String? _newPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'aurc2fn2' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for conFirmPassword widget.
  FocusNode? conFirmPasswordFocusNode;
  TextEditingController? conFirmPasswordTextController;
  late bool conFirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      conFirmPasswordTextControllerValidator;
  String? _conFirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zppjf253' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Change Password)] action in Button-Login widget.
  ApiCallResponse? apiEditPasswordResult;

  @override
  void initState(BuildContext context) {
    oldPasswordVisibility = false;
    oldPasswordTextControllerValidator = _oldPasswordTextControllerValidator;
    newPasswordVisibility = false;
    newPasswordTextControllerValidator = _newPasswordTextControllerValidator;
    conFirmPasswordVisibility = false;
    conFirmPasswordTextControllerValidator =
        _conFirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    oldPasswordFocusNode?.dispose();
    oldPasswordTextController?.dispose();

    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    conFirmPasswordFocusNode?.dispose();
    conFirmPasswordTextController?.dispose();
  }
}
