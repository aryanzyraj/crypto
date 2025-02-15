import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kycmini_n_i_dc_widget.dart' show KycminiNIDcWidget;
import 'package:flutter/material.dart';

class KycminiNIDcModel extends FlutterFlowModel<KycminiNIDcWidget> {
  ///  Local state fields for this component.

  bool photofrontNotuploaded = true;

  bool photoBackNotuploaded = true;

  bool photoSelfieNotuploaded = true;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in Icon widget.
  ApiCallResponse? apiUploadFNIDResult;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in Icon widget.
  ApiCallResponse? apiUploadBNIDResult;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in Icon widget.
  ApiCallResponse? apiUploadSNIDResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
