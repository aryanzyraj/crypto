import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'p2p_creat_p_m_widget.dart' show P2pCreatPMWidget;
import 'package:flutter/material.dart';

class P2pCreatPMModel extends FlutterFlowModel<P2pCreatPMWidget> {
  ///  Local state fields for this page.

  bool isimageUploaded = false;

  String? imageurl;

  List<String> currencies = [];
  void addToCurrencies(String item) => currencies.add(item);
  void removeFromCurrencies(String item) => currencies.remove(item);
  void removeAtIndexFromCurrencies(int index) => currencies.removeAt(index);
  void insertAtIndexInCurrencies(int index, String item) =>
      currencies.insert(index, item);
  void updateCurrenciesAtIndex(int index, Function(String) updateFn) =>
      currencies[index] = updateFn(currencies[index]);

  bool isCurrencySelected = false;

  String status = 'false';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDownWallet widget.
  String? dropDownWalletValue;
  FormFieldController<String>? dropDownWalletValueController;
  // State field(s) for DropDownCurrency widget.
  String? dropDownCurrencyValue;
  FormFieldController<String>? dropDownCurrencyValueController;
  // State field(s) for DropDownchain widget.
  String? dropDownchainValue;
  FormFieldController<String>? dropDownchainValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in Container widget.
  ApiCallResponse? apiUploadImageResult;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (POSTcreatePaymentMethode)] action in Button widget.
  ApiCallResponse? apiPOSTpmResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
