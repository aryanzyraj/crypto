import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recent_trades_model.dart';
export 'recent_trades_model.dart';

class RecentTradesWidget extends StatefulWidget {
  const RecentTradesWidget({
    super.key,
    required this.coin,
    required this.pair,
  });

  final String? coin;
  final String? pair;

  @override
  State<RecentTradesWidget> createState() => _RecentTradesWidgetState();
}

class _RecentTradesWidgetState extends State<RecentTradesWidget> {
  late RecentTradesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecentTradesModel());
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 170.0,
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    '8bk9z150' /* Top Movers */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final topMovers = functions
                          .recentTradeInfo(FFAppState().recentTrades.toList())
                          .toList();
                      if (topMovers.isEmpty) {
                        return const LoadingWidget(
                          dimension: 90,
                        );
                      }

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: topMovers.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                        itemBuilder: (context, topMoversIndex) {
                          final topMoversItem = topMovers[topMoversIndex];
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        getJsonField(
                                          topMoversItem,
                                          r'''$.time''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Text(
                                        getJsonField(
                                          topMoversItem,
                                          r'''$.price''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 11.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        topMoversItem,
                                        r'''$.type''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Text(
                                      formatNumber(
                                        getJsonField(
                                          topMoversItem,
                                          r'''$.cost''',
                                        ).toInt(),
                                        formatType: FormatType.compact,
                                        currency: '\$',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: (String var1) {
                                              return var1 ==
                                                  "Large buy order placed";
                                            }(getJsonField(
                                              topMoversItem,
                                              r'''$.type''',
                                            ).toString())
                                                ? FlutterFlowTheme.of(context)
                                                    .exchangeGreen
                                                : FlutterFlowTheme.of(context)
                                                    .errorRed,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ].divide(const SizedBox(height: 10.0)),
            ),
          ),
        ),
        Divider(
          thickness: 0.5,
          indent: 8.0,
          endIndent: 8.0,
          color: FlutterFlowTheme.of(context).alternate,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'c7axl33d' /* Time */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Price(${widget.pair})',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: const AlignmentDirectional(1.0, 0.0),
                  child: Text(
                    'Quantity(${widget.coin})',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) {
                final recentTrades =
                    FFAppState().recentTrades.toList().take(30).toList();

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: recentTrades.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 3.0),
                  itemBuilder: (context, recentTradesIndex) {
                    final recentTradesItem = recentTrades[recentTradesIndex];
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              getJsonField(
                                recentTradesItem,
                                r'''$.formattedTime''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              getJsonField(
                                recentTradesItem,
                                r'''$.price''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: (String var1) {
                                      return var1 == "buy";
                                    }(getJsonField(
                                      recentTradesItem,
                                      r'''$.side''',
                                    ).toString())
                                        ? FlutterFlowTheme.of(context)
                                            .exchangeGreen
                                        : FlutterFlowTheme.of(context).errorRed,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Text(
                              getJsonField(
                                recentTradesItem,
                                r'''$.amount''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
