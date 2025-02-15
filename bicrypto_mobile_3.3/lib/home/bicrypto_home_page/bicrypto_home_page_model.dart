import '/backend/api_requests/api_calls.dart';
import '/components/all_t_i_c_k_e_r_s_component_copy_widget.dart';
import '/components/k_y_c_warning_slider/k_y_c_warning_slider_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/all_addons/all_addons_widget.dart';
import '/home/home_slide_tickers/home_slide_tickers_widget.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import 'bicrypto_home_page_widget.dart' show BicryptoHomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BicryptoHomePageModel extends FlutterFlowModel<BicryptoHomePageWidget> {
  ///  Local state fields for this page.

  double scrollValue = 0.0;

  bool addonsShow = false;
  final ScrollController scrollController = ScrollController();

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getProfile)] action in BicryptoHomePage widget.
  ApiCallResponse? apiGETProfileResul;
  // Stores action output result for [Backend Call - API (Logout)] action in BicryptoHomePage widget.
  ApiCallResponse? apiLogout;
  // Stores action output result for [Backend Call - API (Sliders)] action in BicryptoHomePage widget.
  ApiCallResponse? apiSliders;
  var scannerResult = '';
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for allAddons component.
  late AllAddonsModel allAddonsModel;
  // Model for homeSlideTickers component.
  late HomeSlideTickersModel homeSlideTickersModel;
  // Model for allTICKERSComponentCopy component.
  late AllTICKERSComponentCopyModel allTICKERSComponentCopyModel;
  // Model for navBar component.
  late NavBarModel navBarModel;
  // Model for KYCWarningSlider component.
  late KYCWarningSliderModel kYCWarningSliderModel;
  BicryptoHomePageModel() {
    scrollController.addListener(_updateScrollValue);
  }

  void _updateScrollValue() {
    double currentScroll = scrollController.position.pixels;
    // Cap the scrollValue to change only within the first 100 pixels
    scrollValue = (currentScroll / 100).clamp(0.0, 1.0);
  }

  @override
  void initState(BuildContext context) {
    allAddonsModel = createModel(context, () => AllAddonsModel());
    homeSlideTickersModel = createModel(context, () => HomeSlideTickersModel());
    allTICKERSComponentCopyModel =
        createModel(context, () => AllTICKERSComponentCopyModel());
    navBarModel = createModel(context, () => NavBarModel());
    kYCWarningSliderModel = createModel(context, () => KYCWarningSliderModel());
  }

  @override
  void dispose() {
    scrollController.removeListener(_updateScrollValue);
    scrollController.dispose();
    allAddonsModel.dispose();
    homeSlideTickersModel.dispose();
    allTICKERSComponentCopyModel.dispose();
    navBarModel.dispose();
    kYCWarningSliderModel.dispose();
  }
}
