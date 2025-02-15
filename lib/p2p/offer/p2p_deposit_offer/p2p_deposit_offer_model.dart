import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'p2p_deposit_offer_widget.dart' show P2pDepositOfferWidget;
import 'package:flutter/material.dart';

class P2pDepositOfferModel extends FlutterFlowModel<P2pDepositOfferWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (OfferDeposit)] action in Button widget.
  ApiCallResponse? apiDepositOfferp2p;
  // Stores action output result for [Backend Call - API (OfferWithdraw)] action in Button widget.
  ApiCallResponse? apiDWithdrawOfferp2p;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
