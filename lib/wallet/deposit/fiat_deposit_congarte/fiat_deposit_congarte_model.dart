import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'fiat_deposit_congarte_widget.dart' show FiatDepositCongarteWidget;
import 'package:flutter/material.dart';

class FiatDepositCongarteModel
    extends FlutterFlowModel<FiatDepositCongarteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList = [
    'Comp 1',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];

  @override
  void initState(BuildContext context) {
    for (var name in riveAnimationAnimationsList) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
      ));
    }
  }

  @override
  void dispose() {}
}
