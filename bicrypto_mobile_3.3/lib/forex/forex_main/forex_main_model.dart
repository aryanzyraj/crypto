import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'forex_main_widget.dart' show ForexMainWidget;
import 'package:flutter/material.dart';

class ForexMainModel extends FlutterFlowModel<ForexMainWidget> {
  ///  Local state fields for this page.

  bool demoHidePassword = false;

  bool liveHidePassword = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (GETForxTransactiosn)] action in IconButton widget.
  ApiCallResponse? apiForexTRX;
  // Stores action output result for [Backend Call - API (GETinvestment)] action in Button widget.
  ApiCallResponse? apiGetInvestment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
