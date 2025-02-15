import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/kyc/kycmini_driver/kycmini_driver_widget.dart';
import '/kyc/kycmini_n_i_dc/kycmini_n_i_dc_widget.dart';
import '/kyc/kycmini_passport/kycmini_passport_widget.dart';
import 'kyc_form_widget.dart' show KycFormWidget;
import 'package:flutter/material.dart';

class KycFormModel extends FlutterFlowModel<KycFormWidget> {
  ///  Local state fields for this page.

  String? nIDfront;

  String? nIDback;

  String? nIDselfie;

  bool isNIDCopen = false;

  String? passportFront;

  String? passportSelfie;

  bool isPassportOpen = false;

  String? driverFront;

  String? driverSelfie;

  bool isDriverOpen = false;

  List<String> costomTextField = [];
  void addToCostomTextField(String item) => costomTextField.add(item);
  void removeFromCostomTextField(String item) => costomTextField.remove(item);
  void removeAtIndexFromCostomTextField(int index) =>
      costomTextField.removeAt(index);
  void insertAtIndexInCostomTextField(int index, String item) =>
      costomTextField.insert(index, item);
  void updateCostomTextFieldAtIndex(int index, Function(String) updateFn) =>
      costomTextField[index] = updateFn(costomTextField[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  DateTime? datePicked;
  // Model for kycminiNIDc component.
  late KycminiNIDcModel kycminiNIDcModel;
  // Model for kycminiPassport component.
  late KycminiPassportModel kycminiPassportModel;
  // Model for kycminiDriver component.
  late KycminiDriverModel kycminiDriverModel;
  // Stores action output result for [Backend Call - API (POSTkyc)] action in Button widget.
  ApiCallResponse? apiPOSTkycResult;

  @override
  void initState(BuildContext context) {
    kycminiNIDcModel = createModel(context, () => KycminiNIDcModel());
    kycminiPassportModel = createModel(context, () => KycminiPassportModel());
    kycminiDriverModel = createModel(context, () => KycminiDriverModel());
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

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldFocusNode8?.dispose();
    textController8?.dispose();

    textFieldFocusNode9?.dispose();
    textController9?.dispose();

    textFieldFocusNode10?.dispose();
    textController10?.dispose();

    kycminiNIDcModel.dispose();
    kycminiPassportModel.dispose();
    kycminiDriverModel.dispose();
  }
}
