import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'rate_component_model.dart';
export 'rate_component_model.dart';

class RateComponentWidget extends StatefulWidget {
  const RateComponentWidget({
    super.key,
    this.parameter1,
  });

  final List<dynamic>? parameter1;

  @override
  State<RateComponentWidget> createState() => _RateComponentWidgetState();
}

class _RateComponentWidgetState extends State<RateComponentWidget> {
  late RateComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RateComponentModel());
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
        color: FlutterFlowTheme.of(context).secondary,
      ),
      direction: Axis.horizontal,
      rating: functions.ratingCF(widget.parameter1
                  ?.map((e) => getJsonField(
                        e,
                        r'''$.rating''',
                      ))
                  .toList()
                  .cast<int>()
                  .toList()) ==
              functions.alwaysReturnNull()
          ? 0.0
          : functions.ratingCF(widget.parameter1
              ?.map((e) => getJsonField(
                    e,
                    r'''$.rating''',
                  ))
              .toList()
              .cast<int>()
              .toList()),
      unratedColor: FlutterFlowTheme.of(context).secondaryText,
      itemCount: 5,
      itemSize: 18.0,
    );
  }
}
