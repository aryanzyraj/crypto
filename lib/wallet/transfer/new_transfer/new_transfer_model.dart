import '/flutter_flow/flutter_flow_util.dart';
import '/wallet/transfer/new_transfer_component/new_transfer_component_widget.dart';
import 'new_transfer_widget.dart' show NewTransferWidget;
import 'package:flutter/material.dart';

class NewTransferModel extends FlutterFlowModel<NewTransferWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for newTransferComponent component.
  late NewTransferComponentModel newTransferComponentModel1;
  // Model for newTransferComponent component.
  late NewTransferComponentModel newTransferComponentModel2;

  @override
  void initState(BuildContext context) {
    newTransferComponentModel1 =
        createModel(context, () => NewTransferComponentModel());
    newTransferComponentModel2 =
        createModel(context, () => NewTransferComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    newTransferComponentModel1.dispose();
    newTransferComponentModel2.dispose();
  }
}
