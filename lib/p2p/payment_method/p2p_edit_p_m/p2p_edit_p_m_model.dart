import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'p2p_edit_p_m_widget.dart' show P2pEditPMWidget;
import 'package:flutter/material.dart';

class P2pEditPMModel extends FlutterFlowModel<P2pEditPMWidget> {
  ///  Local state fields for this page.

  bool isimageUploaded = false;

  String? imageurl;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in Container widget.
  ApiCallResponse? apiUploadImageResult;
  // Stores action output result for [Backend Call - API (PUTEditPaymentMethode)] action in Button widget.
  ApiCallResponse? apiEDITpmResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
