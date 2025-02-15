import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'stake_btm_sheet_widget.dart' show StakeBtmSheetWidget;
import 'package:flutter/material.dart';

class StakeBtmSheetModel extends FlutterFlowModel<StakeBtmSheetWidget> {
  ///  Local state fields for this component.

  int interestrate = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (postStack)] action in Button widget.
  ApiCallResponse? apipostStakeResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
