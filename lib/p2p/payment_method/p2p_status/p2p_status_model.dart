import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'p2p_status_widget.dart' show P2pStatusWidget;
import 'package:flutter/material.dart';

class P2pStatusModel extends FlutterFlowModel<P2pStatusWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (EDiTPMStatus)] action in Switch widget.
  ApiCallResponse? apiStatusTrue;
  // Stores action output result for [Backend Call - API (EDiTPMStatus)] action in Switch widget.
  ApiCallResponse? apiStatusFalse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
