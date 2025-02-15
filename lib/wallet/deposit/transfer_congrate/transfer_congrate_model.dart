import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transfer_congrate_widget.dart' show TransferCongrateWidget;
import 'package:flutter/material.dart';

class TransferCongrateModel extends FlutterFlowModel<TransferCongrateWidget> {
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
