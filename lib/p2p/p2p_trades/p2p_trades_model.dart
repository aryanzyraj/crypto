import '/flutter_flow/flutter_flow_util.dart';
import '/p2p/p2p_main_drpdown/p2p_main_drpdown_widget.dart';
import 'p2p_trades_widget.dart' show P2pTradesWidget;
import 'package:flutter/material.dart';

class P2pTradesModel extends FlutterFlowModel<P2pTradesWidget> {
  ///  Local state fields for this page.

  bool dropDownState = false;

  ///  State fields for stateful widgets in this page.

  // Model for p2pMainDrpdown component.
  late P2pMainDrpdownModel p2pMainDrpdownModel;

  @override
  void initState(BuildContext context) {
    p2pMainDrpdownModel = createModel(context, () => P2pMainDrpdownModel());
  }

  @override
  void dispose() {
    p2pMainDrpdownModel.dispose();
  }
}
