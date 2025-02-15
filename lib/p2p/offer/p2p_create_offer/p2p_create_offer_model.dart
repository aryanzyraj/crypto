import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'p2p_create_offer_widget.dart' show P2pCreateOfferWidget;
import 'package:flutter/material.dart';

class P2pCreateOfferModel extends FlutterFlowModel<P2pCreateOfferWidget> {
  ///  Local state fields for this page.

  bool isCurrencySelected = false;

  List<String> currencies = [];
  void addToCurrencies(String item) => currencies.add(item);
  void removeFromCurrencies(String item) => currencies.remove(item);
  void removeAtIndexFromCurrencies(int index) => currencies.removeAt(index);
  void insertAtIndexInCurrencies(int index, String item) =>
      currencies.insert(index, item);
  void updateCurrenciesAtIndex(int index, Function(String) updateFn) =>
      currencies[index] = updateFn(currencies[index]);

  int? balance;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDownPM widget.
  String? dropDownPMValue;
  FormFieldController<String>? dropDownPMValueController;
  // State field(s) for DropDownWallet widget.
  String? dropDownWalletValue;
  FormFieldController<String>? dropDownWalletValueController;
  // State field(s) for DropDownCurrency widget.
  String? dropDownCurrencyValue;
  FormFieldController<String>? dropDownCurrencyValueController;
  // Stores action output result for [Backend Call - API (GetWalletDetail)] action in DropDownCurrency widget.
  ApiCallResponse? apiWalletResult;
  // State field(s) for DropDownchain widget.
  String? dropDownchainValue;
  FormFieldController<String>? dropDownchainValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6y4fytit' /* Field is required */,
      );
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wdaq595h' /* Field is required */,
      );
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iq6wivg3' /* Field is required */,
      );
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0pfz5oq9' /* Field is required */,
      );
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (POSToffer)] action in Button widget.
  ApiCallResponse? apiPostOfferResult;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    textController4Validator = _textController4Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
