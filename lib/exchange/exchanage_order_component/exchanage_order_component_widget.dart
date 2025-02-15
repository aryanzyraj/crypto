import '/backend/api_requests/api_calls.dart';
import '/components/emptysearch_widget.dart';
import '/components/loading_widget.dart';
import '/exchange/show_order_component/show_order_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'exchanage_order_component_model.dart';
export 'exchanage_order_component_model.dart';

class ExchanageOrderComponentWidget extends StatefulWidget {
  const ExchanageOrderComponentWidget({
    super.key,
    required this.symbol,
  });

  final String? symbol;

  @override
  State<ExchanageOrderComponentWidget> createState() =>
      _ExchanageOrderComponentWidgetState();
}

class _ExchanageOrderComponentWidgetState
    extends State<ExchanageOrderComponentWidget> with TickerProviderStateMixin {
  late ExchanageOrderComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExchanageOrderComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiOPEN = await ExchangeGroup.gETOrdersCall.call(
        currency: (String var1) {
          return var1.split('/')[0];
        }(FFAppState().symbol),
        pair: (String var1) {
          return var1.split('/')[1];
        }(FFAppState().symbol),
        type: 'OPEN',
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      );

      if ((_model.apiOPEN?.succeeded ?? true)) {
        _model.openConnected = true;
        setState(() {});
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
      child: Container(
        height: 400.0,
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Align(
              alignment: const Alignment(-1.0, 0),
              child: TabBar(
                labelColor: FlutterFlowTheme.of(context).primaryText,
                unselectedLabelColor:
                    FlutterFlowTheme.of(context).secondaryText,
                labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Poppins',
                      letterSpacing: 0.0,
                    ),
                unselectedLabelStyle: const TextStyle(),
                indicatorColor: FlutterFlowTheme.of(context).primary,
                padding: const EdgeInsets.all(4.0),
                tabs: [
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'fo7ghdyz' /* Open Orders */,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'ep1hxg0n' /* Order History */,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'ld92usry' /* AI Investment */,
                    ),
                  ),
                ],
                controller: _model.tabBarController,
                onTap: (i) async {
                  [
                    () async {},
                    () async {
                      _model.apiOrderHistory =
                          await ExchangeGroup.gETOrdersCall.call(
                        accesstoken: FFAppState().accesstoken,
                        currency: (String var1) {
                          return var1.split('/')[0];
                        }(widget.symbol!),
                        pair: (String var1) {
                          return var1.split('/')[1];
                        }(widget.symbol!),
                        type: 'HISTORY',
                        csrftoken: FFAppState().csrftoken,
                        sessionid: FFAppState().sessionId,
                      );

                      if ((_model.apiOrderHistory?.succeeded ?? true)) {
                        _model.historyConnected = true;
                        setState(() {});
                      }

                      setState(() {});
                    },
                    () async {
                      _model.apiLogResult =
                          await AIInvestmentGroup.getLogCall.call(
                        accesstoken: FFAppState().accesstoken,
                        csrftoken: FFAppState().csrftoken,
                        sessionid: FFAppState().sessionId,
                      );

                      if ((_model.apiLogResult?.succeeded ?? true)) {
                        _model.aiConnected = true;
                        setState(() {});
                      }

                      setState(() {});
                    }
                  ][i]();
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _model.tabBarController,
                children: [
                  KeepAliveWidgetWrapper(
                    builder: (context) => Builder(
                      builder: (context) {
                        if (_model.openConnected) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    6.0, 6.0, 6.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '581a7a8g' /* Side */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '5frr5lmo' /* Price */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'mndmwayn' /* Status */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'uyttn4lx' /*    */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 60.0)),
                                ),
                              ),
                              Divider(
                                thickness: 0.2,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 6.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final openOrders =
                                        (_model.apiOPEN?.jsonBody ?? '')
                                            .toList();
                                    if (openOrders.isEmpty) {
                                      return const EmptysearchWidget(
                                        dimantion: 120,
                                      );
                                    }

                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(openOrders.length,
                                                (openOrdersIndex) {
                                          final openOrdersItem =
                                              openOrders[openOrdersIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          ShowOrderComponentWidget(
                                                        data: openOrdersItem,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    getJsonField(
                                                      openOrdersItem,
                                                      r'''$.side''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (String var1) {
                                                              return var1 ==
                                                                  "BUY";
                                                            }(getJsonField(
                                                              openOrdersItem,
                                                              r'''$.side''',
                                                            ).toString())
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .exchangeGreen
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .errorRed,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .exchangeGreen,
                                                          ),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    getJsonField(
                                                      openOrdersItem,
                                                      r'''$.price''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    2.0,
                                                                    4.0,
                                                                    2.0),
                                                        child: Text(
                                                          getJsonField(
                                                            openOrdersItem,
                                                            r'''$.status''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Icon(
                                                    Icons
                                                        .remove_red_eye_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 60.0)),
                                            ),
                                          );
                                        }).divide(const SizedBox(height: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else {
                          return wrapWithModel(
                            model: _model.emptysearchModel1,
                            updateCallback: () => setState(() {}),
                            child: const EmptysearchWidget(
                              dimantion: 90,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  KeepAliveWidgetWrapper(
                    builder: (context) => Builder(
                      builder: (context) {
                        if (_model.historyConnected) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    6.0, 6.0, 6.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'p9ve65dz' /* Side */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'jpadshbi' /* Price */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          's3zowd3z' /* Status */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'rn0ase8m' /*    */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 60.0)),
                                ),
                              ),
                              Divider(
                                thickness: 0.2,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 6.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final historyOrders =
                                        (_model.apiOrderHistory?.jsonBody ?? '')
                                            .toList();
                                    if (historyOrders.isEmpty) {
                                      return const EmptysearchWidget(
                                        dimantion: 120,
                                      );
                                    }

                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(historyOrders.length,
                                                (historyOrdersIndex) {
                                          final historyOrdersItem =
                                              historyOrders[historyOrdersIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          ShowOrderComponentWidget(
                                                        data: historyOrdersItem,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    getJsonField(
                                                      historyOrdersItem,
                                                      r'''$.side''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (String var1) {
                                                              return var1 ==
                                                                  "BUY";
                                                            }(getJsonField(
                                                              historyOrdersItem,
                                                              r'''$.side''',
                                                            ).toString())
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .exchangeGreen
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .errorRed,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .exchangeGreen,
                                                          ),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    getJsonField(
                                                      historyOrdersItem,
                                                      r'''$.price''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    2.0,
                                                                    4.0,
                                                                    2.0),
                                                        child: Text(
                                                          getJsonField(
                                                            historyOrdersItem,
                                                            r'''$.status''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Icon(
                                                    Icons
                                                        .remove_red_eye_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 60.0)),
                                            ),
                                          );
                                        }).divide(const SizedBox(height: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else {
                          return wrapWithModel(
                            model: _model.emptysearchModel2,
                            updateCallback: () => setState(() {}),
                            child: const EmptysearchWidget(
                              dimantion: 90,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  KeepAliveWidgetWrapper(
                    builder: (context) => Builder(
                      builder: (context) {
                        if (_model.aiConnected) {
                          return Builder(
                            builder: (context) {
                              final log = (_model.apiLogResult?.jsonBody ?? '')
                                  .toList();
                              if (log.isEmpty) {
                                return const EmptysearchWidget(
                                  dimantion: 120,
                                );
                              }

                              return ListView.separated(
                                padding: const EdgeInsets.symmetric(vertical: 3.0),
                                scrollDirection: Axis.vertical,
                                itemCount: log.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 3.0),
                                itemBuilder: (context, logIndex) {
                                  final logItem = log[logIndex];
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        color: const Color(0x00000000),
                                        child: ExpandableNotifier(
                                          initialExpanded: false,
                                          child: ExpandablePanel(
                                            header: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      logItem,
                                                      r'''$.plan.title''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            collapsed: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        getJsonField(
                                                          logItem,
                                                          r'''$.symbol''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                          logItem,
                                                          r'''$.amount''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            expanded: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'vg82k0im' /* Status */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                          logItem,
                                                          r'''$.status''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    (String var1) {
                                                                      return var1 ==
                                                                          "ACTIVE";
                                                                    }(getJsonField(
                                                                      logItem,
                                                                      r'''$.status''',
                                                                    ).toString())
                                                                        ? FlutterFlowTheme.of(context).primary
                                                                        : FlutterFlowTheme.of(context).errorRed,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'uncl6w9t' /* Profit */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                                  logItem,
                                                                  r'''$.profit''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                logItem,
                                                                r'''$.profit''',
                                                              ).toString()
                                                            : 'Pending',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    getJsonField(
                                                                              logItem,
                                                                              r'''$.profit''',
                                                                            ) !=
                                                                            null
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'rxtxqzid' /* Result */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        getJsonField(
                                                                  logItem,
                                                                  r'''$.result''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                logItem,
                                                                r'''$.result''',
                                                              ).toString()
                                                            : 'Pending',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    getJsonField(
                                                                              logItem,
                                                                              r'''$.result''',
                                                                            ) !=
                                                                            null
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '7e9roeq3' /* Start */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        functions.monthDayYear(
                                                            getJsonField(
                                                          logItem,
                                                          r'''$.createdAt''',
                                                        ).toString())!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ugy9eiz5' /* Ends */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Text(
                                                        '${getJsonField(
                                                          logItem,
                                                          r'''$.duration.duration''',
                                                        ).toString()} ${getJsonField(
                                                          logItem,
                                                          r'''$.duration.timeframe''',
                                                        ).toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'm1gkuc1a' /* Amount */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            logItem,
                                                            r'''$.amount''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
                                              ),
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: true,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          return wrapWithModel(
                            model: _model.loadingModel,
                            updateCallback: () => setState(() {}),
                            child: const LoadingWidget(
                              dimension: 150,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
