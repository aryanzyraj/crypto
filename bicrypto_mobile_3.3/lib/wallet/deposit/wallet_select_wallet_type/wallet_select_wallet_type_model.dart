import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'wallet_select_wallet_type_widget.dart'
    show WalletSelectWalletTypeWidget;
import 'package:flutter/material.dart';

class WalletSelectWalletTypeModel
    extends FlutterFlowModel<WalletSelectWalletTypeWidget> {
  ///  Local state fields for this component.

  String? walletType;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
