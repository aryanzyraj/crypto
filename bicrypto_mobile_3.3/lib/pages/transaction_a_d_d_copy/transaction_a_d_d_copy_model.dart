import '/flutter_flow/flutter_flow_util.dart';
import 'transaction_a_d_d_copy_widget.dart' show TransactionADDCopyWidget;
import 'package:flutter/material.dart';

class TransactionADDCopyModel
    extends FlutterFlowModel<TransactionADDCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u5mttagp' /* Please enter an amount */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
