import '/flutter_flow/flutter_flow_util.dart';
import '/wallet/deposit/wallet_select_funding_currency/wallet_select_funding_currency_widget.dart';
import '/wallet/deposit/wallet_select_payment_e_c_o/wallet_select_payment_e_c_o_widget.dart';
import '/wallet/deposit/wallet_select_payment_fiat/wallet_select_payment_fiat_widget.dart';
import '/wallet/deposit/wallet_select_payment_spot/wallet_select_payment_spot_widget.dart';
import '/wallet/deposit/wallet_select_wallet_type/wallet_select_wallet_type_widget.dart';
import 'wallet_deposit_widget.dart' show WalletDepositWidget;
import 'package:flutter/material.dart';

class WalletDepositModel extends FlutterFlowModel<WalletDepositWidget> {
  ///  Local state fields for this page.

  String? walletType = '';

  String? currency = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for Wallet_SelectWalletType component.
  late WalletSelectWalletTypeModel walletSelectWalletTypeModel;
  // Model for Wallet_SelectFundingCurrency component.
  late WalletSelectFundingCurrencyModel walletSelectFundingCurrencyModel;
  // Model for WalletSelectPaymentFiat component.
  late WalletSelectPaymentFiatModel walletSelectPaymentFiatModel;
  // Model for WalletSelectPaymentSpot component.
  late WalletSelectPaymentSpotModel walletSelectPaymentSpotModel;
  // Model for WalletSelectPaymentECO component.
  late WalletSelectPaymentECOModel walletSelectPaymentECOModel;

  @override
  void initState(BuildContext context) {
    walletSelectWalletTypeModel =
        createModel(context, () => WalletSelectWalletTypeModel());
    walletSelectFundingCurrencyModel =
        createModel(context, () => WalletSelectFundingCurrencyModel());
    walletSelectPaymentFiatModel =
        createModel(context, () => WalletSelectPaymentFiatModel());
    walletSelectPaymentSpotModel =
        createModel(context, () => WalletSelectPaymentSpotModel());
    walletSelectPaymentECOModel =
        createModel(context, () => WalletSelectPaymentECOModel());
  }

  @override
  void dispose() {
    walletSelectWalletTypeModel.dispose();
    walletSelectFundingCurrencyModel.dispose();
    walletSelectPaymentFiatModel.dispose();
    walletSelectPaymentSpotModel.dispose();
    walletSelectPaymentECOModel.dispose();
  }
}
