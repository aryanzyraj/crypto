import '/flutter_flow/flutter_flow_util.dart';
import 'forex_transactions_widget.dart' show ForexTransactionsWidget;
import 'package:flutter/material.dart';

class ForexTransactionsModel extends FlutterFlowModel<ForexTransactionsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
