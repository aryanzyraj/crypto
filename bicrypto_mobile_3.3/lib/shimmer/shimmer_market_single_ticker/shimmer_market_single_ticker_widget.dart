import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'shimmer_market_single_ticker_model.dart';
export 'shimmer_market_single_ticker_model.dart';

class ShimmerMarketSingleTickerWidget extends StatefulWidget {
  const ShimmerMarketSingleTickerWidget({super.key});

  @override
  State<ShimmerMarketSingleTickerWidget> createState() =>
      _ShimmerMarketSingleTickerWidgetState();
}

class _ShimmerMarketSingleTickerWidgetState
    extends State<ShimmerMarketSingleTickerWidget>
    with TickerProviderStateMixin {
  late ShimmerMarketSingleTickerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerMarketSingleTickerModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 3000.0.ms,
            color: FlutterFlowTheme.of(context).exchangeGreen,
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
    context.watch<FFAppState>();

    return Container(
      height: 100.0,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'cw3cyo4n' /* 00.00 */,
                      ),
                      style: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .override(
                            fontFamily: 'Lexend',
                            color: valueOrDefault<Color>(
                              () {
                                if ((double.tryParse(getJsonField(
                                          FFAppState().singleTicker,
                                          r'''$.change''',
                                        ).toString()) ??
                                        0) >
                                    0) {
                                  return FlutterFlowTheme.of(context)
                                      .exchangeGreen;
                                } else if ((double.tryParse(getJsonField(
                                          FFAppState().singleTicker,
                                          r'''$.change''',
                                        ).toString()) ??
                                        0) <
                                    0) {
                                  return FlutterFlowTheme.of(context).errorRed;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                }
                              }(),
                              FlutterFlowTheme.of(context).exchangeGreen,
                            ),
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation']!),
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '3c3um42d' /* ≈$ */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'vu46jfsa' /* 0.0 */,
                            ),
                            style: const TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'lu68duz1' /* High */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'g3d4w6nv' /* 00.00 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 2.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'wbcbh06k' /* 24h Vol( */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'b78a6pzf' /* ) */,
                                ),
                                style: const TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '9zajmwb5' /* 00.00 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 2.0)),
                    ),
                  ].divide(const SizedBox(width: 15.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'g1fd1cwf' /* Low */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'er06eqvn' /* 00.00 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 2.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'xq5yix9h' /* 24h Vol( */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '9ejh9655' /* ) */,
                                ),
                                style: const TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'r9mt8aw4' /* 00.00 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 2.0)),
                    ),
                  ].divide(const SizedBox(width: 15.0)),
                ),
              ].divide(const SizedBox(height: 10.0)),
            ),
          ],
        ),
      ),
    );
  }
}
