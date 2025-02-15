import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ecommerce_reviews_widget.dart' show EcommerceReviewsWidget;
import 'package:flutter/material.dart';

class EcommerceReviewsModel extends FlutterFlowModel<EcommerceReviewsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for empty_state_Simple component.
  late EmptyStateSimpleModel emptyStateSimpleModel;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (POSTreviews)] action in Button widget.
  ApiCallResponse? apiPOSTReviewResult;

  @override
  void initState(BuildContext context) {
    emptyStateSimpleModel = createModel(context, () => EmptyStateSimpleModel());
  }

  @override
  void dispose() {
    emptyStateSimpleModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
