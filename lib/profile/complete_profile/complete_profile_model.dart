import '/flutter_flow/flutter_flow_util.dart';
import 'complete_profile_widget.dart' show CompleteProfileWidget;
import 'package:flutter/material.dart';

class CompleteProfileModel extends FlutterFlowModel<CompleteProfileWidget> {
  ///  Local state fields for this page.

  bool isPhotoUploaded = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameTextController1;
  String? Function(BuildContext, String?)? yourNameTextController1Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameTextController2;
  String? Function(BuildContext, String?)? yourNameTextController2Validator;
  // State field(s) for yourAge widget.
  FocusNode? yourAgeFocusNode;
  TextEditingController? yourAgeTextController;
  String? Function(BuildContext, String?)? yourAgeTextControllerValidator;
  // State field(s) for yourTitle widget.
  FocusNode? yourTitleFocusNode;
  TextEditingController? yourTitleTextController;
  String? Function(BuildContext, String?)? yourTitleTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();

    yourAgeFocusNode?.dispose();
    yourAgeTextController?.dispose();

    yourTitleFocusNode?.dispose();
    yourTitleTextController?.dispose();
  }
}
