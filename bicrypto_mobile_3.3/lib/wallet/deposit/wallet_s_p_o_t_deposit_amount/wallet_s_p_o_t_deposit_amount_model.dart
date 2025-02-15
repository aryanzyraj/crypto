import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wallet_s_p_o_t_deposit_amount_widget.dart'
    show WalletSPOTDepositAmountWidget;
import 'package:flutter/material.dart';

class WalletSPOTDepositAmountModel
    extends FlutterFlowModel<WalletSPOTDepositAmountWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (spotDeopsit)] action in Button widget.
  ApiCallResponse? apiSpotDepositResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
