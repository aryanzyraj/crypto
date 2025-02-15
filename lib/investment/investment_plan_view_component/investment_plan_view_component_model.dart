import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'investment_plan_view_component_widget.dart'
    show InvestmentPlanViewComponentWidget;
import 'package:flutter/material.dart';

class InvestmentPlanViewComponentModel
    extends FlutterFlowModel<InvestmentPlanViewComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kzdotpzj' /* Ceck Min Amount */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (POSTinvestment)] action in Button widget.
  ApiCallResponse? apiPOSTinvestmentResult;

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
