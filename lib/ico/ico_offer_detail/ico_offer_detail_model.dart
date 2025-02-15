import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ico_offer_detail_widget.dart' show IcoOfferDetailWidget;
import 'package:flutter/material.dart';

class IcoOfferDetailModel extends FlutterFlowModel<IcoOfferDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (icoContributionsPOST)] action in IconButton widget.
  ApiCallResponse? apiAmountPostResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
