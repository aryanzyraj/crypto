import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kycmini_passport_widget.dart' show KycminiPassportWidget;
import 'package:flutter/material.dart';

class KycminiPassportModel extends FlutterFlowModel<KycminiPassportWidget> {
  ///  Local state fields for this component.

  bool photofrontNotuploaded = true;

  bool photoSelfiwNotuploaded = true;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in Icon widget.
  ApiCallResponse? apiUploadFPassportResult;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in Icon widget.
  ApiCallResponse? apiUploadSPassportResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
