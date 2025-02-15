import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ecommerce_rates_component_model.dart';
export 'ecommerce_rates_component_model.dart';

class EcommerceRatesComponentWidget extends StatefulWidget {
  const EcommerceRatesComponentWidget({
    super.key,
    this.parameter1,
  });

  final dynamic parameter1;

  @override
  State<EcommerceRatesComponentWidget> createState() =>
      _EcommerceRatesComponentWidgetState();
}

class _EcommerceRatesComponentWidgetState
    extends State<EcommerceRatesComponentWidget> {
  late EcommerceRatesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EcommerceRatesComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterFlowTheme.of(context).tertiary,
      ),
      direction: Axis.horizontal,
      rating: widget.parameter1!,
      unratedColor: FlutterFlowTheme.of(context).secondaryText,
      itemCount: 5,
      itemSize: 15.0,
    );
  }
}
