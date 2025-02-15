import '/flutter_flow/flutter_flow_util.dart';
import 'faq_index_widget.dart' show FaqIndexWidget;
import 'package:flutter/material.dart';

class FaqIndexModel extends FlutterFlowModel<FaqIndexWidget> {
  ///  State fields for stateful widgets in this page.

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
