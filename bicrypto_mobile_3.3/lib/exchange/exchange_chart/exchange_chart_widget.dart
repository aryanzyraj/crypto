import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/exchange/chart_colors_component/chart_colors_component_widget.dart';
import '/exchange/recent_trades/recent_trades_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/form_field_controller.dart';
import '/shimmer/shimmer_market_single_ticker/shimmer_market_single_ticker_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'exchange_chart_model.dart';
export 'exchange_chart_model.dart';

class ExchangeChartWidget extends StatefulWidget {
  const ExchangeChartWidget({
    super.key,
    required this.symbol,
  });

  final String? symbol;

  @override
  State<ExchangeChartWidget> createState() => _ExchangeChartWidgetState();
}

class _ExchangeChartWidgetState extends State<ExchangeChartWidget> {
  late ExchangeChartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExchangeChartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (!FFAppState().isOrderBookOpen) {
            await actions.market(
              context,
            );
            FFAppState().isOrderBookOpen = true;
            setState(() {});
          }
        }),
        Future(() async {
          if (!FFAppState().isWebSocketOpen) {
            FFAppState().isWebSocketOpen = true;
            unawaited(
              () async {
                await actions.updateTickersFromWebSocket(
                  context,
                );
              }(),
            );
          }
        }),
        Future(() async {
          _model.historical = await ExchangeGroup.historicalCall.call(
            symbol: widget.symbol,
            duration:
                functions.exchangeDurationIntervals(FFAppState().interval),
            to: getCurrentTimestamp.millisecondsSinceEpoch,
            interval: FFAppState().interval,
            from:
                functions.exchangeCalculateFromTimestamp(FFAppState().interval),
            accesstoken: FFAppState().accesstoken,
            csrftoken: FFAppState().csrftoken,
            sessionid: FFAppState().sessionId,
          );

          if ((_model.historical?.succeeded ?? true)) {
            _model.dataHistorical = (_model.historical?.jsonBody ?? '');
            setState(() {});
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    title: const Text('Note!!'),
                    content: const Text(
                        'Market has limited access now , try again later...'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }),
        Future(() async {
          FFAppState().upCandle = FlutterFlowTheme.of(context).exchangeGreen;
          FFAppState().downCandle = FlutterFlowTheme.of(context).errorRed;
        }),
      ]);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FFAppState().isTradeView
            ? FlutterFlowTheme.of(context).tradeView
            : FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 2.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FFAppState().isTradeView
                      ? FlutterFlowTheme.of(context).tradeView
                      : FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 42.0, 12.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.symbol!,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Lexend',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.lightImpact();
                          context.safePop();
                        },
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.chevron_left_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 33.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        if (FFAppState().singleTicker != null) {
                          return Padding(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getJsonField(
                                            FFAppState().singleTicker,
                                            r'''$.last''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color: valueOrDefault<Color>(
                                                  () {
                                                    if ((double.tryParse(
                                                                getJsonField(
                                                              FFAppState()
                                                                  .singleTicker,
                                                              r'''$.change''',
                                                            ).toString()) ??
                                                            0) >
                                                        0) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .exchangeGreen;
                                                    } else if ((double.tryParse(
                                                                getJsonField(
                                                              FFAppState()
                                                                  .singleTicker,
                                                              r'''$.change''',
                                                            ).toString()) ??
                                                            0) <
                                                        0) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .errorRed;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primaryText;
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .exchangeGreen,
                                                ),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'pwym05mi' /* ≈$ */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: (getJsonField(
                                                  FFAppState().singleTicker,
                                                  r'''$.last''',
                                                ).round())
                                                    .toString(),
                                                style: const TextStyle(),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'iv194gyc' /*    */,
                                                ),
                                                style: const TextStyle(),
                                              ),
                                              TextSpan(
                                                text: getJsonField(
                                                  FFAppState().singleTicker,
                                                  r'''$.change''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if ((double.tryParse(
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .singleTicker,
                                                                r'''$.change''',
                                                              ).toString()) ??
                                                              0) >
                                                          0) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .exchangeGreen;
                                                      } else if ((double.tryParse(
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .singleTicker,
                                                                r'''$.change''',
                                                              ).toString()) ??
                                                              0) <
                                                          0) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .errorRed;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryText;
                                                      }
                                                    }(),
                                                    FlutterFlowTheme.of(context)
                                                        .exchangeGreen,
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'vdcho1qz' /* % */,
                                                ),
                                                style: TextStyle(
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if ((double.tryParse(
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .singleTicker,
                                                                r'''$.change''',
                                                              ).toString()) ??
                                                              0) >
                                                          0) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .exchangeGreen;
                                                      } else if ((double.tryParse(
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .singleTicker,
                                                                r'''$.change''',
                                                              ).toString()) ??
                                                              0) <
                                                          0) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .errorRed;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryText;
                                                      }
                                                    }(),
                                                    FlutterFlowTheme.of(context)
                                                        .exchangeGreen,
                                                  ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'c5yq9bdr' /* High */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              getJsonField(
                                                FFAppState().singleTicker,
                                                r'''$.high''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(height: 2.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '9zg0ztna' /* 24h Vol( */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: (String var1) {
                                                      return var1.split('/')[0];
                                                    }(widget.symbol!),
                                                    style: const TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'x6nz1228' /* ) */,
                                                    ),
                                                    style: const TextStyle(),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              formatNumber(
                                                double.parse(getJsonField(
                                                  FFAppState().singleTicker,
                                                  r'''$.baseVolume''',
                                                ).toString()),
                                                formatType: FormatType.compact,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(height: 2.0)),
                                        ),
                                      ].divide(const SizedBox(width: 15.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'fpzeaaxv' /* Low */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              getJsonField(
                                                FFAppState().singleTicker,
                                                r'''$.low''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(height: 2.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '4ddthbwp' /* 24h Vol( */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: (String var1) {
                                                      return var1.split('/')[1];
                                                    }(widget.symbol!),
                                                    style: const TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '8u3s3jw6' /* ) */,
                                                    ),
                                                    style: const TextStyle(),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              formatNumber(
                                                double.parse(getJsonField(
                                                  FFAppState().singleTicker,
                                                  r'''$.quoteVolume''',
                                                ).toString()),
                                                formatType: FormatType.compact,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
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
                          );
                        } else {
                          return wrapWithModel(
                            model: _model.shimmerMarketSingleTickerModel,
                            updateCallback: () => setState(() {}),
                            child: const ShimmerMarketSingleTickerWidget(),
                          );
                        }
                      },
                    ),
                    Builder(
                      builder: (context) {
                        if (!FFAppState().isTradeView) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 6.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.live = !_model.live;
                                            setState(() {});
                                            FFAppState().interval = '1s';
                                            setState(() {});
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'baw6qthk' /* 1s */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: _model.live
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .errorRed
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowChoiceChips(
                                                options: functions
                                                    .exchangeProvidertimes(
                                                        FFAppConstants
                                                            .ProviderSupport)!
                                                    .map((label) =>
                                                        ChipData(label))
                                                    .toList(),
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .choiceChipsIntervalsValue =
                                                      val?.firstOrNull);
                                                  _model.historicalDD =
                                                      await ExchangeGroup
                                                          .historicalCall
                                                          .call(
                                                    symbol: widget.symbol,
                                                    duration: functions
                                                        .exchangeDurationIntervals(
                                                            FFAppState()
                                                                .interval),
                                                    to: getCurrentTimestamp
                                                        .millisecondsSinceEpoch,
                                                    interval:
                                                        FFAppState().interval,
                                                    from: functions
                                                        .exchangeCalculateFromTimestamp(
                                                            FFAppState()
                                                                .interval),
                                                    accesstoken: FFAppState()
                                                        .accesstoken,
                                                    csrftoken:
                                                        FFAppState().csrftoken,
                                                    sessionid:
                                                        FFAppState().sessionId,
                                                  );

                                                  if ((_model.historicalDD
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.dataHistorical =
                                                        (_model.historicalDD
                                                                ?.jsonBody ??
                                                            '');
                                                    _model.live = false;
                                                    setState(() {});
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title:
                                                                const Text('Note!!'),
                                                            content: const Text(
                                                                'Market has limited access now , try again later...'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }

                                                  FFAppState().interval = _model
                                                      .choiceChipsIntervalsValue!;
                                                  setState(() {});

                                                  setState(() {});
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      const Color(0x00000000),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 18.0,
                                                  labelPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(2.0, 0.0,
                                                              2.0, 0.0),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      const Color(0x00000000),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  iconSize: 20.0,
                                                  labelPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(1.0, 0.0,
                                                              2.0, 0.0),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                chipSpacing: 12.0,
                                                rowSpacing: 12.0,
                                                multiselect: false,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .choiceChipsIntervalsValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [],
                                                ),
                                                wrapped: false,
                                              ),
                                            ].divide(const SizedBox(width: 15.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 350.0,
                                decoration: const BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 60.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Opacity(
                                                opacity: 0.4,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/ChartLogoOriginal.png',
                                                    width: 200.0,
                                                    height: 80.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (_model.dataHistorical != null) {
                                          return SizedBox(
                                            width: double.infinity,
                                            height: 350.0,
                                            child: custom_widgets
                                                .CustomKChartWidget(
                                              width: double.infinity,
                                              height: 350.0,
                                              isLine: _model.isLine,
                                              showVolumes: _model.volume,
                                              showMA: _model.ma,
                                              showBOLL: _model.boll,
                                              showMACD: _model.macd,
                                              showKDJ: _model.kdj,
                                              showRSI: _model.rsi,
                                              showWR: _model.wr,
                                              showCCI: _model.cci,
                                              showNowPrice: _model.nowPrice,
                                              hideGrid: _model.grid,
                                              isChinese: false,
                                              isTrendLine: false,
                                              priceOnRight: _model.priceOnRight,
                                              fixedLength: 0,
                                              historicalData: FFAppState()
                                                          .interval !=
                                                      '1s'
                                                  ? functions
                                                      .exchangeMapHistorical(
                                                          _model
                                                              .dataHistorical!)
                                                  : functions.demoHistorical(
                                                      getJsonField(
                                                        FFAppState()
                                                            .singleTicker,
                                                        r'''$.last''',
                                                      ),
                                                      getJsonField(
                                                        FFAppState()
                                                            .singleTicker,
                                                        r'''$.last''',
                                                      ),
                                                      getJsonField(
                                                        FFAppState()
                                                            .singleTicker,
                                                        r'''$.last''',
                                                      ),
                                                      getJsonField(
                                                        FFAppState()
                                                            .singleTicker,
                                                        r'''$.last''',
                                                      ),
                                                      getJsonField(
                                                        FFAppState()
                                                            .singleTicker,
                                                        r'''$.baseVolume''',
                                                      )),
                                              upColor: FFAppState().upCandle,
                                              dnColor: FFAppState().downCandle,
                                              bgColor: _model.back,
                                              duration: FFAppState().interval,
                                              loadingColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              isLiveMode: _model.live,
                                            ),
                                          );
                                        } else {
                                          return Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: wrapWithModel(
                                                model: _model.loadingModel1,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: const LoadingWidget(
                                                  dimension: 100,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 6.0, 0.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 6.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.volume =
                                                        !_model.volume;
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'qpyoyzgs' /* Vol */,
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              color: _model
                                                                      .volume
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 0.0, 6.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.isLine =
                                                        !_model.isLine;
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'zxmcpu6j' /* Line */,
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              color: _model
                                                                      .isLine
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                ),
                                              ),
                                              FlutterFlowChoiceChips(
                                                options: [
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ejhpevrk' /* MA */,
                                                  )),
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '2bj085ok' /* BOLL */,
                                                  ))
                                                ],
                                                onChanged: (val) async {
                                                  setState(() =>
                                                      _model.mstateValue =
                                                          val?.firstOrNull);
                                                  if (_model.mstateValue ==
                                                      'MA') {
                                                    _model.ma = !_model.ma;
                                                    _model.boll = false;
                                                    setState(() {});
                                                  } else {
                                                    if (_model.mstateValue ==
                                                        'BOLL') {
                                                      _model.boll =
                                                          !_model.boll;
                                                      _model.ma = false;
                                                      setState(() {});
                                                    }
                                                  }
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      const Color(0x00000000),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 18.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      const Color(0x00000000),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  iconSize: 20.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                chipSpacing: 3.0,
                                                rowSpacing: 12.0,
                                                multiselect: false,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .mstateValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [],
                                                ),
                                                wrapped: false,
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                ),
                                              ),
                                              FlutterFlowChoiceChips(
                                                options: [
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '0ux9dnly' /* MACD */,
                                                  )),
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'z32s325l' /* KDJ */,
                                                  )),
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'azugtx8z' /* RSI */,
                                                  )),
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '5c5bjqyt' /* WR */,
                                                  )),
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'jgqqqz0y' /* CCI */,
                                                  ))
                                                ],
                                                onChanged: (val) async {
                                                  setState(() =>
                                                      _model.sstateValue =
                                                          val?.firstOrNull);
                                                  if (_model.sstateValue ==
                                                      'RSI') {
                                                    _model.rsi = !_model.rsi;
                                                    _model.cci = false;
                                                    _model.wr = false;
                                                    _model.macd = false;
                                                    _model.kdj = false;
                                                    setState(() {});
                                                  } else {
                                                    if (_model.sstateValue ==
                                                        'CCI') {
                                                      _model.cci = !_model.cci;
                                                      _model.rsi = false;
                                                      _model.wr = false;
                                                      _model.macd = false;
                                                      _model.kdj = false;
                                                      setState(() {});
                                                    } else {
                                                      if (_model.sstateValue ==
                                                          'WR') {
                                                        _model.wr = !_model.wr;
                                                        _model.rsi = false;
                                                        _model.cci = false;
                                                        _model.kdj = false;
                                                        _model.macd = false;
                                                        setState(() {});
                                                      } else {
                                                        if (_model
                                                                .sstateValue ==
                                                            'MACD') {
                                                          _model.macd =
                                                              !_model.macd;
                                                          _model.rsi = false;
                                                          _model.wr = false;
                                                          _model.cci = false;
                                                          _model.kdj = false;
                                                          setState(() {});
                                                        } else {
                                                          if (_model
                                                                  .sstateValue ==
                                                              'KDJ') {
                                                            _model.kdj =
                                                                !_model.kdj;
                                                            _model.macd = false;
                                                            _model.rsi = false;
                                                            _model.wr = false;
                                                            _model.cci = false;
                                                            setState(() {});
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      const Color(0x00000000),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 18.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      const Color(0x00000000),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  iconSize: 12.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                chipSpacing: 3.0,
                                                rowSpacing: 12.0,
                                                multiselect: false,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .sstateValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [],
                                                ),
                                                wrapped: false,
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 0.0, 6.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.nowPrice =
                                                        !_model.nowPrice;
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1ho0zjax' /* Price */,
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              color: _model
                                                                      .nowPrice
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 0.0, 6.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.grid = !_model.grid;
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '3e4l8nq8' /* Grid */,
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              color: _model.grid
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 0.0, 6.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.priceOnRight =
                                                        !_model.priceOnRight;
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '6eeipzej' /* POR */,
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Open Sans',
                                                              color: _model
                                                                      .priceOnRight
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 6.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return FlutterFlowWebView(
                            content: functions.tradeViewUrl(
                                Theme.of(context).brightness == Brightness.dark,
                                widget.symbol!,
                                true)!,
                            bypass: false,
                            height: 500.0,
                            verticalScroll: false,
                            horizontalScroll: false,
                          );
                        }
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData(FFLocalizations.of(context).getText(
                                    '6ui6iqqn' /* Order Book */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'xqgji6nr' /* Recent Trades */,
                                  )),
                                  ChipData(FFLocalizations.of(context).getText(
                                    'l3orn3zq' /* Analysis */,
                                  ))
                                ],
                                onChanged: (val) async {
                                  setState(() => _model.choiceChipsValue =
                                      val?.firstOrNull);
                                  if (_model.choiceChipsValue == 'Analysis') {
                                    _model.analysis = functions.chartAnalysis(
                                        FFAppState().singleTicker,
                                        _model.dataHistorical,
                                        FFAppState().bids.toList(),
                                        FFAppState().asks.toList(),
                                        FFAppState().recentTrades.toList());
                                    setState(() {});
                                  } else {
                                    _model.analysis = null;
                                    setState(() {});
                                  }
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 0.0,
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: const Color(0x00000000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor: const Color(0x00000000),
                                  iconSize: 0.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                chipSpacing: 0.0,
                                rowSpacing: 0.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.center,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  [
                                    FFLocalizations.of(context).getText(
                                      '8wr539fi' /* Order Book */,
                                    )
                                  ],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.5,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Builder(
                      builder: (context) {
                        if (_model.choiceChipsValue == 'Order Book') {
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
                                      child:
                                          custom_widgets.CustomDepthChartWidget(
                                        width: double.infinity,
                                        height: 230.0,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 18.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .exchangeGreen,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'oi21knel' /* Buy */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 5.0)),
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .errorRed,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zxkx16ty' /* Sell */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 5.0)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: getJsonField(
                                                  functions
                                                      .exchangeBidsAsksPercent(
                                                          FFAppState()
                                                              .bids
                                                              .toList(),
                                                          FFAppState()
                                                              .asks
                                                              .toList()),
                                                  r'''$.bids''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .exchangeGreen,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'i85i8fld' /* % */,
                                                ),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .exchangeGreen,
                                                ),
                                              )
                                            ],
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
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 8.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .exchangeGreen,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.linear,
                                                    width: ((double.parse(
                                                                getJsonField(
                                                              functions.exchangeBidsAsksPercent(
                                                                  FFAppState()
                                                                      .bids
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .asks
                                                                      .toList()),
                                                              r'''$.asks''',
                                                            ).toString()) /
                                                            100) *
                                                        245),
                                                    height: 8.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .errorRed,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                16.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: getJsonField(
                                                  functions
                                                      .exchangeBidsAsksPercent(
                                                          FFAppState()
                                                              .bids
                                                              .toList(),
                                                          FFAppState()
                                                              .asks
                                                              .toList()),
                                                  r'''$.asks''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .errorRed,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'brlgwdn4' /* % */,
                                                ),
                                                style: const TextStyle(),
                                              )
                                            ],
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'eycdkurn' /* Bid */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
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
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ivm31qfi' /* Ask */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Builder(
                                                builder: (context) {
                                                  final bids = FFAppState()
                                                      .bids
                                                      .toList();

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        bids.length,
                                                        (bidsIndex) {
                                                      final bidsItem =
                                                          bids[bidsIndex];
                                                      return Stack(
                                                        children: [
                                                          Opacity(
                                                            opacity: 0.6,
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve: Curves
                                                                    .linear,
                                                                width:
                                                                    getJsonField(
                                                                  bidsItem,
                                                                  r'''$.width''',
                                                                ),
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .exchangeGreenLight,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  bidsItem,
                                                                  r'''$.amount''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Open Sans',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    bidsItem,
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .exchangeGreen,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
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
                                                  final asks = FFAppState()
                                                      .asks
                                                      .toList();

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        asks.length,
                                                        (asksIndex) {
                                                      final asksItem =
                                                          asks[asksIndex];
                                                      return Stack(
                                                        children: [
                                                          Opacity(
                                                            opacity: 0.5,
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve: Curves
                                                                    .linear,
                                                                width:
                                                                    getJsonField(
                                                                  asksItem,
                                                                  r'''$.width''',
                                                                ),
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor12,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    asksItem,
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .errorRed,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    asksItem,
                                                                    r'''$.amount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
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
                        } else if (_model.choiceChipsValue == 'Recent Trades') {
                          return Container(
                            height: 600.0,
                            decoration: const BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.recentTradesModel,
                              updateCallback: () => setState(() {}),
                              child: RecentTradesWidget(
                                coin: (String var1) {
                                  return var1.split('/')[0];
                                }(widget.symbol!),
                                pair: (String var1) {
                                  return var1.split('/')[1];
                                }(widget.symbol!),
                              ),
                            ),
                          );
                        } else {
                          return Builder(
                            builder: (context) {
                              if (_model.analysis != null) {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ph0u6rzi' /* 24h Low */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  _model.analysis,
                                                  r'''$.priceRange.low''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(height: 4.0)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '8p9u5mus' /* 24h High */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  _model.analysis,
                                                  r'''$.priceRange.high''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(height: 4.0)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'i5eoi7v1' /* Current Price */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  _model.analysis,
                                                  r'''$.priceRange.current''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(height: 4.0)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'fofs8gej' /* 24h VOL */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                formatNumber(
                                                  getJsonField(
                                                    _model.analysis,
                                                    r'''$.volume_24h''',
                                                  ).toInt(),
                                                  formatType:
                                                      FormatType.compact,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(height: 4.0)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'cgct6fvi' /* Trader Ratio */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  '${getJsonField(
                                                    _model.analysis,
                                                    r'''$.traderRatio''',
                                                  ).toString()}%',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(height: 4.0)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'r684wllj' /* Trading Trade */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  getJsonField(
                                                    _model.analysis,
                                                    r'''$.trading_trend''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: (String var1) {
                                                          return var1 == "Sell";
                                                        }(getJsonField(
                                                          _model.analysis,
                                                          r'''$.trading_trend''',
                                                        ).toString())
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .errorRed
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .exchangeGreen,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '3rvtu0u0' /* Buy/Sell Traders */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                CircularPercentIndicator(
                                                  percent: getJsonField(
                                                        _model.analysis,
                                                        r'''$.buy_sell_traders''',
                                                      ) /
                                                      100,
                                                  radius: 45.0,
                                                  lineWidth: 8.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .errorRed,
                                                  center: Text(
                                                    '${getJsonField(
                                                      _model.analysis,
                                                      r'''$.buy_sell_traders''',
                                                    ).toString()}%',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 4.0)),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'd7tt7lob' /* Buy/Sell Volums */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                CircularPercentIndicator(
                                                  percent: getJsonField(
                                                        _model.analysis,
                                                        r'''$.buy_sell_volume''',
                                                      ) /
                                                      100,
                                                  radius: 45.0,
                                                  lineWidth: 8.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .errorRed,
                                                  center: Text(
                                                    '${getJsonField(
                                                      _model.analysis,
                                                      r'''$.buy_sell_volume''',
                                                    ).toString()}%',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'p55hwxnz' /* Greed Index */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 250.0,
                                            height: 200.0,
                                            child: custom_widgets.GreedIndex(
                                              width: 250.0,
                                              height: 200.0,
                                              value: getJsonField(
                                                _model.analysis,
                                                r'''$.greed_index''',
                                              ),
                                              needelcolor:
                                                  FlutterFlowTheme.of(context)
                                                      .errorRed,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 12.0)),
                                  ),
                                );
                              } else {
                                return wrapWithModel(
                                  model: _model.loadingModel2,
                                  updateCallback: () => setState(() {}),
                                  child: const LoadingWidget(
                                    dimension: 90,
                                  ),
                                );
                              }
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                wrapWithModel(
                  model: _model.chartColorsComponentModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: ChartColorsComponentWidget(
                    symbol: widget.symbol!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
