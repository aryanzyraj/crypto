import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wallet/transfer/wallet_transfer_wallet_type/wallet_transfer_wallet_type_widget.dart';
import '/wallet/transfer/wallet_wallet_transfer_from_t_o/wallet_wallet_transfer_from_t_o_widget.dart';
import 'wallet_transfer_widget.dart' show WalletTransferWidget;
import 'package:flutter/material.dart';

class WalletTransferModel extends FlutterFlowModel<WalletTransferWidget> {
  ///  Local state fields for this page.

  String walletType = 'FIAT';

  String? sourceCurrency = '';

  String targetType = 'SPOT';

  String? targetCurrency;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for Wallet_TransferWalletType component.
  late WalletTransferWalletTypeModel walletTransferWalletTypeModel;
  // Model for Wallet_WalletTransferFromTO component.
  late WalletWalletTransferFromTOModel walletWalletTransferFromTOModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (walletTransfer)] action in Button widget.
  ApiCallResponse? apiTransferResult;

  @override
  void initState(BuildContext context) {
    walletTransferWalletTypeModel =
        createModel(context, () => WalletTransferWalletTypeModel());
    walletWalletTransferFromTOModel =
        createModel(context, () => WalletWalletTransferFromTOModel());
  }

  @override
  void dispose() {
    walletTransferWalletTypeModel.dispose();
    walletWalletTransferFromTOModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
