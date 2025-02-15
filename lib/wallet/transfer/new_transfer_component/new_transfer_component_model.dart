import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_transfer_component_widget.dart' show NewTransferComponentWidget;
import 'package:flutter/material.dart';

class NewTransferComponentModel
    extends FlutterFlowModel<NewTransferComponentWidget> {
  ///  Local state fields for this component.

  List<String> emptyList = [];
  void addToEmptyList(String item) => emptyList.add(item);
  void removeFromEmptyList(String item) => emptyList.remove(item);
  void removeAtIndexFromEmptyList(int index) => emptyList.removeAt(index);
  void insertAtIndexInEmptyList(int index, String item) =>
      emptyList.insert(index, item);
  void updateEmptyListAtIndex(int index, Function(String) updateFn) =>
      emptyList[index] = updateFn(emptyList[index]);

  bool apiWalletCurrencyFetched = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ClientId widget.
  FocusNode? clientIdFocusNode;
  TextEditingController? clientIdTextController;
  String? Function(BuildContext, String?)? clientIdTextControllerValidator;
  // State field(s) for walletDD widget.
  String? walletDDValue;
  FormFieldController<String>? walletDDValueController;
  // Stores action output result for [Backend Call - API (GetWalletCurrencies)] action in walletDD widget.
  ApiCallResponse? apiWalletCurrency;
  // State field(s) for targetDD widget.
  String? targetDDValue;
  FormFieldController<String>? targetDDValueController;
  // Stores action output result for [Backend Call - API (GetWalletCurrencies)] action in targetDD widget.
  ApiCallResponse? apiWalletCurrencyTarget;
  // State field(s) for currencyDD widget.
  String? currencyDDValue;
  FormFieldController<String>? currencyDDValueController;
  // State field(s) for targetcurrencyDD widget.
  String? targetcurrencyDDValue;
  FormFieldController<String>? targetcurrencyDDValueController;
  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // Stores action output result for [Backend Call - API (walletTransfer)] action in Button widget.
  ApiCallResponse? apiTransferWallet;
  // Stores action output result for [Backend Call - API (walletTransfer)] action in Button widget.
  ApiCallResponse? apiTransferClient;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    clientIdFocusNode?.dispose();
    clientIdTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
