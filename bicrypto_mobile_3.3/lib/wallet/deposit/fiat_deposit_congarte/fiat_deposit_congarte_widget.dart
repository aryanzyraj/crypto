import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'fiat_deposit_congarte_model.dart';
export 'fiat_deposit_congarte_model.dart';

class FiatDepositCongarteWidget extends StatefulWidget {
  const FiatDepositCongarteWidget({
    super.key,
    required this.data,
    required this.action,
  });

  final dynamic data;
  final String? action;

  @override
  State<FiatDepositCongarteWidget> createState() =>
      _FiatDepositCongarteWidgetState();
}

class _FiatDepositCongarteWidgetState extends State<FiatDepositCongarteWidget>
    with TickerProviderStateMixin {
  late FiatDepositCongarteModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiatDepositCongarteModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, -14.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-47.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'richTextOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: const Offset(49.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'richTextOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: const Offset(49.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 19.0),
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
    return Padding(
      padding: const EdgeInsets.all(33.0),
      child: Container(
        height: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: RiveAnimation.asset(
                      'assets/rive_animations/success.riv',
                      artboard: 'success.json',
                      fit: BoxFit.cover,
                      controllers: _model.riveAnimationControllers,
                    ),
                  ),
                ),
              ],
            ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
            Text(
              FFLocalizations.of(context).getText(
                'acv1tusp' /* Congratulations */,
              ),
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Lexend',
                    letterSpacing: 0.0,
                  ),
            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
            Builder(
              builder: (context) {
                if (widget.action == 'deposit') {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'btmzaxa2' /* Your deposit of  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          TextSpan(
                            text: getJsonField(
                              widget.data,
                              r'''$.transaction.amount''',
                            ).toString(),
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '5h2qbb2h' /*   */,
                            ),
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: getJsonField(
                              widget.data,
                              r'''$.currency''',
                            ).toString(),
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '6rj2o50t' /*  is currently pending. You wil... */,
                            ),
                            style: const TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      textAlign: TextAlign.center,
                    ).animateOnPageLoad(
                        animationsMap['richTextOnPageLoadAnimation1']!),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'a1p0mxc3' /* Your withdraw of  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          TextSpan(
                            text: getJsonField(
                              widget.data,
                              r'''$.transaction.amount''',
                            ).toString(),
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '06fsgp54' /*   */,
                            ),
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: getJsonField(
                              widget.data,
                              r'''$.currency''',
                            ).toString(),
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '0yf7fo10' /*  is currently pending. You wil... */,
                            ),
                            style: const TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      textAlign: TextAlign.center,
                    ).animateOnPageLoad(
                        animationsMap['richTextOnPageLoadAnimation2']!),
                  );
                }
              },
            ),
            FFButtonWidget(
              onPressed: () async {
                HapticFeedback.lightImpact();

                context.pushNamed('Wallet_All');
              },
              text: FFLocalizations.of(context).getText(
                'i8w38dzp' /* Wallet */,
              ),
              icon: const Icon(
                Icons.arrow_forward,
                size: 15.0,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
