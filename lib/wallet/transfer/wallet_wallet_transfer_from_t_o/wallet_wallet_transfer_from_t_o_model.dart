import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'wallet_wallet_transfer_from_t_o_widget.dart'
    show WalletWalletTransferFromTOWidget;
import 'package:flutter/material.dart';

class WalletWalletTransferFromTOModel
    extends FlutterFlowModel<WalletWalletTransferFromTOWidget> {
  ///  Local state fields for this component.

  String? sourceCurrency;

  String? targetCurrency;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SourceDD widget.
  String? sourceDDValue;
  FormFieldController<String>? sourceDDValueController;
  // State field(s) for TargetDD widget.
  String? targetDDValue;
  FormFieldController<String>? targetDDValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
