import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'exchange_all_tickers_model.dart';
export 'exchange_all_tickers_model.dart';

class ExchangeAllTickersWidget extends StatefulWidget {
  const ExchangeAllTickersWidget({super.key});

  @override
  State<ExchangeAllTickersWidget> createState() =>
      _ExchangeAllTickersWidgetState();
}

class _ExchangeAllTickersWidgetState extends State<ExchangeAllTickersWidget>
    with TickerProviderStateMixin {
  late ExchangeAllTickersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExchangeAllTickersModel());

    // On page load action.
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

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

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
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: const AlignmentDirectional(0.0, 1.0),
          children: [
            FutureBuilder<ApiCallResponse>(
              future: _model.tickersall(
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          12.0, 55.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
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
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  '37ay5uzc' /* search coin pairs */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                suffixIcon: _model
                                        .textController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.textController?.clear();
                                          if (_model.textController.text !=
                                                  '') {
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model.textControllerValidator
                                  .asValidator(context),
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 0.0, 6.0, 0.0),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: const Alignment(-1.0, 0),
                                                  child: TabBar(
                                                    isScrollable: true,
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    unselectedLabelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    unselectedLabelStyle:
                                                        const TextStyle(),
                                                    indicatorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                    indicatorWeight: 3.0,
                                                    tabs: [
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'f7dy78u9' /* Market */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'bfw2r60r' /* Trending */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'icu3e8sj' /* Hot */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'krwvq3uy' /* Gainers */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'nofpi8lo' /* Losers */,
                                                        ),
                                                      ),
                                                    ],
                                                    controller:
                                                        _model.tabBarController,
                                                    onTap: (i) async {
                                                      [
                                                        () async {},
                                                        () async {
                                                          if ((_model
                                                                  .apiAllTickersResult
                                                                  ?.succeeded ??
                                                              true)) {
                                                            FFAppState()
                                                                    .filterTicker =
                                                                functions
                                                                    .exchangeFilterTicker(
                                                                        ExchangeGroup
                                                                            .getAllMarketsCall
                                                                            .trendingSymbol(
                                                                              columnGetAllMarketsResponse.jsonBody,
                                                                            )
                                                                            ?.toList(),
                                                                        (_model.apiAllTickersResult?.jsonBody ??
                                                                            ''))
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            setState(() {});
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: const Text(
                                                                        'Limited Access'),
                                                                    content: const Text(
                                                                        'Market under maitenance'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: const Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            FFAppState()
                                                                    .filterTicker =
                                                                functions
                                                                    .demoTickers(
                                                                        'USDT')
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            setState(() {});
                                                          }
                                                        },
                                                        () async {
                                                          if ((_model
                                                                  .apiAllTickersResult
                                                                  ?.succeeded ??
                                                              true)) {
                                                            FFAppState()
                                                                    .filterTicker =
                                                                functions
                                                                    .exchangeFilterTicker(
                                                                        ExchangeGroup
                                                                            .getAllMarketsCall
                                                                            .hotSymbol(
                                                                              columnGetAllMarketsResponse.jsonBody,
                                                                            )
                                                                            ?.toList(),
                                                                        (_model.apiAllTickersResult?.jsonBody ??
                                                                            ''))
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            setState(() {});
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: const Text(
                                                                        'Limited Access'),
                                                                    content: const Text(
                                                                        'Market under maitenance'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: const Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            FFAppState()
                                                                    .filterTicker =
                                                                functions
                                                                    .demoTickers(
                                                                        'USDT')
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            setState(() {});
                                                          }
                                                        },
                                                        () async {
                                                          if ((_model
                                                                  .apiAllTickersResult
                                                                  ?.succeeded ??
                                                              true)) {
                                                            FFAppState().filterTicker = functions
                                                                .exchangeGainers((_model
                                                                        .apiAllTickersResult
                                                                        ?.jsonBody ??
                                                                    ''))
                                                                .toList()
                                                                .cast<
                                                                    dynamic>();
                                                            setState(() {});
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: const Text(
                                                                        'Limited Access'),
                                                                    content: const Text(
                                                                        'Market under maitenance'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: const Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            FFAppState()
                                                                    .filterTicker =
                                                                functions
                                                                    .demoTickers(
                                                                        'USDT')
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            setState(() {});
                                                          }
                                                        },
                                                        () async {
                                                          if ((_model
                                                                  .apiAllTickersResult
                                                                  ?.succeeded ??
                                                              true)) {
                                                            FFAppState().filterTicker = functions
                                                                .exchangeLosers((_model
                                                                        .apiAllTickersResult
                                                                        ?.jsonBody ??
                                                                    ''))
                                                                .toList()
                                                                .cast<
                                                                    dynamic>();
                                                            setState(() {});
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: const Text(
                                                                        'Limited Access'),
                                                                    content: const Text(
                                                                        'Market under maitenance'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: const Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            FFAppState()
                                                                    .filterTicker =
                                                                functions
                                                                    .demoTickers(
                                                                        'USDT')
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                            setState(() {});
                                                          }
                                                        }
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller:
                                                        _model.tabBarController,
                                                    children: [
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
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
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                          'z6q3snwg' /* All */,
                                                                        )),
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                          'c419vcpa' /* USDT */,
                                                                        )),
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                          'jlqkqkpy' /* TUSD */,
                                                                        )),
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                          'rfx2itpg' /* BTC */,
                                                                        )),
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                          'y58yvpq4' /* ETH */,
                                                                        )),
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                          'shujjxsh' /* BNB */,
                                                                        ))
                                                                      ],
                                                                      onChanged:
                                                                          (val) async {
                                                                        setState(() =>
                                                                            _model.choiceChipsValue =
                                                                                val?.firstOrNull);
                                                                        if ((_model.apiAllTickersResult?.succeeded ??
                                                                            true)) {
                                                                          if (_model.choiceChipsValue !=
                                                                              'All') {
                                                                            FFAppState().filterTicker = () {
                                                                              if (_model.choiceChipsValue == 'USDT') {
                                                                                return functions.exchangeSearch('USDT', (_model.apiAllTickersResult?.jsonBody ?? ''));
                                                                              } else if (_model.choiceChipsValue == 'TUSD') {
                                                                                return functions.exchangeSearch('TUSD', (_model.apiAllTickersResult?.jsonBody ?? ''));
                                                                              } else if (_model.choiceChipsValue == 'BTC') {
                                                                                return functions.exchangeSearch('BTC', (_model.apiAllTickersResult?.jsonBody ?? ''));
                                                                              } else if (_model.choiceChipsValue == 'ETH') {
                                                                                return functions.exchangeSearch('ETH', (_model.apiAllTickersResult?.jsonBody ?? ''));
                                                                              } else if (_model.choiceChipsValue == 'BNB') {
                                                                                return functions.exchangeSearch('BNB', (_model.apiAllTickersResult?.jsonBody ?? ''));
                                                                              } else {
                                                                                return functions.exchangeSearch('USDT', (_model.apiAllTickersResult?.jsonBody ?? ''));
                                                                              }
                                                                            }()
                                                                                .toList()
                                                                                .cast<dynamic>();
                                                                            setState(() {});
                                                                          }
                                                                        } else {
                                                                          FFAppState().filterTicker = functions
                                                                              .demoTickers('USDT')
                                                                              .toList()
                                                                              .cast<dynamic>();
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                      },
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        iconSize:
                                                                            0.0,
                                                                        labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            7.0,
                                                                            0.0,
                                                                            7.0,
                                                                            0.0),
                                                                        elevation:
                                                                            4.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            const Color(0x00000000),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        iconSize:
                                                                            18.0,
                                                                        labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
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
                                                                              List<String>>(
                                                                        [
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'curq48a7' /* All */,
                                                                          )
                                                                        ],
                                                                      ),
                                                                      wrapped:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          18.0,
                                                                          6.0,
                                                                          18.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                4,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'pqki7b23' /* Name/Vol */,
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
                                                                          Flexible(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'gj0wlltq' /* Last Price */,
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
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '58ust850' /* 24h chg% */,
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
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  if (_model.choiceChipsValue == 'All') {
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
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                HapticFeedback.lightImpact();
                                                                                                FFAppState().symbol = getJsonField(
                                                                                                  allTickersListItem,
                                                                                                  r'''$.symbol''',
                                                                                                ).toString();
                                                                                                setState(() {});

                                                                                                context.pushNamed(
                                                                                                  'exchangeChart',
                                                                                                  queryParameters: {
                                                                                                    'symbol': serializeParam(
                                                                                                      getJsonField(
                                                                                                        allTickersListItem,
                                                                                                        r'''$.symbol''',
                                                                                                      ).toString(),
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );
                                                                                              },
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    flex: 4,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                allTickersListItem,
                                                                                                                r'''$.symbol''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              (String var1) {
                                                                                                                return '${(double.parse(var1) / 1000000).toStringAsFixed(1)}M';
                                                                                                              }(getJsonField(
                                                                                                                allTickersListItem,
                                                                                                                r'''$.quoteVolume''',
                                                                                                              ).toString()),
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    flex: 2,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                allTickersListItem,
                                                                                                                r'''$.last''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              '\$${getJsonField(
                                                                                                                allTickersListItem,
                                                                                                                r'''$.last''',
                                                                                                              ).toString()}',
                                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    flex: 2,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 80.0,
                                                                                                              height: 35.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: valueOrDefault<Color>(
                                                                                                                  () {
                                                                                                                    if ((String var1) {
                                                                                                                      return var1 == "up";
                                                                                                                    }(getJsonField(
                                                                                                                      allTickersListItem,
                                                                                                                      r'''$.direction''',
                                                                                                                    ).toString())) {
                                                                                                                      return FlutterFlowTheme.of(context).exchangeGreen;
                                                                                                                    } else if ((String var1) {
                                                                                                                      return var1 == "down";
                                                                                                                    }(getJsonField(
                                                                                                                      allTickersListItem,
                                                                                                                      r'''$.direction''',
                                                                                                                    ).toString())) {
                                                                                                                      return FlutterFlowTheme.of(context).errorRed;
                                                                                                                    } else {
                                                                                                                      return FlutterFlowTheme.of(context).alternate;
                                                                                                                    }
                                                                                                                  }(),
                                                                                                                  FlutterFlowTheme.of(context).exchangeGreen,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                                              ),
                                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  '${getJsonField(
                                                                                                                    allTickersListItem,
                                                                                                                    r'''$.change''',
                                                                                                                  ).toString()} %',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
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
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                HapticFeedback.lightImpact();
                                                                                                FFAppState().symbol = getJsonField(
                                                                                                  filrterTickersItem,
                                                                                                  r'''$.symbol''',
                                                                                                ).toString();
                                                                                                setState(() {});

                                                                                                context.pushNamed(
                                                                                                  'exchangeChart',
                                                                                                  queryParameters: {
                                                                                                    'symbol': serializeParam(
                                                                                                      getJsonField(
                                                                                                        filrterTickersItem,
                                                                                                        r'''$.symbol''',
                                                                                                      ).toString(),
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );
                                                                                              },
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    flex: 4,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                filrterTickersItem,
                                                                                                                r'''$.symbol''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              (String var1) {
                                                                                                                return '${(double.parse(var1) / 1000000).toStringAsFixed(1)}M';
                                                                                                              }(getJsonField(
                                                                                                                filrterTickersItem,
                                                                                                                r'''$.quoteVolume''',
                                                                                                              ).toString()),
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    flex: 2,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                filrterTickersItem,
                                                                                                                r'''$.last''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              '\$${getJsonField(
                                                                                                                filrterTickersItem,
                                                                                                                r'''$.last''',
                                                                                                              ).toString()}',
                                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    flex: 2,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 80.0,
                                                                                                              height: 35.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: valueOrDefault<Color>(
                                                                                                                  () {
                                                                                                                    if ((String var1) {
                                                                                                                      return var1 == "up";
                                                                                                                    }(getJsonField(
                                                                                                                      filrterTickersItem,
                                                                                                                      r'''$.direction''',
                                                                                                                    ).toString())) {
                                                                                                                      return FlutterFlowTheme.of(context).exchangeGreen;
                                                                                                                    } else if ((String var1) {
                                                                                                                      return var1 == "down";
                                                                                                                    }(getJsonField(
                                                                                                                      filrterTickersItem,
                                                                                                                      r'''$.direction''',
                                                                                                                    ).toString())) {
                                                                                                                      return FlutterFlowTheme.of(context).errorRed;
                                                                                                                    } else {
                                                                                                                      return FlutterFlowTheme.of(context).alternate;
                                                                                                                    }
                                                                                                                  }(),
                                                                                                                  FlutterFlowTheme.of(context).exchangeGreen,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                                              ),
                                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  '${getJsonField(
                                                                                                                    filrterTickersItem,
                                                                                                                    r'''$.change''',
                                                                                                                  ).toString()} %',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
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
                                                        builder: (context) =>
                                                            Column(
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
                                                                            'bo98bdzt' /* Name/Vol */,
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
                                                                              'h83cauep' /* Last Price */,
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
                                                                              'ydwt0sua' /* 24h chg% */,
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
                                                                          final trendTickersList = FFAppState()
                                                                              .filterTicker
                                                                              .toList();

                                                                          return ListView
                                                                              .separated(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(vertical: 15.0),
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                trendTickersList.length,
                                                                            separatorBuilder: (_, __) =>
                                                                                const SizedBox(height: 15.0),
                                                                            itemBuilder:
                                                                                (context, trendTickersListIndex) {
                                                                              final trendTickersListItem = trendTickersList[trendTickersListIndex];
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  FFAppState().symbol = getJsonField(
                                                                                    trendTickersListItem,
                                                                                    r'''$.symbol''',
                                                                                  ).toString();
                                                                                  setState(() {});

                                                                                  context.pushNamed(
                                                                                    'exchangeChart',
                                                                                    queryParameters: {
                                                                                      'symbol': serializeParam(
                                                                                        getJsonField(
                                                                                          trendTickersListItem,
                                                                                          r'''$.symbol''',
                                                                                        ).toString(),
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      flex: 4,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                getJsonField(
                                                                                                  trendTickersListItem,
                                                                                                  r'''$.symbol''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                (String var1) {
                                                                                                  return '${(double.parse(var1) / 1000000).toStringAsFixed(1)}M';
                                                                                                }(getJsonField(
                                                                                                  trendTickersListItem,
                                                                                                  r'''$.quoteVolume''',
                                                                                                ).toString()),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 2,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                getJsonField(
                                                                                                  trendTickersListItem,
                                                                                                  r'''$.last''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                '\$${getJsonField(
                                                                                                  trendTickersListItem,
                                                                                                  r'''$.last''',
                                                                                                ).toString()}',
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 2,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 80.0,
                                                                                                height: 35.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    () {
                                                                                                      if ((String var1) {
                                                                                                        return var1 == "up";
                                                                                                      }(getJsonField(
                                                                                                        trendTickersListItem,
                                                                                                        r'''$.direction''',
                                                                                                      ).toString())) {
                                                                                                        return FlutterFlowTheme.of(context).exchangeGreen;
                                                                                                      } else if ((String var1) {
                                                                                                        return var1 == "down";
                                                                                                      }(getJsonField(
                                                                                                        trendTickersListItem,
                                                                                                        r'''$.direction''',
                                                                                                      ).toString())) {
                                                                                                        return FlutterFlowTheme.of(context).errorRed;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).alternate;
                                                                                                      }
                                                                                                    }(),
                                                                                                    FlutterFlowTheme.of(context).exchangeGreen,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Text(
                                                                                                    '${getJsonField(
                                                                                                      trendTickersListItem,
                                                                                                      r'''$.change''',
                                                                                                    ).toString()} %',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            Column(
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
                                                                            '2r7mjhu2' /* Name/Vol */,
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
                                                                              'wez4keq2' /* Last Price */,
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
                                                                              'qqby3ubq' /* 24h chg% */,
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
                                                                          final hotTickersList = FFAppState()
                                                                              .filterTicker
                                                                              .toList();

                                                                          return ListView
                                                                              .separated(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(vertical: 15.0),
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                hotTickersList.length,
                                                                            separatorBuilder: (_, __) =>
                                                                                const SizedBox(height: 15.0),
                                                                            itemBuilder:
                                                                                (context, hotTickersListIndex) {
                                                                              final hotTickersListItem = hotTickersList[hotTickersListIndex];
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  FFAppState().symbol = getJsonField(
                                                                                    hotTickersListItem,
                                                                                    r'''$.symbol''',
                                                                                  ).toString();
                                                                                  setState(() {});

                                                                                  context.pushNamed(
                                                                                    'exchangeChart',
                                                                                    queryParameters: {
                                                                                      'symbol': serializeParam(
                                                                                        getJsonField(
                                                                                          hotTickersListItem,
                                                                                          r'''$.symbol''',
                                                                                        ).toString(),
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      flex: 4,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                getJsonField(
                                                                                                  hotTickersListItem,
                                                                                                  r'''$.symbol''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                (String var1) {
                                                                                                  return '${(double.parse(var1) / 1000000).toStringAsFixed(1)}M';
                                                                                                }(getJsonField(
                                                                                                  hotTickersListItem,
                                                                                                  r'''$.quoteVolume''',
                                                                                                ).toString()),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 2,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                getJsonField(
                                                                                                  hotTickersListItem,
                                                                                                  r'''$.last''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                '\$${getJsonField(
                                                                                                  hotTickersListItem,
                                                                                                  r'''$.last''',
                                                                                                ).toString()}',
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 2,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 80.0,
                                                                                                height: 35.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    () {
                                                                                                      if ((String var1) {
                                                                                                        return var1 == "up";
                                                                                                      }(getJsonField(
                                                                                                        hotTickersListItem,
                                                                                                        r'''$.direction''',
                                                                                                      ).toString())) {
                                                                                                        return FlutterFlowTheme.of(context).exchangeGreen;
                                                                                                      } else if ((String var1) {
                                                                                                        return var1 == "down";
                                                                                                      }(getJsonField(
                                                                                                        hotTickersListItem,
                                                                                                        r'''$.direction''',
                                                                                                      ).toString())) {
                                                                                                        return FlutterFlowTheme.of(context).errorRed;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).alternate;
                                                                                                      }
                                                                                                    }(),
                                                                                                    FlutterFlowTheme.of(context).exchangeGreen,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Text(
                                                                                                    '${getJsonField(
                                                                                                      hotTickersListItem,
                                                                                                      r'''$.change''',
                                                                                                    ).toString()} %',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            Column(
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
                                                                            'lccxbzcr' /* Name/Vol */,
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
                                                                              '2n62vxc6' /* Last Price */,
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
                                                                              'q8ou98ie' /* 24h chg% */,
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
                                                                          final gainersTickersList = FFAppState()
                                                                              .filterTicker
                                                                              .toList();

                                                                          return ListView
                                                                              .separated(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(vertical: 15.0),
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                gainersTickersList.length,
                                                                            separatorBuilder: (_, __) =>
                                                                                const SizedBox(height: 15.0),
                                                                            itemBuilder:
                                                                                (context, gainersTickersListIndex) {
                                                                              final gainersTickersListItem = gainersTickersList[gainersTickersListIndex];
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  FFAppState().symbol = getJsonField(
                                                                                    gainersTickersListItem,
                                                                                    r'''$.symbol''',
                                                                                  ).toString();
                                                                                  setState(() {});

                                                                                  context.pushNamed(
                                                                                    'exchangeChart',
                                                                                    queryParameters: {
                                                                                      'symbol': serializeParam(
                                                                                        getJsonField(
                                                                                          gainersTickersListItem,
                                                                                          r'''$.symbol''',
                                                                                        ).toString(),
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      flex: 4,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                getJsonField(
                                                                                                  gainersTickersListItem,
                                                                                                  r'''$.symbol''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                (String var1) {
                                                                                                  return '${(double.parse(var1) / 1000000).toStringAsFixed(1)}M';
                                                                                                }(getJsonField(
                                                                                                  gainersTickersListItem,
                                                                                                  r'''$.quoteVolume''',
                                                                                                ).toString()),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 2,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                getJsonField(
                                                                                                  gainersTickersListItem,
                                                                                                  r'''$.last''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                '\$${getJsonField(
                                                                                                  gainersTickersListItem,
                                                                                                  r'''$.last''',
                                                                                                ).toString()}',
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 2,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 80.0,
                                                                                                height: 35.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    () {
                                                                                                      if ((String var1) {
                                                                                                        return var1 == "up";
                                                                                                      }(getJsonField(
                                                                                                        gainersTickersListItem,
                                                                                                        r'''$.direction''',
                                                                                                      ).toString())) {
                                                                                                        return FlutterFlowTheme.of(context).exchangeGreen;
                                                                                                      } else if ((String var1) {
                                                                                                        return var1 == "down";
                                                                                                      }(getJsonField(
                                                                                                        gainersTickersListItem,
                                                                                                        r'''$.direction''',
                                                                                                      ).toString())) {
                                                                                                        return FlutterFlowTheme.of(context).errorRed;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).alternate;
                                                                                                      }
                                                                                                    }(),
                                                                                                    FlutterFlowTheme.of(context).exchangeGreen,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Text(
                                                                                                    '${getJsonField(
                                                                                                      gainersTickersListItem,
                                                                                                      r'''$.change''',
                                                                                                    ).toString()} %',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            Column(
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
                                                                            'iuzuj3bs' /* Name/Vol */,
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
                                                                              'evpj0h66' /* Last Price */,
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
                                                                              'n2zjlqxz' /* 24h chg% */,
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
                                                                          final losersTickersList = FFAppState()
                                                                              .filterTicker
                                                                              .toList();

                                                                          return ListView
                                                                              .separated(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(vertical: 15.0),
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                losersTickersList.length,
                                                                            separatorBuilder: (_, __) =>
                                                                                const SizedBox(height: 15.0),
                                                                            itemBuilder:
                                                                                (context, losersTickersListIndex) {
                                                                              final losersTickersListItem = losersTickersList[losersTickersListIndex];
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  HapticFeedback.lightImpact();
                                                                                  FFAppState().symbol = getJsonField(
                                                                                    losersTickersListItem,
                                                                                    r'''$.symbol''',
                                                                                  ).toString();
                                                                                  setState(() {});

                                                                                  context.pushNamed(
                                                                                    'exchangeChart',
                                                                                    queryParameters: {
                                                                                      'symbol': serializeParam(
                                                                                        getJsonField(
                                                                                          losersTickersListItem,
                                                                                          r'''$.symbol''',
                                                                                        ).toString(),
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      flex: 4,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                getJsonField(
                                                                                                  losersTickersListItem,
                                                                                                  r'''$.symbol''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                (String var1) {
                                                                                                  return '${(double.parse(var1) / 1000000).toStringAsFixed(1)}M';
                                                                                                }(getJsonField(
                                                                                                  losersTickersListItem,
                                                                                                  r'''$.quoteVolume''',
                                                                                                ).toString()),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 2,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                getJsonField(
                                                                                                  losersTickersListItem,
                                                                                                  r'''$.last''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                '\$${getJsonField(
                                                                                                  losersTickersListItem,
                                                                                                  r'''$.last''',
                                                                                                ).toString()}',
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      flex: 2,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 80.0,
                                                                                                height: 35.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: valueOrDefault<Color>(
                                                                                                    () {
                                                                                                      if ((String var1) {
                                                                                                        return var1 == "up";
                                                                                                      }(getJsonField(
                                                                                                        losersTickersListItem,
                                                                                                        r'''$.direction''',
                                                                                                      ).toString())) {
                                                                                                        return FlutterFlowTheme.of(context).exchangeGreen;
                                                                                                      } else if ((String var1) {
                                                                                                        return var1 == "down";
                                                                                                      }(getJsonField(
                                                                                                        losersTickersListItem,
                                                                                                        r'''$.direction''',
                                                                                                      ).toString())) {
                                                                                                        return FlutterFlowTheme.of(context).errorRed;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).alternate;
                                                                                                      }
                                                                                                    }(),
                                                                                                    FlutterFlowTheme.of(context).exchangeGreen,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: Text(
                                                                                                    '${getJsonField(
                                                                                                      losersTickersListItem,
                                                                                                      r'''$.change''',
                                                                                                    ).toString()} %',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  18.0, 6.0, 18.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                flex: 4,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'mbk3rhcx' /* Name/Vol */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
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
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                flex: 2,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'pz8soiqh' /* Last Price */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                flex: 2,
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'yop80k6z' /* 24h chg% */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
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
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 0.0, 6.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final searchedTickersList = functions
                                                        .exchangeSearch(
                                                            _model
                                                                .textController
                                                                .text,
                                                            (_model.apiAllTickersResult
                                                                    ?.jsonBody ??
                                                                ''))
                                                        .map((e) => e)
                                                        .toList();

                                                    return ListView.separated(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              vertical: 15.0),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          searchedTickersList
                                                              .length,
                                                      separatorBuilder:
                                                          (_, __) => const SizedBox(
                                                              height: 15.0),
                                                      itemBuilder: (context,
                                                          searchedTickersListIndex) {
                                                        final searchedTickersListItem =
                                                            searchedTickersList[
                                                                searchedTickersListIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            HapticFeedback
                                                                .lightImpact();
                                                            FFAppState()
                                                                    .symbol =
                                                                getJsonField(
                                                              searchedTickersListItem,
                                                              r'''$.symbol''',
                                                            ).toString();
                                                            setState(() {});

                                                            context.pushNamed(
                                                              'exchangeChart',
                                                              queryParameters: {
                                                                'symbol':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    searchedTickersListItem,
                                                                    r'''$.symbol''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                flex: 4,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            searchedTickersListItem,
                                                                            r'''$.symbol''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          (String
                                                                              var1) {
                                                                            return '${(double.parse(var1) / 1000000).toStringAsFixed(1)}M';
                                                                          }(getJsonField(
                                                                            searchedTickersListItem,
                                                                            r'''$.quoteVolume''',
                                                                          ).toString()),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
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
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            searchedTickersListItem,
                                                                            r'''$.last''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          '\$${getJsonField(
                                                                            searchedTickersListItem,
                                                                            r'''$.last''',
                                                                          ).toString()}',
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
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              () {
                                                                                if ((String var1) {
                                                                                  return var1 == "up";
                                                                                }(getJsonField(
                                                                                  searchedTickersListItem,
                                                                                  r'''$.direction''',
                                                                                ).toString())) {
                                                                                  return FlutterFlowTheme.of(context).exchangeGreen;
                                                                                } else if ((String var1) {
                                                                                  return var1 == "down";
                                                                                }(getJsonField(
                                                                                  searchedTickersListItem,
                                                                                  r'''$.direction''',
                                                                                ).toString())) {
                                                                                  return FlutterFlowTheme.of(context).errorRed;
                                                                                } else {
                                                                                  return FlutterFlowTheme.of(context).alternate;
                                                                                }
                                                                              }(),
                                                                              FlutterFlowTheme.of(context).exchangeGreen,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '${getJsonField(
                                                                                searchedTickersListItem,
                                                                                r'''$.change''',
                                                                              ).toString()} %',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
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
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => setState(() {}),
                child: const NavBarWidget(
                  activePage: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
