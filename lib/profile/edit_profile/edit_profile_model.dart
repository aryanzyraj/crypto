import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  bool isPhotoUploaded = false;

  String? url;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in Button-Login widget.
  ApiCallResponse? apiUploadResult;
  // Stores action output result for [Backend Call - API (Profile Edit)] action in Button-Login widget.
  ApiCallResponse? apipostProfileResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
