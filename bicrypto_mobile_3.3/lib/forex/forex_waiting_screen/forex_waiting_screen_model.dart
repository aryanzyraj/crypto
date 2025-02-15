import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'forex_waiting_screen_widget.dart' show ForexWaitingScreenWidget;
import 'package:flutter/material.dart';

class ForexWaitingScreenModel
    extends FlutterFlowModel<ForexWaitingScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList = [
    'Animation 1',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];

  @override
  void initState(BuildContext context) {
    for (var name in riveAnimationAnimationsList) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    }
  }

  @override
  void dispose() {}
}
