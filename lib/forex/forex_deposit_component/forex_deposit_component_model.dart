import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'forex_deposit_component_widget.dart' show ForexDepositComponentWidget;
import 'package:flutter/material.dart';

class ForexDepositComponentModel
    extends FlutterFlowModel<ForexDepositComponentWidget> {
  ///  Local state fields for this component.

  bool wallTypeSelected = false;

  bool currencytSelected = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for wallDD widget.
  String? wallDDValue;
  FormFieldController<String>? wallDDValueController;
  // Stores action output result for [Backend Call - API (GetWalletCurrencies)] action in wallDD widget.
  ApiCallResponse? apiWalletCurrency;
  // State field(s) for CurrencyDDD widget.
  String? currencyDDDValue;
  FormFieldController<String>? currencyDDDValueController;
  // Stores action output result for [Backend Call - API (GetWalletSingleCurrency)] action in CurrencyDDD widget.
  ApiCallResponse? apiCurrencyResult;
  // State field(s) for chainDD widget.
  String? chainDDValue;
  FormFieldController<String>? chainDDValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (forexDeposit)] action in Button widget.
  ApiCallResponse? apiDepositResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
