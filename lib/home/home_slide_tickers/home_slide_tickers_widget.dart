import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'home_slide_tickers_model.dart';
export 'home_slide_tickers_model.dart';

class HomeSlideTickersWidget extends StatefulWidget {
  const HomeSlideTickersWidget({super.key});

  @override
  State<HomeSlideTickersWidget> createState() => _HomeSlideTickersWidgetState();
}

class _HomeSlideTickersWidgetState extends State<HomeSlideTickersWidget> {
  late HomeSlideTickersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeSlideTickersModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 120.0,
        decoration: const BoxDecoration(),
        child: Builder(
          builder: (context) {
            final gridTickers =
                FFAppState().allTickers.toList().take(9).toList();

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(gridTickers.length, (gridTickersIndex) {
                  final gridTickersItem = gridTickers[gridTickersIndex];
                  return Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Stack(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: 150.0,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).alternativ2,
                                  Colors.transparent
                                ],
                                stops: const [0.0, 1.0],
                                begin: const AlignmentDirectional(0.0, -1.0),
                                end: const AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-2.97, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 10.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                HapticFeedback.lightImpact();
                                FFAppState().symbol = getJsonField(
                                  gridTickersItem,
                                  r'''$.symbol''',
                                ).toString();
                                setState(() {});

                                context.pushNamed(
                                  'exchangeChart',
                                  queryParameters: {
                                    'symbol': serializeParam(
                                      getJsonField(
                                        gridTickersItem,
                                        r'''$.symbol''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 20.0,
                                        height: 20.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          functions
                                              .generateImageUrl((String var1) {
                                            return var1.split('/')[0];
                                          }(getJsonField(
                                            gridTickersItem,
                                            r'''$.symbol''',
                                          ).toString()))!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: (String var1) {
                                                  return var1.split('/')[0];
                                                }(getJsonField(
                                                  gridTickersItem,
                                                  r'''$.symbol''',
                                                ).toString()),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '4g8whp9w' /*     */,
                                                ),
                                                style: const TextStyle(),
                                              ),
                                              TextSpan(
                                                text: getJsonField(
                                                  gridTickersItem,
                                                  r'''$.change''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          valueOrDefault<Color>(
                                                        () {
                                                          if ((String var1) {
                                                            return var1 == "up";
                                                          }(getJsonField(
                                                            gridTickersItem,
                                                            r'''$.direction''',
                                                          ).toString())) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .exchangeGreen;
                                                          } else if ((String
                                                              var1) {
                                                            return var1 ==
                                                                "down";
                                                          }(getJsonField(
                                                            gridTickersItem,
                                                            r'''$.direction''',
                                                          ).toString())) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .errorRed;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText;
                                                          }
                                                        }(),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .exchangeGreen,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'wuvzyi2f' /* % */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelSmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          valueOrDefault<Color>(
                                                        () {
                                                          if ((String var1) {
                                                            return var1 == "up";
                                                          }(getJsonField(
                                                            gridTickersItem,
                                                            r'''$.direction''',
                                                          ).toString())) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .exchangeGreen;
                                                          } else if ((String
                                                              var1) {
                                                            return var1 ==
                                                                "down";
                                                          }(getJsonField(
                                                            gridTickersItem,
                                                            r'''$.direction''',
                                                          ).toString())) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .errorRed;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText;
                                                          }
                                                        }(),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .exchangeGreen,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        getJsonField(
                                          gridTickersItem,
                                          r'''$.last''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: valueOrDefault<Color>(
                                                () {
                                                  if ((String var1) {
                                                    return var1 == "up";
                                                  }(getJsonField(
                                                    gridTickersItem,
                                                    r'''$.direction''',
                                                  ).toString())) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .exchangeGreen;
                                                  } else if ((String var1) {
                                                    return var1 == "down";
                                                  }(getJsonField(
                                                    gridTickersItem,
                                                    r'''$.direction''',
                                                  ).toString())) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .errorRed;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText;
                                                  }
                                                }(),
                                                FlutterFlowTheme.of(context)
                                                    .exchangeGreen,
                                              ),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'xgawmvld' /* ≈ $ */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: (getJsonField(
                                                gridTickersItem,
                                                r'''$.last''',
                                              ).round())
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .exchangeGreen,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 0.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'c4gticjq' /* Trade Now */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .customColor2,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 18.0,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 5.0)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).divide(const SizedBox(width: 8.0)),
              ),
            );
          },
        ),
      ),
    );
  }
}
