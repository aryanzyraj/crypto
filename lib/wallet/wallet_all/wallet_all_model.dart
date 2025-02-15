import '/flutter_flow/flutter_flow_util.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import 'wallet_all_widget.dart' show WalletAllWidget;
import 'package:flutter/material.dart';

class WalletAllModel extends FlutterFlowModel<WalletAllWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
