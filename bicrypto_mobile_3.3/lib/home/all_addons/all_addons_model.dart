import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/addon_component/addon_component_widget.dart';
import 'all_addons_widget.dart' show AllAddonsWidget;
import 'package:flutter/material.dart';

class AllAddonsModel extends FlutterFlowModel<AllAddonsWidget> {
  ///  Local state fields for this component.

  bool addonsShow = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Settings)] action in allAddons widget.
  ApiCallResponse? apiSettingResultC;
  // Model for addonComponent component.
  late AddonComponentModel addonComponentModel1;
  // Model for addonComponent component.
  late AddonComponentModel addonComponentModel2;
  // Model for addonComponent component.
  late AddonComponentModel addonComponentModel3;
  // Stores action output result for [Backend Call - API (condition)] action in addonComponent widget.
  ApiCallResponse? apiConditions;
  // Model for addonComponent component.
  late AddonComponentModel addonComponentModel4;
  // Model for addonComponent component.
  late AddonComponentModel addonComponentModel5;
  // Model for addonComponent component.
  late AddonComponentModel addonComponentModel6;
  // Model for addonComponent component.
  late AddonComponentModel addonComponentModel7;
  // Stores action output result for [Backend Call - API (GETaccount)] action in addonComponent widget.
  ApiCallResponse? apiforexaccountResult;
  // Model for addonComponent component.
  late AddonComponentModel addonComponentModel8;
  // Stores action output result for [Backend Call - API (GETinvestment)] action in addonComponent widget.
  ApiCallResponse? apiInvestResult;
  // Model for addonComponent component.
  late AddonComponentModel addonComponentModel9;
  // Model for addonComponent component.
  late AddonComponentModel addonComponentModel10;

  @override
  void initState(BuildContext context) {
    addonComponentModel1 = createModel(context, () => AddonComponentModel());
    addonComponentModel2 = createModel(context, () => AddonComponentModel());
    addonComponentModel3 = createModel(context, () => AddonComponentModel());
    addonComponentModel4 = createModel(context, () => AddonComponentModel());
    addonComponentModel5 = createModel(context, () => AddonComponentModel());
    addonComponentModel6 = createModel(context, () => AddonComponentModel());
    addonComponentModel7 = createModel(context, () => AddonComponentModel());
    addonComponentModel8 = createModel(context, () => AddonComponentModel());
    addonComponentModel9 = createModel(context, () => AddonComponentModel());
    addonComponentModel10 = createModel(context, () => AddonComponentModel());
  }

  @override
  void dispose() {
    addonComponentModel1.dispose();
    addonComponentModel2.dispose();
    addonComponentModel3.dispose();
    addonComponentModel4.dispose();
    addonComponentModel5.dispose();
    addonComponentModel6.dispose();
    addonComponentModel7.dispose();
    addonComponentModel8.dispose();
    addonComponentModel9.dispose();
    addonComponentModel10.dispose();
  }
}
