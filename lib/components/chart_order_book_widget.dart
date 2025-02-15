import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chart_order_book_model.dart';
export 'chart_order_book_model.dart';

class ChartOrderBookWidget extends StatefulWidget {
  const ChartOrderBookWidget({super.key});

  @override
  State<ChartOrderBookWidget> createState() => _ChartOrderBookWidgetState();
}

class _ChartOrderBookWidgetState extends State<ChartOrderBookWidget> {
  late ChartOrderBookModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChartOrderBookModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 230.0,
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 230.0,
                child: custom_widgets.CustomDepthChartWidget(
                  width: double.infinity,
                  height: 230.0,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 12.0,
                                height: 12.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .exchangeGreen,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'xqsh1is1' /* Buy */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 12.0,
                                height: 12.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).errorRed,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'fkag4tbr' /* Sell */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                        ),
                      ].divide(const SizedBox(width: 50.0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: getJsonField(
                            functions.exchangeBidsAsksPercent(
                                FFAppState().bids.toList(),
                                FFAppState().asks.toList()),
                            r'''$.bids''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Open Sans',
                                color:
                                    FlutterFlowTheme.of(context).exchangeGreen,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'e8c6lqhq' /* % */,
                          ),
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).exchangeGreen,
                          ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).exchangeGreen,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).exchangeGreen,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear,
                              width: ((double.parse(getJsonField(
                                        functions.exchangeBidsAsksPercent(
                                            FFAppState().bids.toList(),
                                            FFAppState().asks.toList()),
                                        r'''$.asks''',
                                      ).toString()) /
                                      100) *
                                  245),
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).errorRed,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: getJsonField(
                            functions.exchangeBidsAsksPercent(
                                FFAppState().bids.toList(),
                                FFAppState().asks.toList()),
                            r'''$.asks''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).errorRed,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'jyezvqbm' /* % */,
                          ),
                          style: const TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).errorRed,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'y8vzdei0' /* Bid */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'x2q9578a' /* Ask */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final bids = FFAppState().bids.toList();

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(bids.length, (bidsIndex) {
                                final bidsItem = bids[bidsIndex];
                                return Stack(
                                  children: [
                                    Opacity(
                                      opacity: 0.6,
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.linear,
                                          width: getJsonField(
                                            bidsItem,
                                            r'''$.width''',
                                          ),
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .exchangeGreenLight,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          getJsonField(
                                            bidsItem,
                                            r'''$.amount''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              bidsItem,
                                              r'''$.price''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .exchangeGreen,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final asks = FFAppState().asks.toList();

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(asks.length, (asksIndex) {
                                final asksItem = asks[asksIndex];
                                return Stack(
                                  children: [
                                    Opacity(
                                      opacity: 0.5,
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.linear,
                                          width: getJsonField(
                                            asksItem,
                                            r'''$.width''',
                                          ),
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            getJsonField(
                                              asksItem,
                                              r'''$.price''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .errorRed,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            getJsonField(
                                              asksItem,
                                              r'''$.amount''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
