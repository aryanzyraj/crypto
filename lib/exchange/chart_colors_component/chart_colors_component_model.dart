import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'chart_colors_component_widget.dart' show ChartColorsComponentWidget;
import 'package:flutter/material.dart';

class ChartColorsComponentModel
    extends FlutterFlowModel<ChartColorsComponentWidget> {
  ///  Local state fields for this component.

  Color upCandle = const Color(0xff36c9b8);

  Color downCandle = const Color(0xfff06a6a);

  int hight = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  Color? colorPicked1;
  Color? colorPicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
