import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'kyc_main_widget.dart' show KycMainWidget;
import 'package:flutter/material.dart';

class KycMainModel extends FlutterFlowModel<KycMainWidget> {
  ///  Local state fields for this page.

  bool update = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList1 = [
    'Animation 1',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers1 = [];
  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList2 = [
    'Comp 1',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers2 = [];
  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList3 = [
    'show',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers3 = [];
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter1;

  @override
  void initState(BuildContext context) {
    for (var name in riveAnimationAnimationsList1) {
      riveAnimationControllers1.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    }

    for (var name in riveAnimationAnimationsList2) {
      riveAnimationControllers2.add(FlutterFlowRiveController(
        name,
      ));
    }

    for (var name in riveAnimationAnimationsList3) {
      riveAnimationControllers3.add(FlutterFlowRiveController(
        name,
      ));
    }
  }

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
