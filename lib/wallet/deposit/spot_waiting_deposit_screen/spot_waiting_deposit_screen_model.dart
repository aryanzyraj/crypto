import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'spot_waiting_deposit_screen_widget.dart'
    show SpotWaitingDepositScreenWidget;
import 'package:flutter/material.dart';

class SpotWaitingDepositScreenModel
    extends FlutterFlowModel<SpotWaitingDepositScreenWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList1 = [
    'Comp 1',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers1 = [];
  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList2 = [
    'show',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers2 = [];

  @override
  void initState(BuildContext context) {
    for (var name in riveAnimationAnimationsList1) {
      riveAnimationControllers1.add(FlutterFlowRiveController(
        name,
      ));
    }

    for (var name in riveAnimationAnimationsList2) {
      riveAnimationControllers2.add(FlutterFlowRiveController(
        name,
      ));
    }
  }

  @override
  void dispose() {}
}
