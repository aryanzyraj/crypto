import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home_shimmer_model.dart';
export 'home_shimmer_model.dart';

class HomeShimmerWidget extends StatefulWidget {
  const HomeShimmerWidget({super.key});

  @override
  State<HomeShimmerWidget> createState() => _HomeShimmerWidgetState();
}

class _HomeShimmerWidgetState extends State<HomeShimmerWidget>
    with TickerProviderStateMixin {
  late HomeShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeShimmerModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation9': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
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
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
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
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
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
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
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
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
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
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
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
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
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
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
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
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation18': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation19': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation20': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x94717B84),
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
    return Container(
      width: 478.0,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 45.0, 12.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 183.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation1']!),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!),
                Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation3']!),
                Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation4']!),
                Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation5']!),
              ].divide(const SizedBox(width: 5.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation6']!),
                Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation7']!),
                Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation8']!),
                Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation9']!),
              ].divide(const SizedBox(width: 5.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 7.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation10']!),
                    Container(
                      width: 110.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation11']!),
                  ].divide(const SizedBox(height: 7.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation12']!),
                    Container(
                      width: 110.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation13']!),
                  ].divide(const SizedBox(height: 7.0)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation14']!),
                    Container(
                      width: 110.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation15']!),
                  ].divide(const SizedBox(height: 7.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation16']!),
                    Container(
                      width: 110.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation17']!),
                  ].divide(const SizedBox(height: 7.0)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 271.0,
                        height: 58.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation18']!),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 271.0,
                        height: 58.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation19']!),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 271.0,
                        height: 58.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation20']!),
                    ),
                  ],
                ),
              ].divide(const SizedBox(height: 7.0)),
            ),
          ),
        ],
      ),
    );
  }
}
