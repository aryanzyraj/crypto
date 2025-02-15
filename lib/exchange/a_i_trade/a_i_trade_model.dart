import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'a_i_trade_widget.dart' show AITradeWidget;
import 'package:flutter/material.dart';

class AITradeModel extends FlutterFlowModel<AITradeWidget> {
  ///  Local state fields for this component.

  bool connected = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getPalns)] action in AITrade widget.
  ApiCallResponse? apiPLANS;
  // State field(s) for planDD widget.
  String? planDDValue;
  FormFieldController<String>? planDDValueController;
  // State field(s) for duartionDD widget.
  String? duartionDDValue;
  FormFieldController<String>? duartionDDValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (postPlan)] action in Button widget.
  ApiCallResponse? apiAiInvest;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    loadingModel.dispose();
  }
}
