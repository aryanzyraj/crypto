import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'wallet_transfer_wallet_type_widget.dart'
    show WalletTransferWalletTypeWidget;
import 'package:flutter/material.dart';

class WalletTransferWalletTypeModel
    extends FlutterFlowModel<WalletTransferWalletTypeWidget> {
  ///  Local state fields for this component.

  String? walletType;

  String? targetType;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
  String? get radioButtonValue4 => radioButtonValueController4?.value;
}
