import '/flutter_flow/flutter_flow_util.dart';
import 'condition_swap_widget.dart' show ConditionSwapWidget;
import 'package:carousel_slider/carousel_slider.dart';

class ConditionSwapModel extends FlutterFlowModel<ConditionSwapWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
