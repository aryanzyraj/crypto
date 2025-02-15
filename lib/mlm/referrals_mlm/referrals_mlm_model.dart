import '/backend/api_requests/api_calls.dart';
import '/components/emptysearch_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mlm/condition_swap/condition_swap_widget.dart';
import '/mlm/referrals/referrals_widget.dart';
import 'referrals_mlm_widget.dart' show ReferralsMlmWidget;
import 'package:flutter/material.dart';

class ReferralsMlmModel extends FlutterFlowModel<ReferralsMlmWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for conditionSwap component.
  late ConditionSwapModel conditionSwapModel1;
  // Model for emptysearch component.
  late EmptysearchModel emptysearchModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for referrals component.
  late ReferralsModel referralsModel;
  // Model for emptysearch component.
  late EmptysearchModel emptysearchModel2;
  // Model for conditionSwap component.
  late ConditionSwapModel conditionSwapModel2;
  // Stores action output result for [Backend Call - API (node)] action in Button widget.
  ApiCallResponse? apiNODE;

  @override
  void initState(BuildContext context) {
    conditionSwapModel1 = createModel(context, () => ConditionSwapModel());
    emptysearchModel1 = createModel(context, () => EmptysearchModel());
    referralsModel = createModel(context, () => ReferralsModel());
    emptysearchModel2 = createModel(context, () => EmptysearchModel());
    conditionSwapModel2 = createModel(context, () => ConditionSwapModel());
  }

  @override
  void dispose() {
    conditionSwapModel1.dispose();
    emptysearchModel1.dispose();
    tabBarController?.dispose();
    referralsModel.dispose();
    emptysearchModel2.dispose();
    conditionSwapModel2.dispose();
  }
}
