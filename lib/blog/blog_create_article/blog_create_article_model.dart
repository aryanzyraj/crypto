import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'blog_create_article_widget.dart' show BlogCreateArticleWidget;
import 'package:flutter/material.dart';

class BlogCreateArticleModel extends FlutterFlowModel<BlogCreateArticleWidget> {
  ///  Local state fields for this page.

  bool imageUploaded = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for categoryDD widget.
  String? categoryDDValue;
  FormFieldController<String>? categoryDDValueController;
  // State field(s) for tagsDD widget.
  List<String>? tagsDDValue;
  FormFieldController<List<String>>? tagsDDValueController;
  // State field(s) for statsusDD widget.
  String? statsusDDValue;
  FormFieldController<String>? statsusDDValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UPLOAD)] action in Container widget.
  ApiCallResponse? apiuploadBlogResult;
  // Stores action output result for [Backend Call - API (blogPOSTposts)] action in Button widget.
  ApiCallResponse? apiPOSTpostResulte;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
