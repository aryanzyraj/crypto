import '/backend/api_requests/api_calls.dart';
import '/components/trade_order_book_ask/trade_order_book_ask_widget.dart';
import '/components/trade_orderbook_bids/trade_orderbook_bids_widget.dart';
import '/exchange/a_i_trade/a_i_trade_widget.dart';
import '/exchange/exchanage_order_component/exchanage_order_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import 'exchange_trade_widget.dart' show ExchangeTradeWidget;
import 'package:flutter/material.dart';

class ExchangeTradeModel extends FlutterFlowModel<ExchangeTradeWidget> {
  ///  Local state fields for this page.

  String pair = 'BTC/USDT';

  bool isBuy = true;

  double? lastPrice;

  double? amount;

  double? buyBalance;

  double? sellBalance;

  int? slider;

  String navB = 'Spot';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getPairBalance)] action in exchangeTrade widget.
  ApiCallResponse? apiPairBalance;
  // State field(s) for pairsDD widget.
  String? pairsDDValue;
  FormFieldController<String>? pairsDDValueController;
  // Stores action output result for [Backend Call - API (getPairBalance)] action in pairsDD widget.
  ApiCallResponse? apiPairBalanceDD;
  // Model for TradeOrderBookAsk component.
  late TradeOrderBookAskModel tradeOrderBookAskModel;
  // Model for TradeOrderbookBids component.
  late TradeOrderbookBidsModel tradeOrderbookBidsModel;
  // State field(s) for LimitMarketDropDown widget.
  String? limitMarketDropDownValue;
  FormFieldController<String>? limitMarketDropDownValueController;
  // State field(s) for priceTextField widget.
  FocusNode? priceTextFieldFocusNode;
  TextEditingController? priceTextFieldTextController;
  String? Function(BuildContext, String?)?
      priceTextFieldTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (POSTorders)] action in Button widget.
  ApiCallResponse? apiLimitPostOrder;
  // Stores action output result for [Backend Call - API (POSTorders)] action in Button widget.
  ApiCallResponse? apiMarketPostOrder;
  // Stores action output result for [Backend Call - API (POSTorders)] action in Button widget.
  ApiCallResponse? apiSellLimit;
  // Stores action output result for [Backend Call - API (POSTorders)] action in Button widget.
  ApiCallResponse? apiSellMarket;
  // Model for AITrade component.
  late AITradeModel aITradeModel;
  // Model for exchanageOrderComponent component.
  late ExchanageOrderComponentModel exchanageOrderComponentModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    tradeOrderBookAskModel =
        createModel(context, () => TradeOrderBookAskModel());
    tradeOrderbookBidsModel =
        createModel(context, () => TradeOrderbookBidsModel());
    aITradeModel = createModel(context, () => AITradeModel());
    exchanageOrderComponentModel =
        createModel(context, () => ExchanageOrderComponentModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tradeOrderBookAskModel.dispose();
    tradeOrderbookBidsModel.dispose();
    priceTextFieldFocusNode?.dispose();
    priceTextFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    aITradeModel.dispose();
    exchanageOrderComponentModel.dispose();
    navBarModel.dispose();
  }
}
