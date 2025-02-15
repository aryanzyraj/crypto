import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/components/loading_widget.dart';
import '/components/ticker_row_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'all_t_i_c_k_e_r_s_component_model.dart';
export 'all_t_i_c_k_e_r_s_component_model.dart';

class AllTICKERSComponentWidget extends StatefulWidget {
  const AllTICKERSComponentWidget({
    super.key,
    bool? isAllTickers,
  }) : isAllTickers = isAllTickers ?? true;

  final bool isAllTickers;

  @override
  State<AllTICKERSComponentWidget> createState() =>
      _AllTICKERSComponentWidgetState();
}

class _AllTICKERSComponentWidgetState extends State<AllTICKERSComponentWidget>
    with TickerProviderStateMixin {
  late AllTICKERSComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllTICKERSComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiAllTickersResult = await ExchangeGroup.grtAllTickersCall.call(
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      );

      if ((_model.apiAllTickersResult?.succeeded ?? true)) {
        FFAppState().allTickers = functions
            .exchangeMAPTickers((_model.apiAllTickersResult?.jsonBody ?? ''))
            .toList()
            .cast<dynamic>();
        setState(() {});
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: const Text('Market Under Maintenance!'),
                content: const Text(
                    'Merket currently has limited access, Try again later...'),
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
        FFAppState().allTickers =
            functions.demoTickers('all').toList().cast<dynamic>();
        setState(() {});
      }

      if (!FFAppState().isWebSocketOpen) {
        FFAppState().isWebSocketOpen = true;
        await actions.updateTickersFromWebSocket(
          context,
        );
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        _model.isSeached = false;
        setState(() {});
      },
    );
    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
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

    return FutureBuilder<ApiCallResponse>(
      future: _model.tickersALL(
        requestFn: () => ExchangeGroup.getAllMarketsCall.call(
          accesstoken: FFAppState().accesstoken,
          csrftoken: FFAppState().csrftoken,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const LoadingWidget(
            dimension: 150,
          );
        }
        final columnGetAllMarketsResponse = snapshot.data!;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (widget.isAllTickers)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 55.0, 12.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          const Duration(milliseconds: 100),
                          () async {
                            if (_model.textController.text != '') {
                              _model.isSeached = true;
                              setState(() {});
                            } else {
                              _model.isSeached = false;
                              setState(() {});
                            }
                          },
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '5nkngkru' /* search coin pairs */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          suffixIcon: _model.textController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textController?.clear();
                                    if (_model.textController.text != '') {
                                      _model.isSeached = true;
                                      setState(() {});
                                    } else {
                                      _model.isSeached = false;
                                      setState(() {});
                                    }

                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Builder(
                      builder: (context) {
                        if (!_model.isSeached) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 200.0,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        6.0, 0.0, 6.0, 0.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: const Alignment(-1.0, 0),
                                          child: TabBar(
                                            isScrollable: true,
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                            unselectedLabelStyle: const TextStyle(),
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            indicatorWeight: 3.0,
                                            tabs: [
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'g4ada0cc' /* Market */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'cazf34mn' /* Trending */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'l2m1rnij' /* Hot */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'x5c4qyjs' /* Gainers */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'qvmmivun' /* Losers */,
                                                ),
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [
                                                () async {},
                                                () async {
                                                  if ((_model
                                                          .apiAllTickersResult
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().filterTicker =
                                                        functions
                                                            .exchangeFilterTicker(
                                                                ExchangeGroup
                                                                    .getAllMarketsCall
                                                                    .trendingSymbol(
                                                                      columnGetAllMarketsResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.toList(),
                                                                (_model.apiAllTickersResult
                                                                        ?.jsonBody ??
                                                                    ''))
                                                            .toList()
                                                            .cast<dynamic>();
                                                    setState(() {});
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: const Text(
                                                                'Limited Access'),
                                                            content: const Text(
                                                                'Market under maitenance'),
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
                                                    FFAppState().filterTicker =
                                                        functions
                                                            .demoTickers('USDT')
                                                            .toList()
                                                            .cast<dynamic>();
                                                    setState(() {});
                                                  }
                                                },
                                                () async {
                                                  if ((_model
                                                          .apiAllTickersResult
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().filterTicker =
                                                        functions
                                                            .exchangeFilterTicker(
                                                                ExchangeGroup
                                                                    .getAllMarketsCall
                                                                    .hotSymbol(
                                                                      columnGetAllMarketsResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.toList(),
                                                                (_model.apiAllTickersResult
                                                                        ?.jsonBody ??
                                                                    ''))
                                                            .toList()
                                                            .cast<dynamic>();
                                                    setState(() {});
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: const Text(
                                                                'Limited Access'),
                                                            content: const Text(
                                                                'Market under maitenance'),
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
                                                    FFAppState().filterTicker =
                                                        functions
                                                            .demoTickers('USDT')
                                                            .toList()
                                                            .cast<dynamic>();
                                                    setState(() {});
                                                  }
                                                },
                                                () async {
                                                  if ((_model
                                                          .apiAllTickersResult
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().filterTicker =
                                                        (_model.apiAllTickersResult
                                                                    ?.jsonBody ??
                                                                '')
                                                            .toList()
                                                            .cast<dynamic>();
                                                    setState(() {});
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: const Text(
                                                                'Limited Access'),
                                                            content: const Text(
                                                                'Market under maitenance'),
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
                                                    FFAppState().filterTicker =
                                                        functions
                                                            .demoTickers('USDT')
                                                            .toList()
                                                            .cast<dynamic>();
                                                    setState(() {});
                                                  }
                                                },
                                                () async {
                                                  if ((_model
                                                          .apiAllTickersResult
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().filterTicker =
                                                        functions
                                                            .exchangeLosers((_model
                                                                    .apiAllTickersResult
                                                                    ?.jsonBody ??
                                                                ''))
                                                            .toList()
                                                            .cast<dynamic>();
                                                    setState(() {});
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: const Text(
                                                                'Limited Access'),
                                                            content: const Text(
                                                                'Market under maitenance'),
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
                                                    FFAppState().filterTicker =
                                                        functions
                                                            .demoTickers('USDT')
                                                            .toList()
                                                            .cast<dynamic>();
                                                    setState(() {});
                                                  }
                                                }
                                              ][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller: _model.tabBarController,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            children: [
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (widget.isAllTickers)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    8.0,
                                                                    12.0,
                                                                    8.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowChoiceChips(
                                                                options: [
                                                                  ChipData(FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ccxoenu7' /* All */,
                                                                  )),
                                                                  ChipData(FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'fg9wjk99' /* USDT */,
                                                                  )),
                                                                  ChipData(FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '51996nz2' /* TUSD */,
                                                                  )),
                                                                  ChipData(FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'eywwwfhq' /* BTC */,
                                                                  )),
                                                                  ChipData(FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'jpuyy2fw' /* ETH */,
                                                                  )),
                                                                  ChipData(FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'cl6tmi55' /* BNB */,
                                                                  ))
                                                                ],
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      _model.choiceChipsValue =
                                                                          val?.firstOrNull);
                                                                  if ((_model
                                                                          .apiAllTickersResult
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    if (_model
                                                                            .choiceChipsValue !=
                                                                        'All') {
                                                                      FFAppState()
                                                                          .filterTicker = () {
                                                                        if (_model.choiceChipsValue ==
                                                                            'USDT') {
                                                                          return functions.exchangeSearch(
                                                                              'USDT',
                                                                              (_model.apiAllTickersResult?.jsonBody ?? ''));
                                                                        } else if (_model.choiceChipsValue ==
                                                                            'TUSD') {
                                                                          return functions.exchangeSearch(
                                                                              'TUSD',
                                                                              (_model.apiAllTickersResult?.jsonBody ?? ''));
                                                                        } else if (_model.choiceChipsValue ==
                                                                            'BTC') {
                                                                          return functions.exchangeSearch(
                                                                              'BTC',
                                                                              (_model.apiAllTickersResult?.jsonBody ?? ''));
                                                                        } else if (_model.choiceChipsValue ==
                                                                            'ETH') {
                                                                          return (_model.apiAllTickersResult?.jsonBody ??
                                                                              '');
                                                                        } else if (_model.choiceChipsValue ==
                                                                            'BNB') {
                                                                          return (_model.apiAllTickersResult?.jsonBody ??
                                                                              '');
                                                                        } else {
                                                                          return functions.exchangeSearch(
                                                                              'USDT',
                                                                              (_model.apiAllTickersResult?.jsonBody ?? ''));
                                                                        }
                                                                      }()
                                                                          .toList()
                                                                          .cast<dynamic>();
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  } else {
                                                                    FFAppState().filterTicker = functions
                                                                        .demoTickers(
                                                                            'USDT')
                                                                        .toList()
                                                                        .cast<
                                                                            dynamic>();
                                                                    setState(
                                                                        () {});
                                                                  }
                                                                },
                                                                selectedChipStyle:
                                                                    ChipStyle(
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  iconColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  iconSize: 0.0,
                                                                  labelPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                                  elevation:
                                                                      4.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                unselectedChipStyle:
                                                                    ChipStyle(
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0x00000000),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  iconColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  iconSize:
                                                                      18.0,
                                                                  labelPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                chipSpacing:
                                                                    12.0,
                                                                rowSpacing:
                                                                    12.0,
                                                                multiselect:
                                                                    false,
                                                                initialized:
                                                                    _model.choiceChipsValue !=
                                                                        null,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                controller: _model
                                                                        .choiceChipsValueController ??=
                                                                    FormFieldController<
                                                                        List<
                                                                            String>>(
                                                                  [
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ihlix0wp' /* All */,
                                                                    )
                                                                  ],
                                                                ),
                                                                wrapped: false,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          18.0,
                                                                          6.0,
                                                                          18.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    flex: 4,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ng6cbgie' /* Name/Vol */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 2,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'spgj0c7w' /* Last Price */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 2,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'gmbnv1ff' /* 24h chg% */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            12.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (_model.choiceChipsValue ==
                                                                              'All') {
                                                                            return Builder(
                                                                              builder: (context) {
                                                                                final allTickersList = FFAppState().allTickers.toList().take(30).toList();
                                                                                if (allTickersList.isEmpty) {
                                                                                  return const EmptyStateSimpleWidget(
                                                                                    icon: Icon(
                                                                                      Icons.currency_bitcoin,
                                                                                      color: Colors.transparent,
                                                                                      size: 50.0,
                                                                                    ),
                                                                                    title: 'Loaing...',
                                                                                    body: ' ',
                                                                                  );
                                                                                }

                                                                                return ListView.separated(
                                                                                  padding: EdgeInsets.zero,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: allTickersList.length,
                                                                                  separatorBuilder: (_, __) => const SizedBox(height: 15.0),
                                                                                  itemBuilder: (context, allTickersListIndex) {
                                                                                    final allTickersListItem = allTickersList[allTickersListIndex];
                                                                                    return TickerRowWidget(
                                                                                      key: Key('Keyau6_${allTickersListIndex}_of_${allTickersList.length}'),
                                                                                      item: allTickersListItem,
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            );
                                                                          } else {
                                                                            return Builder(
                                                                              builder: (context) {
                                                                                final filrterTickers = FFAppState().filterTicker.toList().take(20).toList();

                                                                                return ListView.separated(
                                                                                  padding: EdgeInsets.zero,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: filrterTickers.length,
                                                                                  separatorBuilder: (_, __) => const SizedBox(height: 15.0),
                                                                                  itemBuilder: (context, filrterTickersIndex) {
                                                                                    final filrterTickersItem = filrterTickers[filrterTickersIndex];
                                                                                    return TickerRowWidget(
                                                                                      key: Key('Keynij_${filrterTickersIndex}_of_${filrterTickers.length}'),
                                                                                      item: filrterTickersItem,
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  6.0,
                                                                  18.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            flex: 4,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'eimx0h6w' /* Name/Vol */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 2,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pz7s21xn' /* Last Price */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'fzge3x8f' /* 24h chg% */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final trendTickersList =
                                                                      FFAppState()
                                                                          .filterTicker
                                                                          .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        vertical:
                                                                            15.0),
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        trendTickersList
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        const SizedBox(
                                                                            height:
                                                                                15.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            trendTickersListIndex) {
                                                                      final trendTickersListItem =
                                                                          trendTickersList[
                                                                              trendTickersListIndex];
                                                                      return TickerRowWidget(
                                                                        key: Key(
                                                                            'Keyxek_${trendTickersListIndex}_of_${trendTickersList.length}'),
                                                                        item:
                                                                            trendTickersListItem,
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  6.0,
                                                                  18.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            flex: 4,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'jsf8dkx7' /* Name/Vol */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 2,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'vh1b09an' /* Last Price */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'c7nqj2ct' /* 24h chg% */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final hotTickersList =
                                                                      FFAppState()
                                                                          .filterTicker
                                                                          .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        vertical:
                                                                            15.0),
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        hotTickersList
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        const SizedBox(
                                                                            height:
                                                                                15.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            hotTickersListIndex) {
                                                                      final hotTickersListItem =
                                                                          hotTickersList[
                                                                              hotTickersListIndex];
                                                                      return TickerRowWidget(
                                                                        key: Key(
                                                                            'Keya98_${hotTickersListIndex}_of_${hotTickersList.length}'),
                                                                        item:
                                                                            hotTickersListItem,
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  6.0,
                                                                  18.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            flex: 4,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    't9wxy1xt' /* Name/Vol */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 2,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '85rjjlf2' /* Last Price */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'lslynjfz' /* 24h chg% */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final gainersTickersList =
                                                                      FFAppState()
                                                                          .filterTicker
                                                                          .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        vertical:
                                                                            15.0),
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        gainersTickersList
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        const SizedBox(
                                                                            height:
                                                                                15.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            gainersTickersListIndex) {
                                                                      final gainersTickersListItem =
                                                                          gainersTickersList[
                                                                              gainersTickersListIndex];
                                                                      return TickerRowWidget(
                                                                        key: Key(
                                                                            'Key8dk_${gainersTickersListIndex}_of_${gainersTickersList.length}'),
                                                                        item:
                                                                            gainersTickersListItem,
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  6.0,
                                                                  18.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            flex: 4,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'gtosn6r2' /* Name/Vol */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 2,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'q2e3w5dl' /* Last Price */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ab32aut5' /* 24h chg% */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final losersTickersList =
                                                                      FFAppState()
                                                                          .filterTicker
                                                                          .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        vertical:
                                                                            15.0),
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        losersTickersList
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        const SizedBox(
                                                                            height:
                                                                                15.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            losersTickersListIndex) {
                                                                      final losersTickersListItem =
                                                                          losersTickersList[
                                                                              losersTickersListIndex];
                                                                      return TickerRowWidget(
                                                                        key: Key(
                                                                            'Keyyy6_${losersTickersListIndex}_of_${losersTickersList.length}'),
                                                                        item:
                                                                            losersTickersListItem,
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      18.0, 6.0, 18.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        flex: 4,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4sybccp8' /* Name/Vol */,
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
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'wo70hfhg' /* Last Price */,
                                                ),
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
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '48ckkn8k' /* 24h chg% */,
                                                ),
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 6.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final searchedTickersList = functions
                                                .exchangeSearch(
                                                    _model.textController.text,
                                                    (_model.apiAllTickersResult
                                                            ?.jsonBody ??
                                                        ''))
                                                .toList();

                                            return ListView.separated(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 15.0),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  searchedTickersList.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 15.0),
                                              itemBuilder: (context,
                                                  searchedTickersListIndex) {
                                                final searchedTickersListItem =
                                                    searchedTickersList[
                                                        searchedTickersListIndex];
                                                return TickerRowWidget(
                                                  key: Key(
                                                      'Key149_${searchedTickersListIndex}_of_${searchedTickersList.length}'),
                                                  item: searchedTickersListItem,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
        );
      },
    );
  }
}
