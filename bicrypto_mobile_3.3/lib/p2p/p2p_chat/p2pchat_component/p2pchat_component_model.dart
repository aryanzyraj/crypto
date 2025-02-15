import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'p2pchat_component_widget.dart' show P2pchatComponentWidget;
import 'package:flutter/material.dart';

class P2pchatComponentModel extends FlutterFlowModel<P2pchatComponentWidget> {
  ///  Local state fields for this component.

  bool newmassage = false;

  bool isImageUploaded = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for wsListView widget.
  ScrollController? wsListView;
  // State field(s) for images widget.
  ScrollController? images;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in IconButton widget.
  ApiCallResponse? apiUploadchatimageResult;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
    wsListView = ScrollController();
    images = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    listViewController?.dispose();
    wsListView?.dispose();
    images?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
