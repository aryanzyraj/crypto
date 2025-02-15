import '/components/all_t_i_c_k_e_r_s_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import 'exchange_all_tickers_copy_widget.dart'
    show ExchangeAllTickersCopyWidget;
import 'package:flutter/material.dart';

class ExchangeAllTickersCopyModel
    extends FlutterFlowModel<ExchangeAllTickersCopyWidget> {
  ///  Local state fields for this page.

  bool isOpen = true;

  bool isSeached = false;

  int retryCount = 0;

  int maxretries = 5;

  ///  State fields for stateful widgets in this page.

  // Model for allTICKERSComponent component.
  late AllTICKERSComponentModel allTICKERSComponentModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    allTICKERSComponentModel =
        createModel(context, () => AllTICKERSComponentModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    allTICKERSComponentModel.dispose();
    navBarModel.dispose();
  }
}
