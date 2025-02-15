import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wallet_fiat_deposit_amount_widget.dart'
    show WalletFiatDepositAmountWidget;
import 'package:flutter/material.dart';

class WalletFiatDepositAmountModel
    extends FlutterFlowModel<WalletFiatDepositAmountWidget> {
  ///  Local state fields for this component.

  List<String> customFields = [];
  void addToCustomFields(String item) => customFields.add(item);
  void removeFromCustomFields(String item) => customFields.remove(item);
  void removeAtIndexFromCustomFields(int index) => customFields.removeAt(index);
  void insertAtIndexInCustomFields(int index, String item) =>
      customFields.insert(index, item);
  void updateCustomFieldsAtIndex(int index, Function(String) updateFn) =>
      customFields[index] = updateFn(customFields[index]);

  dynamic cfreult;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (fiatDeposit)] action in Button widget.
  ApiCallResponse? apiFIATdeposit;
  // Stores action output result for [Backend Call - API (fiatWithdraw)] action in Button widget.
  ApiCallResponse? apiFIATWithdraw;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
