import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'spot_waiting_deposit_screen_model.dart';
export 'spot_waiting_deposit_screen_model.dart';

class SpotWaitingDepositScreenWidget extends StatefulWidget {
  const SpotWaitingDepositScreenWidget({
    super.key,
    required this.action,
    required this.walletType,
    required this.userID,
    required this.trx,
  });

  final String? action;
  final String? walletType;
  final String? userID;
  final String? trx;

  @override
  State<SpotWaitingDepositScreenWidget> createState() =>
      _SpotWaitingDepositScreenWidgetState();
}

class _SpotWaitingDepositScreenWidgetState
    extends State<SpotWaitingDepositScreenWidget>
    with TickerProviderStateMixin {
  late SpotWaitingDepositScreenModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpotWaitingDepositScreenModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.transactionWS(
        widget.action!,
        widget.walletType!,
        widget.userID!,
        widget.trx!,
      );
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).primary,
            begin: 0.0,
            end: 1.0,
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).primaryText,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.2, 0.2),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1700.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1700.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 2200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 2700.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2700.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 3200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 3200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 3700.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 0.0),
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
    context.watch<FFAppState>();

    return Stack(
      alignment: const AlignmentDirectional(0.0, 0.0),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4.0,
              sigmaY: 4.0,
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: const Color(0x298B97A2),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 400.0,
            decoration: const BoxDecoration(),
            child: Builder(
              builder: (context) {
                if ((FFAppState().transactionStatus == 'PENDING') ||
                    (FFAppState().transactionStatus == '')) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'jl8u3que' /* Processing payment... */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation1']!),
                      Lottie.asset(
                        'assets/lottie_animations/Animation_-_1706172203032.json',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Builder(
                        builder: (context) {
                          if (FFAppState().transactionStatus == 'COMPLETED') {
                            return SizedBox(
                              width: 150.0,
                              height: 130.0,
                              child: RiveAnimation.asset(
                                'assets/rive_animations/success.riv',
                                artboard: 'success.json',
                                fit: BoxFit.cover,
                                controllers: _model.riveAnimationControllers1,
                              ),
                            );
                          } else if ((FFAppState().transactionStatus ==
                                  'FAILED') ||
                              (FFAppState().transactionStatus == 'CANCELLED') ||
                              (FFAppState().transactionStatus == 'EXPIRED')) {
                            return SizedBox(
                              width: 150.0,
                              height: 130.0,
                              child: RiveAnimation.asset(
                                'assets/rive_animations/warning_icon_(2).riv',
                                artboard: '',
                                fit: BoxFit.cover,
                                controllers: _model.riveAnimationControllers2,
                              ),
                            );
                          } else {
                            return Icon(
                              Icons.cancel,
                              color: FlutterFlowTheme.of(context).errorRed,
                              size: 88.0,
                            ).animateOnPageLoad(
                                animationsMap['iconOnPageLoadAnimation']!);
                          }
                        },
                      ),
                      Text(
                        getJsonField(
                          FFAppState().transactionResult,
                          r'''$.data.message''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Work Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation2']!),
                      Text(
                        'Type : ${getJsonField(
                          FFAppState().transactionResult,
                          r'''$.data.transaction.type''',
                        ).toString()}',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Work Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation3']!),
                      Text(
                        'Status : ${getJsonField(
                          FFAppState().transactionResult,
                          r'''$.data.transaction.status''',
                        ).toString()}',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Work Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation4']!),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Amount : ${getJsonField(
                              FFAppState().transactionResult,
                              r'''$.data.transaction.amount''',
                            ).toString()}',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation5']!),
                          Text(
                            'Fee : ${getJsonField(
                              FFAppState().transactionResult,
                              r'''$.data.transaction.fee''',
                            ).toString()}',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Work Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation6']!),
                        ],
                      ),
                      Text(
                        getJsonField(
                          FFAppState().transactionResult,
                          r'''$.data.transaction.description''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Work Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation7']!),
                    ].divide(const SizedBox(height: 22.0)),
                  );
                }
              },
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-0.05, 1.0),
          child: Builder(
            builder: (context) {
              if (FFAppState().transactionStatus == 'PENDING') {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      HapticFeedback.lightImpact();

                      context.goNamed(
                        'Wallet_All',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 500),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      '7x3lkgd4' /* Cancel */,
                    ),
                    icon: const Icon(
                      Icons.cancel_outlined,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.transparent,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      HapticFeedback.lightImpact();

                      context.goNamed(
                        'Wallet_All',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 500),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'yvwwxx0j' /* To Wallets */,
                    ),
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.transparent,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
