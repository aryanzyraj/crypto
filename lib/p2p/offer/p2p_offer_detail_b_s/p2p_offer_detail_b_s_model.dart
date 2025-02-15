import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/p2p/rate_component/rate_component_widget.dart';
import 'p2p_offer_detail_b_s_widget.dart' show P2pOfferDetailBSWidget;
import 'package:flutter/material.dart';

class P2pOfferDetailBSModel extends FlutterFlowModel<P2pOfferDetailBSWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for RateComponent component.
  late RateComponentModel rateComponentModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (POSTtrade)] action in Button widget.
  ApiCallResponse? apiPOSTTradeResult;

  @override
  void initState(BuildContext context) {
    rateComponentModel = createModel(context, () => RateComponentModel());
  }

  @override
  void dispose() {
    rateComponentModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
