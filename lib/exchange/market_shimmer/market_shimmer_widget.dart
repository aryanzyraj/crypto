import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'market_shimmer_model.dart';
export 'market_shimmer_model.dart';

class MarketShimmerWidget extends StatefulWidget {
  const MarketShimmerWidget({super.key});

  @override
  State<MarketShimmerWidget> createState() => _MarketShimmerWidgetState();
}

class _MarketShimmerWidgetState extends State<MarketShimmerWidget>
    with TickerProviderStateMixin {
  late MarketShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketShimmerModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation14': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation15': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation16': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation17': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(6.0, 100.0, 6.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 52.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 70.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation2']!),
              Container(
                width: 70.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation3']!),
              Container(
                width: 70.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation4']!),
              Container(
                width: 70.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation5']!),
              Container(
                width: 70.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation6']!),
            ].divide(const SizedBox(width: 4.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 70.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation7']!),
              Container(
                width: 70.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation8']!),
              Container(
                width: 70.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation9']!),
              Container(
                width: 70.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation10']!),
              Container(
                width: 70.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation11']!),
            ].divide(const SizedBox(width: 4.0)),
          ),
          Container(
            width: double.infinity,
            height: 52.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation12']!),
          Container(
            width: double.infinity,
            height: 57.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation13']!),
          Container(
            width: double.infinity,
            height: 52.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation14']!),
          Container(
            width: double.infinity,
            height: 52.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation15']!),
          Container(
            width: double.infinity,
            height: 52.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation16']!),
          Container(
            width: double.infinity,
            height: 52.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation17']!),
        ].divide(const SizedBox(height: 15.0)),
      ),
    );
  }
}
