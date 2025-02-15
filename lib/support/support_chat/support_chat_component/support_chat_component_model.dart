import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'support_chat_component_widget.dart' show SupportChatComponentWidget;
import 'package:flutter/material.dart';

class SupportChatComponentModel
    extends FlutterFlowModel<SupportChatComponentWidget> {
  ///  Local state fields for this component.

  bool newmassage = false;

  bool isImageUploaded = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for images widget.
  ScrollController? images;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in IconButton widget.
  ApiCallResponse? apiUploadIMGSupport;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (postChat)] action in IconButton widget.
  ApiCallResponse? apiPOSTSupportChatResult;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    images = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    images?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
