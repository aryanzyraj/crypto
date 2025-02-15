import '/backend/api_requests/api_calls.dart';
import '/components/emptysearch_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exchanage_order_component_widget.dart'
    show ExchanageOrderComponentWidget;
import 'package:flutter/material.dart';

class ExchanageOrderComponentModel
    extends FlutterFlowModel<ExchanageOrderComponentWidget> {
  ///  Local state fields for this component.

  bool openConnected = false;

  bool historyConnected = false;

  bool aiConnected = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GETOrders)] action in exchanageOrderComponent widget.
  ApiCallResponse? apiOPEN;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for emptysearch component.
  late EmptysearchModel emptysearchModel1;
  // Stores action output result for [Backend Call - API (GETOrders)] action in Tab widget.
  ApiCallResponse? apiOrderHistory;
  // Model for emptysearch component.
  late EmptysearchModel emptysearchModel2;
  // Stores action output result for [Backend Call - API (getLog)] action in Tab widget.
  ApiCallResponse? apiLogResult;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    emptysearchModel1 = createModel(context, () => EmptysearchModel());
    emptysearchModel2 = createModel(context, () => EmptysearchModel());
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emptysearchModel1.dispose();
    emptysearchModel2.dispose();
    loadingModel.dispose();
  }
}
