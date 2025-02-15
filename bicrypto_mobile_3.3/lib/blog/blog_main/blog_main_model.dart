import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blog_main_widget.dart' show BlogMainWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BlogMainModel extends FlutterFlowModel<BlogMainWidget> {
  ///  Local state fields for this page.

  bool isApplied = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 2;

  // Stores action output result for [Backend Call - API (blogPostAuthors)] action in Icon widget.
  ApiCallResponse? apiResultqyf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
