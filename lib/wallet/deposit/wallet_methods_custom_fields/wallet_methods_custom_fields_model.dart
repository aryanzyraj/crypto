import '/flutter_flow/flutter_flow_util.dart';
import 'wallet_methods_custom_fields_widget.dart'
    show WalletMethodsCustomFieldsWidget;
import 'package:flutter/material.dart';

class WalletMethodsCustomFieldsModel
    extends FlutterFlowModel<WalletMethodsCustomFieldsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
