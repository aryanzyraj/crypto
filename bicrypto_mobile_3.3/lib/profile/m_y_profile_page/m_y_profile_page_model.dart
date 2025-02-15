import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import '/profile/light_dark_switch_component/light_dark_switch_component_widget.dart';
import 'm_y_profile_page_widget.dart' show MYProfilePageWidget;
import 'package:flutter/material.dart';

class MYProfilePageModel extends FlutterFlowModel<MYProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Logout)] action in IconButton widget.
  ApiCallResponse? apiLogoutResult;
  // Model for LightDarkSwitchComponent component.
  late LightDarkSwitchComponentModel lightDarkSwitchComponentModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    lightDarkSwitchComponentModel =
        createModel(context, () => LightDarkSwitchComponentModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    lightDarkSwitchComponentModel.dispose();
    navBarModel.dispose();
  }
}
