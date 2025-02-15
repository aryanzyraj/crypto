import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'e_commerce_index_widget.dart' show ECommerceIndexWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ECommerceIndexModel extends FlutterFlowModel<ECommerceIndexWidget> {
  ///  Local state fields for this page.

  String? name;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getCategories)] action in eCommerceIndex widget.
  ApiCallResponse? apiCategoriesResult;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
