import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'investment_select_plan_widget.dart' show InvestmentSelectPlanWidget;
import 'package:flutter/material.dart';

class InvestmentSelectPlanModel
    extends FlutterFlowModel<InvestmentSelectPlanWidget> {
  ///  Local state fields for this page.

  bool activePlan = false;

  String? planID;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GETinvestment)] action in investmentSelectPlan widget.
  ApiCallResponse? apInvestment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
