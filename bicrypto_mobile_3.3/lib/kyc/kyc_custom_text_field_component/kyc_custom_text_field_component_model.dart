import '/flutter_flow/flutter_flow_util.dart';
import 'kyc_custom_text_field_component_widget.dart'
    show KycCustomTextFieldComponentWidget;
import 'package:flutter/material.dart';

class KycCustomTextFieldComponentModel
    extends FlutterFlowModel<KycCustomTextFieldComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for costomFieldText widget.
  FocusNode? costomFieldTextFocusNode;
  TextEditingController? costomFieldTextTextController;
  String? Function(BuildContext, String?)?
      costomFieldTextTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    costomFieldTextFocusNode?.dispose();
    costomFieldTextTextController?.dispose();
  }
}
