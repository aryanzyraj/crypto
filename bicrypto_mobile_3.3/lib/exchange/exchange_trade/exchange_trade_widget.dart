import '/backend/api_requests/api_calls.dart';
import '/components/trade_order_book_ask/trade_order_book_ask_widget.dart';
import '/components/trade_orderbook_bids/trade_orderbook_bids_widget.dart';
import '/exchange/a_i_trade/a_i_trade_widget.dart';
import '/exchange/exchanage_order_component/exchanage_order_component_widget.dart';
import '/exchange/trade_shimmer/trade_shimmer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'exchange_trade_model.dart';
export 'exchange_trade_model.dart';

class ExchangeTradeWidget extends StatefulWidget {
  const ExchangeTradeWidget({
    super.key,
    String? pair,
    bool? comeFromMarket,
  })  : pair = pair ?? '',
        comeFromMarket = comeFromMarket ?? false;

  final String pair;
  final bool comeFromMarket;

  @override
  State<ExchangeTradeWidget> createState() => _ExchangeTradeWidgetState();
}

class _ExchangeTradeWidgetState extends State<ExchangeTradeWidget>
    with TickerProviderStateMixin {
  late ExchangeTradeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExchangeTradeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          if (FFAppState().isOrderBookOpen) {
            FFAppState().symbol = widget.pair;
            setState(() {});
          } else {
            FFAppState().symbol = widget.pair;
            FFAppState().isOrderBookOpen = true;
            setState(() {});
            await actions.market(
              context,
            );
          }
        }),
        Future(() async {
          _model.pair = widget.pair;
          setState(() {});
          _model.apiPairBalance = await WalletGroup.getPairBalanceCall.call(
            type: 'SPOT',
            currency: (String var1) {
              return var1.split('/')[0];
            }(widget.pair),
            pair: (String var1) {
              return var1.split('/')[1];
            }(widget.pair),
            accesstoken: FFAppState().accesstoken,
            csrftoken: FFAppState().csrftoken,
            sessionid: FFAppState().sessionId,
          );

          if ((_model.apiPairBalance?.succeeded ?? true)) {
            _model.buyBalance = double.parse(getJsonField(
              (_model.apiPairBalance?.jsonBody ?? ''),
              r'''$.PAIR''',
            ).toString().toString());
            _model.sellBalance = double.parse(getJsonField(
              (_model.apiPairBalance?.jsonBody ?? ''),
              r'''$.CURRENCY''',
            ).toString().toString());
            setState(() {});
          }
        }),
      ]);
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.priceTextFieldTextController ??= TextEditingController(
        text: FFAppState().tradeBids.isNotEmpty
            ? getJsonField(
                FFAppState().tradeBids.first,
                r'''$.price''',
              ).toString().toString()
            : '0');
    _model.priceTextFieldFocusNode ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: _model.amount?.toString());
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 4000.0.ms,
            color: FlutterFlowTheme.of(context).exchangeGreen,
            angle: 0.524,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 4000.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });
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
          alignment: const AlignmentDirectional(0.0, -1.0),
          children: [
            Stack(
              alignment: const AlignmentDirectional(0.0, -1.0),
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 77.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (_model.navB == 'Spot') {
                              return FutureBuilder<ApiCallResponse>(
                                future: FFAppState().allMarket(
                                  requestFn: () =>
                                      ExchangeGroup.getAllMarketsCall.call(
                                    accesstoken: FFAppState().accesstoken,
                                    csrftoken: FFAppState().csrftoken,
                                    sessionid: FFAppState().sessionId,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const TradeShimmerWidget();
                                  }
                                  final columnTickerGetAllMarketsResponse =
                                      snapshot.data!;

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 12.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .pairsDDValueController ??=
                                                    FormFieldController<String>(
                                                  _model.pairsDDValue ??=
                                                      widget.pair != ''
                                                          ? widget.pair
                                                          : 'BTC/USDT',
                                                ),
                                                options:
                                                    functions.marketCombinList(
                                                        ExchangeGroup
                                                            .getAllMarketsCall
                                                            .currency(
                                                              columnTickerGetAllMarketsResponse
                                                                  .jsonBody,
                                                            )!
                                                            .toList(),
                                                        ExchangeGroup
                                                            .getAllMarketsCall
                                                            .pair(
                                                              columnTickerGetAllMarketsResponse
                                                                  .jsonBody,
                                                            )!
                                                            .toList()),
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .pairsDDValue = val);
                                                  FFAppState().symbol =
                                                      _model.pairsDDValue!;
                                                  setState(() {});
                                                  _model.pair =
                                                      _model.pairsDDValue!;
                                                  setState(() {});
                                                  _model.apiPairBalanceDD =
                                                      await WalletGroup
                                                          .getPairBalanceCall
                                                          .call(
                                                    type: 'SPOT',
                                                    currency: (String var1) {
                                                      return var1.split('/')[0];
                                                    }(_model.pair),
                                                    pair: (String var1) {
                                                      return var1.split('/')[1];
                                                    }(_model.pair),
                                                    accesstoken: FFAppState()
                                                        .accesstoken,
                                                    csrftoken:
                                                        FFAppState().csrftoken,
                                                    sessionid:
                                                        FFAppState().sessionId,
                                                  );

                                                  if ((_model.apiPairBalanceDD
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.buyBalance =
                                                        double.parse(
                                                            getJsonField(
                                                      (_model.apiPairBalanceDD
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.PAIR''',
                                                    ).toString());
                                                    _model.sellBalance =
                                                        double.parse(
                                                            getJsonField(
                                                      (_model.apiPairBalanceDD
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.CURRENCY''',
                                                    ).toString());
                                                    setState(() {});
                                                  }

                                                  setState(() {});
                                                },
                                                width: 200.0,
                                                height: 56.0,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                searchHintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'y0rq51ia' /* Search for a Symbol... */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isOverButton: true,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                HapticFeedback.lightImpact();

                                                context.pushNamed(
                                                  'exchangeChart',
                                                  queryParameters: {
                                                    'symbol': serializeParam(
                                                      _model.pairsDDValue,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Icon(
                                                Icons.candlestick_chart_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(6.0, 0.0, 6.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                0.0, 0.0, 4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
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
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'hlzf311c' /* Price */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'tjz2p1rr' /* ( */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: (String
                                                                            var1) {
                                                                          return var1
                                                                              .split('/')[1];
                                                                        }(_model
                                                                            .pair),
                                                                        style:
                                                                            const TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'zuwuafhw' /* ) */,
                                                                        ),
                                                                        style:
                                                                            const TextStyle(),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'y1k55qyt' /* Amount */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'v9nah5ka' /* ( */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Open Sans',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: (String
                                                                            var1) {
                                                                          return var1
                                                                              .split('/')[0];
                                                                        }(_model
                                                                            .pair),
                                                                        style:
                                                                            const TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'x10gf8xw' /* ) */,
                                                                        ),
                                                                        style:
                                                                            const TextStyle(),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          if (FFAppState()
                                                              .tradeAsks
                                                              .isNotEmpty) {
                                                            return Builder(
                                                              builder:
                                                                  (context) {
                                                                final asks =
                                                                    FFAppState()
                                                                        .tradeAsks
                                                                        .toList()
                                                                        .take(7)
                                                                        .toList();

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List
                                                                      .generate(
                                                                          asks.length,
                                                                          (asksIndex) {
                                                                    final asksItem =
                                                                        asks[
                                                                            asksIndex];
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Opacity(
                                                                                opacity: 0.5,
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                  child: AnimatedContainer(
                                                                                    duration: const Duration(milliseconds: 500),
                                                                                    curve: Curves.linear,
                                                                                    width: getJsonField(
                                                                                      asksItem,
                                                                                      r'''$.width''',
                                                                                    ),
                                                                                    height: 20.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).customColor12,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      asksItem,
                                                                                      r'''$.price''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).errorRed,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      asksItem,
                                                                                      r'''$.amount''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            return wrapWithModel(
                                                              model: _model
                                                                  .tradeOrderBookAskModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  const TradeOrderBookAskWidget(),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0.0,
                                                                12.0,
                                                                0.0,
                                                                12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (FFAppState()
                                                                    .tradeBids
                                                                    .isNotEmpty) {
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .tradeBids
                                                                              .first,
                                                                          r'''$.price''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: 'Lexend',
                                                                              color: valueOrDefault<Color>(
                                                                                () {
                                                                                  if (functions.exchangeSoloUpDown(
                                                                                          getJsonField(
                                                                                            FFAppState().tradeAsks.last,
                                                                                            r'''$.price''',
                                                                                          ),
                                                                                          getJsonField(
                                                                                            FFAppState().tradeBids.first,
                                                                                            r'''$.price''',
                                                                                          )) ==
                                                                                      'up') {
                                                                                    return FlutterFlowTheme.of(context).exchangeGreen;
                                                                                  } else if (functions.exchangeSoloUpDown(
                                                                                          getJsonField(
                                                                                            FFAppState().tradeAsks.last,
                                                                                            r'''$.price''',
                                                                                          ),
                                                                                          getJsonField(
                                                                                            FFAppState().tradeBids.first,
                                                                                            r'''$.price''',
                                                                                          )) ==
                                                                                      'down') {
                                                                                    return FlutterFlowTheme.of(context).errorRed;
                                                                                  } else {
                                                                                    return FlutterFlowTheme.of(context).primaryText;
                                                                                  }
                                                                                }(),
                                                                                FlutterFlowTheme.of(context).exchangeGreen,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'u41kgigm' /* ≈$ */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: getJsonField(
                                                                                FFAppState().tradeBids.first,
                                                                                r'''$.price''',
                                                                              ) is int
                                                                                  ? getJsonField(
                                                                                      FFAppState().tradeBids.first,
                                                                                      r'''$.price''',
                                                                                    ).toString()
                                                                                  : (getJsonField(
                                                                                      FFAppState().tradeBids.first,
                                                                                      r'''$.price''',
                                                                                    ).round())
                                                                                      .toString(),
                                                                              style: const TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  return Container(
                                                                    width:
                                                                        140.0,
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'mibg7xnl' /* 00.00 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
                                                                                fontFamily: 'Lexend',
                                                                                color: FlutterFlowTheme.of(context).exchangeGreen,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ).animateOnPageLoad(
                                                                            animationsMap['textOnPageLoadAnimation1']!),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '474zsqkr' /* 00.00 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ).animateOnPageLoad(
                                                                            animationsMap['textOnPageLoadAnimation2']!),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          if (FFAppState()
                                                              .tradeBids
                                                              .isNotEmpty) {
                                                            return Builder(
                                                              builder:
                                                                  (context) {
                                                                final bids =
                                                                    FFAppState()
                                                                        .tradeBids
                                                                        .toList()
                                                                        .take(7)
                                                                        .toList();

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List
                                                                      .generate(
                                                                          bids.length,
                                                                          (bidsIndex) {
                                                                    final bidsItem =
                                                                        bids[
                                                                            bidsIndex];
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Opacity(
                                                                                opacity: 0.5,
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                  child: AnimatedContainer(
                                                                                    duration: const Duration(milliseconds: 500),
                                                                                    curve: Curves.linear,
                                                                                    width: getJsonField(
                                                                                      bidsItem,
                                                                                      r'''$.width''',
                                                                                    ),
                                                                                    height: 20.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).exchangeGreenLight,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      bidsItem,
                                                                                      r'''$.price''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).exchangeGreen,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      bidsItem,
                                                                                      r'''$.amount''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            return wrapWithModel(
                                                              model: _model
                                                                  .tradeOrderbookBidsModel,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  const TradeOrderbookBidsWidget(),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(const SizedBox(
                                                    height: 10.0)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              HapticFeedback
                                                                  .lightImpact();
                                                              _model.isBuy =
                                                                  true;
                                                              _model.slider =
                                                                  null;
                                                              setState(() {});
                                                              setState(() {
                                                                _model
                                                                    .priceTextFieldTextController
                                                                    ?.text = FFAppState()
                                                                        .tradeBids
                                                                        .isNotEmpty
                                                                    ? getJsonField(
                                                                        FFAppState()
                                                                            .tradeBids
                                                                            .first,
                                                                        r'''$.price''',
                                                                      ).toString()
                                                                    : '0';
                                                              });
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.isBuy
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .exchangeGreen
                                                                      : Colors
                                                                          .transparent,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .exchangeGreen,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '89x0wml1' /* BUY */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            _model.isBuy
                                                                                ? FlutterFlowTheme.of(context).darkBackground
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            FlutterFlowTheme.of(context).darkBackground,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              HapticFeedback
                                                                  .lightImpact();
                                                              _model.isBuy =
                                                                  false;
                                                              _model.slider =
                                                                  null;
                                                              setState(() {});
                                                              setState(() {
                                                                _model
                                                                    .priceTextFieldTextController
                                                                    ?.text = FFAppState()
                                                                        .tradeBids
                                                                        .isNotEmpty
                                                                    ? getJsonField(
                                                                        FFAppState()
                                                                            .tradeBids
                                                                            .first,
                                                                        r'''$.price''',
                                                                      ).toString()
                                                                    : '0';
                                                              });
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: _model
                                                                        .isBuy
                                                                    ? const Color(
                                                                        0x00080000)
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .errorRed,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          6.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'kuwe8wum' /* SELL */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color: _model.isBuy
                                                                              ? FlutterFlowTheme.of(context).secondaryText
                                                                              : FlutterFlowTheme.of(context).darkBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  FlutterFlowDropDown<String>(
                                                    controller: _model
                                                            .limitMarketDropDownValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.limitMarketDropDownValue ??=
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'we9ny35s' /* Limit */,
                                                      ),
                                                    ),
                                                    options: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jufnobt1' /* Limit */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xerynn61' /* Market */,
                                                      )
                                                    ],
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .limitMarketDropDownValue =
                                                            val),
                                                    width: double.infinity,
                                                    height: 45.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '0a84llrz' /* Limit */,
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 1.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                            4.0, 4.0),
                                                    hidesUnderline: true,
                                                    disabled: !(FFAppState()
                                                        .tradeBids
                                                        .isNotEmpty),
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ),
                                                          child: Builder(
                                                            builder: (context) {
                                                              if (_model
                                                                      .limitMarketDropDownValue ==
                                                                  'Limit') {
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              '08pzifsi' /* Price( */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                (String var1) {
                                                                              return var1.split('/')[1];
                                                                            }(_model.pair),
                                                                            style:
                                                                                const TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'il1yci2j' /* ) */,
                                                                            ),
                                                                            style:
                                                                                const TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          5.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                20.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.minus,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 18.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              setState(() {
                                                                                _model.priceTextFieldTextController?.text = functions.decrementOne(double.tryParse(_model.priceTextFieldTextController.text)).toString();
                                                                                _model.priceTextFieldTextController?.selection = TextSelection.collapsed(offset: _model.priceTextFieldTextController!.text.length);
                                                                              });
                                                                            },
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: SizedBox(
                                                                                width: 100.0,
                                                                                child: TextFormField(
                                                                                  controller: _model.priceTextFieldTextController,
                                                                                  focusNode: _model.priceTextFieldFocusNode,
                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                    '_model.priceTextFieldTextController',
                                                                                    const Duration(milliseconds: 100),
                                                                                    () => setState(() {}),
                                                                                  ),
                                                                                  autofocus: false,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    enabledBorder: InputBorder.none,
                                                                                    focusedBorder: InputBorder.none,
                                                                                    errorBorder: InputBorder.none,
                                                                                    focusedErrorBorder: InputBorder.none,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  textAlign: TextAlign.center,
                                                                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                                                  validator: _model.priceTextFieldTextControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                20.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.plus,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 18.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              setState(() {
                                                                                _model.priceTextFieldTextController?.text = functions.incrementOne(double.tryParse(_model.priceTextFieldTextController.text)).toString();
                                                                                _model.priceTextFieldTextController?.selection = TextSelection.collapsed(offset: _model.priceTextFieldTextController!.text.length);
                                                                              });
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              } else {
                                                                return Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        20.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'njaqdtxk' /* Best Market Price */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend',
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        _model.textController2,
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textController2',
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () => setState(() {}),
                                                    ),
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: false,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      alignLabelWithHint: true,
                                                      hintText: _model.amount !=
                                                              null
                                                          ? _model.amount
                                                              ?.toString()
                                                          : 'Amount(${(String var1) {
                                                              return var1.split(
                                                                  '/')[0];
                                                            }(_model.pair)})',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor8,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor8,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Colors.transparent,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        const TextInputType
                                                            .numberWithOptions(
                                                            decimal: true),
                                                    validator: _model
                                                        .textController2Validator
                                                        .asValidator(context),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                            0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Stack(
                                                            children: [
                                                              if (_model
                                                                      .buyBalance
                                                                      .toString() !=
                                                                  '')
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (_model
                                                                        .isBuy) {
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                3.0,
                                                                                0.0,
                                                                                10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    _model.slider = 25;
                                                                                    setState(() {});
                                                                                    if (_model.limitMarketDropDownValue == 'Limit') {
                                                                                      _model.amount = (num.parse(((_model.buyBalance!) *
                                                                                              (25.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    } else {
                                                                                      _model.amount = (num.parse(((_model.buyBalance!) *
                                                                                              (25.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeAsks.last,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        _model.slider == 25 ? FlutterFlowTheme.of(context).customColor2 : Colors.transparent,
                                                                                        FlutterFlowTheme.of(context).exchangeGreenLight,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      border: Border.all(
                                                                                        color: valueOrDefault<Color>(
                                                                                          _model.slider == 25 ? Colors.transparent : FlutterFlowTheme.of(context).alternate,
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'czs7ppvh' /* 25% */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Work Sans',
                                                                                              color: valueOrDefault<Color>(
                                                                                                _model.slider == 25 ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryText,
                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    _model.slider = 50;
                                                                                    setState(() {});
                                                                                    if (_model.limitMarketDropDownValue == 'Limit') {
                                                                                      _model.amount = (num.parse(((_model.buyBalance!) *
                                                                                              (50.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    } else {
                                                                                      _model.amount = (num.parse(((_model.buyBalance!) *
                                                                                              (50.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeAsks.last,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: _model.slider == 50 ? FlutterFlowTheme.of(context).customColor1 : Colors.transparent,
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      border: Border.all(
                                                                                        color: _model.slider == 50 ? Colors.transparent : FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '3dra9k44' /* 50% */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Work Sans',
                                                                                              color: _model.slider == 50 ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    _model.slider = 75;
                                                                                    setState(() {});
                                                                                    if (_model.limitMarketDropDownValue == 'Limit') {
                                                                                      _model.amount = (num.parse(((_model.buyBalance!) *
                                                                                              (75.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    } else {
                                                                                      _model.amount = (num.parse(((_model.buyBalance!) *
                                                                                              (75.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeAsks.last,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: _model.slider == 75 ? FlutterFlowTheme.of(context).customColor1 : Colors.transparent,
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      border: Border.all(
                                                                                        color: _model.slider == 75 ? Colors.transparent : FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'q99a1wc3' /* 75% */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Work Sans',
                                                                                              color: _model.slider == 75 ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    _model.slider = 100;
                                                                                    setState(() {});
                                                                                    if (_model.limitMarketDropDownValue == 'Limit') {
                                                                                      _model.amount = (num.parse(((_model.buyBalance!) *
                                                                                              (100.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    } else {
                                                                                      _model.amount = (num.parse(((_model.buyBalance!) *
                                                                                              (100.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeAsks.last,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: _model.slider == 100 ? FlutterFlowTheme.of(context).customColor1 : Colors.transparent,
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      border: Border.all(
                                                                                        color: _model.slider == 100 ? Colors.transparent : FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ruvpmrem' /* 100% */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Work Sans',
                                                                                              color: _model.slider == 100 ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'semer74x' /* Avail */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: formatNumber(
                                                                                                  _model.buyBalance,
                                                                                                  formatType: FormatType.decimal,
                                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Nunito',
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  '0c0o9e8h' /*   */,
                                                                                                ),
                                                                                                style: const TextStyle(),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: (String var1) {
                                                                                                  return var1.split('/')[1];
                                                                                                }(_model.pair),
                                                                                                style: GoogleFonts.getFont(
                                                                                                  'Nunito',
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            HapticFeedback.lightImpact();

                                                                                            context.goNamed('Wallet_All');
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.add_circle_outline,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 16.0,
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(const SizedBox(width: 5.0)),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'zet6xlau' /* Taker Fees */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      functions
                                                                                          .exchangeTakerMakerFee(
                                                                                              _model.pair,
                                                                                              ExchangeGroup.getAllMarketsCall
                                                                                                  .dataList(
                                                                                                    columnTickerGetAllMarketsResponse.jsonBody,
                                                                                                  )!
                                                                                                  .toList(),
                                                                                              true)
                                                                                          .toString(),
                                                                                      '0.005',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '2kqrcqpy' /* cost */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                  ),
                                                                                  RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: formatNumber(
                                                                                            functions.calculateTradeCost(
                                                                                                true,
                                                                                                _model.limitMarketDropDownValue == 'Limit'
                                                                                                    ? double.tryParse(_model.priceTextFieldTextController.text)
                                                                                                    : getJsonField(
                                                                                                        FFAppState().tradeAsks.last,
                                                                                                        r'''$.price''',
                                                                                                      ),
                                                                                                double.tryParse(_model.textController2.text),
                                                                                                valueOrDefault<double>(
                                                                                                  functions.exchangeTakerMakerFee(
                                                                                                      _model.pair,
                                                                                                      ExchangeGroup.getAllMarketsCall
                                                                                                          .dataList(
                                                                                                            columnTickerGetAllMarketsResponse.jsonBody,
                                                                                                          )!
                                                                                                          .toList(),
                                                                                                      true),
                                                                                                  0.005,
                                                                                                )),
                                                                                            formatType: FormatType.decimal,
                                                                                            decimalType: DecimalType.periodDecimal,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w300,
                                                                                              ),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'edfh991f' /*   */,
                                                                                          ),
                                                                                          style: const TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: (String var1) {
                                                                                            return var1.split('/')[1];
                                                                                          }(_model.pair),
                                                                                          style: GoogleFonts.getFont(
                                                                                            'Nunito',
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      var shouldSetState = false;
                                                                                      if ((functions.siteSetting(FFAppState().Setting.toList(), 'tradeRestrictions') == 'true') && (FFAppState().kycStatus != 'APPROVED')) {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                              child: AlertDialog(
                                                                                                title: const Text('Trade'),
                                                                                                content: const Text('To access Trade services, it is mandatory to complete the (KYC) verification process beforehand.'),
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
                                                                                        if (shouldSetState) setState(() {});
                                                                                        return;
                                                                                      }
                                                                                      if (_model.limitMarketDropDownValue == 'Limit') {
                                                                                        _model.apiLimitPostOrder = await ExchangeGroup.pOSTordersCall.call(
                                                                                          type: 'LIMIT',
                                                                                          side: 'BUY',
                                                                                          amount: double.tryParse(_model.textController2.text),
                                                                                          price: double.tryParse(_model.priceTextFieldTextController.text),
                                                                                          accesstoken: FFAppState().accesstoken,
                                                                                          csrftoken: FFAppState().csrftoken,
                                                                                          sessionid: FFAppState().sessionId,
                                                                                          currency: (String var1) {
                                                                                            return var1.split('/')[0];
                                                                                          }(_model.pair),
                                                                                          pair: (String var1) {
                                                                                            return var1.split('/')[1];
                                                                                          }(_model.pair),
                                                                                        );

                                                                                        shouldSetState = true;
                                                                                        if ((_model.apiLimitPostOrder?.succeeded ?? true)) {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiLimitPostOrder?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiLimitPostOrder?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).errorRed,
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      } else {
                                                                                        _model.apiMarketPostOrder = await ExchangeGroup.pOSTordersCall.call(
                                                                                          type: 'MARKET',
                                                                                          side: 'BUY',
                                                                                          amount: double.tryParse(_model.textController2.text),
                                                                                          price: getJsonField(
                                                                                            FFAppState().tradeAsks.last,
                                                                                            r'''$.price''',
                                                                                          ),
                                                                                          accesstoken: FFAppState().accesstoken,
                                                                                          csrftoken: FFAppState().csrftoken,
                                                                                          sessionid: FFAppState().sessionId,
                                                                                          currency: (String var1) {
                                                                                            return var1.split('/')[0];
                                                                                          }(_model.pair),
                                                                                          pair: (String var1) {
                                                                                            return var1.split('/')[1];
                                                                                          }(_model.pair),
                                                                                        );

                                                                                        shouldSetState = true;
                                                                                        if ((_model.apiMarketPostOrder?.succeeded ?? true)) {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiMarketPostOrder?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiMarketPostOrder?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).errorRed,
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      if (shouldSetState) setState(() {});
                                                                                    },
                                                                                    text: 'Buy (${(String var1) {
                                                                                      return var1.split('/')[0];
                                                                                    }(_model.pair)})',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).exchangeGreen,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Lexend',
                                                                                            color: FlutterFlowTheme.of(context).darkBackground,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderSide: const BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(const SizedBox(height: 15.0)),
                                                                      );
                                                                    } else {
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                3.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    _model.amount = (num.parse((1.0 *
                                                                                            (25.0 / 100) /
                                                                                            getJsonField(
                                                                                              FFAppState().tradeBids.first,
                                                                                              r'''$.price''',
                                                                                            ))
                                                                                        .toStringAsFixed(2))) as double;
                                                                                    _model.slider = 25;
                                                                                    setState(() {});
                                                                                    if (_model.limitMarketDropDownValue == 'Limit') {
                                                                                      _model.amount = (num.parse(((_model.sellBalance!) *
                                                                                              (25.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    } else {
                                                                                      _model.amount = (num.parse(((_model.sellBalance!) *
                                                                                              (25.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        _model.slider == 25 ? FlutterFlowTheme.of(context).customColor12 : Colors.transparent,
                                                                                        FlutterFlowTheme.of(context).customColor12,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      border: Border.all(
                                                                                        color: _model.slider == 25 ? Colors.transparent : FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ayil2h0q' /* 25% */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Work Sans',
                                                                                              color: valueOrDefault<Color>(
                                                                                                _model.slider == 25 ? FlutterFlowTheme.of(context).errorRed : FlutterFlowTheme.of(context).secondaryText,
                                                                                                FlutterFlowTheme.of(context).errorRed,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    _model.amount = (num.parse((1.0 *
                                                                                            (25.0 / 100) /
                                                                                            getJsonField(
                                                                                              FFAppState().tradeBids.first,
                                                                                              r'''$.price''',
                                                                                            ))
                                                                                        .toStringAsFixed(2))) as double;
                                                                                    _model.slider = 50;
                                                                                    setState(() {});
                                                                                    if (_model.limitMarketDropDownValue == 'Limit') {
                                                                                      _model.amount = (num.parse(((_model.sellBalance!) *
                                                                                              (50.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    } else {
                                                                                      _model.amount = (num.parse(((_model.sellBalance!) *
                                                                                              (50.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        _model.slider == 50 ? FlutterFlowTheme.of(context).customColor12 : Colors.transparent,
                                                                                        FlutterFlowTheme.of(context).customColor12,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      border: Border.all(
                                                                                        color: valueOrDefault<Color>(
                                                                                          _model.slider == 50 ? Colors.transparent : FlutterFlowTheme.of(context).alternate,
                                                                                          FlutterFlowTheme.of(context).errorRed,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'z9j9rtmm' /* 50% */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Work Sans',
                                                                                              color: valueOrDefault<Color>(
                                                                                                _model.slider == 50 ? FlutterFlowTheme.of(context).errorRed : FlutterFlowTheme.of(context).secondaryText,
                                                                                                FlutterFlowTheme.of(context).errorRed,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    _model.amount = (num.parse((1.0 *
                                                                                            (25.0 / 100) /
                                                                                            getJsonField(
                                                                                              FFAppState().tradeBids.first,
                                                                                              r'''$.price''',
                                                                                            ))
                                                                                        .toStringAsFixed(2))) as double;
                                                                                    _model.slider = 75;
                                                                                    setState(() {});
                                                                                    if (_model.limitMarketDropDownValue == 'Limit') {
                                                                                      _model.amount = (num.parse(((_model.sellBalance!) *
                                                                                              (75.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    } else {
                                                                                      _model.amount = (num.parse(((_model.sellBalance!) *
                                                                                              (75.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        _model.slider == 75 ? FlutterFlowTheme.of(context).customColor12 : Colors.transparent,
                                                                                        FlutterFlowTheme.of(context).customColor12,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      border: Border.all(
                                                                                        color: valueOrDefault<Color>(
                                                                                          _model.slider == 75 ? Colors.transparent : FlutterFlowTheme.of(context).alternate,
                                                                                          FlutterFlowTheme.of(context).errorRed,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '7f4r39gs' /* 75% */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Work Sans',
                                                                                              color: valueOrDefault<Color>(
                                                                                                _model.slider == 75 ? FlutterFlowTheme.of(context).errorRed : FlutterFlowTheme.of(context).secondaryText,
                                                                                                FlutterFlowTheme.of(context).errorRed,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    HapticFeedback.lightImpact();
                                                                                    _model.amount = (num.parse((1.0 *
                                                                                            (25.0 / 100) /
                                                                                            getJsonField(
                                                                                              FFAppState().tradeBids.first,
                                                                                              r'''$.price''',
                                                                                            ))
                                                                                        .toStringAsFixed(2))) as double;
                                                                                    _model.slider = 100;
                                                                                    setState(() {});
                                                                                    if (_model.limitMarketDropDownValue == 'Limit') {
                                                                                      _model.amount = (num.parse(((_model.sellBalance!) *
                                                                                              (100.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    } else {
                                                                                      _model.amount = (num.parse(((_model.sellBalance!) *
                                                                                              (100.0 / 100) /
                                                                                              getJsonField(
                                                                                                FFAppState().tradeBids.first,
                                                                                                r'''$.price''',
                                                                                              ))
                                                                                          .toStringAsFixed(2))) as double;
                                                                                      setState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        _model.slider == 100 ? FlutterFlowTheme.of(context).customColor12 : Colors.transparent,
                                                                                        FlutterFlowTheme.of(context).customColor12,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      border: Border.all(
                                                                                        color: valueOrDefault<Color>(
                                                                                          _model.slider == 100 ? Colors.transparent : FlutterFlowTheme.of(context).alternate,
                                                                                          FlutterFlowTheme.of(context).errorRed,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '4occ05jj' /* 100% */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Work Sans',
                                                                                              color: valueOrDefault<Color>(
                                                                                                _model.slider == 100 ? FlutterFlowTheme.of(context).errorRed : FlutterFlowTheme.of(context).secondaryText,
                                                                                                FlutterFlowTheme.of(context).errorRed,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '26zgfmv5' /* Avble */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: formatNumber(
                                                                                                  _model.sellBalance,
                                                                                                  formatType: FormatType.decimal,
                                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      fontFamily: 'Nunito',
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'bx3dobua' /*   */,
                                                                                                ),
                                                                                                style: const TextStyle(),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: (String var1) {
                                                                                                  return var1.split('/')[0];
                                                                                                }(_model.pair),
                                                                                                style: const TextStyle(),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.goNamed('Wallet_All');
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.add_circle_outline,
                                                                                            color: FlutterFlowTheme.of(context).errorRed,
                                                                                            size: 16.0,
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(const SizedBox(width: 5.0)),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '838w4iof' /* Maker Fees */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      functions
                                                                                          .exchangeTakerMakerFee(
                                                                                              _model.pair,
                                                                                              ExchangeGroup.getAllMarketsCall
                                                                                                  .dataList(
                                                                                                    columnTickerGetAllMarketsResponse.jsonBody,
                                                                                                  )!
                                                                                                  .toList(),
                                                                                              false)
                                                                                          .toString(),
                                                                                      '0.005',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Nunito',
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'verwvwp7' /* cost */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                  ),
                                                                                  RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: formatNumber(
                                                                                            functions.calculateTradeCost(
                                                                                                false,
                                                                                                _model.limitMarketDropDownValue == 'Limit'
                                                                                                    ? double.tryParse(_model.priceTextFieldTextController.text)
                                                                                                    : getJsonField(
                                                                                                        FFAppState().tradeBids.first,
                                                                                                        r'''$.price''',
                                                                                                      ),
                                                                                                double.tryParse(_model.textController2.text),
                                                                                                valueOrDefault<double>(
                                                                                                  functions.exchangeTakerMakerFee(
                                                                                                      _model.pair,
                                                                                                      ExchangeGroup.getAllMarketsCall
                                                                                                          .dataList(
                                                                                                            columnTickerGetAllMarketsResponse.jsonBody,
                                                                                                          )!
                                                                                                          .toList(),
                                                                                                      false),
                                                                                                  0.005,
                                                                                                )),
                                                                                            formatType: FormatType.decimal,
                                                                                            decimalType: DecimalType.periodDecimal,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Nunito',
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w300,
                                                                                              ),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            '5g9trwnw' /*   */,
                                                                                          ),
                                                                                          style: const TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: (String var1) {
                                                                                            return var1.split('/')[0];
                                                                                          }(_model.pair),
                                                                                          style: const TextStyle(),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                3.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      var shouldSetState = false;
                                                                                      if ((functions.siteSetting(FFAppState().Setting.toList(), 'tradeRestrictions') == 'true') && (FFAppState().kycStatus != 'APPROVED')) {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                              child: AlertDialog(
                                                                                                title: const Text('Trade'),
                                                                                                content: const Text('To access Trade services, it is mandatory to complete the (KYC) verification process beforehand.'),
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
                                                                                        if (shouldSetState) setState(() {});
                                                                                        return;
                                                                                      }
                                                                                      if (_model.limitMarketDropDownValue == 'Limit') {
                                                                                        _model.apiSellLimit = await ExchangeGroup.pOSTordersCall.call(
                                                                                          type: 'LIMIT',
                                                                                          side: 'SELL',
                                                                                          amount: double.tryParse(_model.textController2.text),
                                                                                          price: double.tryParse(_model.priceTextFieldTextController.text),
                                                                                          accesstoken: FFAppState().accesstoken,
                                                                                          csrftoken: FFAppState().csrftoken,
                                                                                          sessionid: FFAppState().sessionId,
                                                                                          currency: (String var1) {
                                                                                            return var1.split('/')[0];
                                                                                          }(_model.pair),
                                                                                          pair: (String var1) {
                                                                                            return var1.split('/')[1];
                                                                                          }(_model.pair),
                                                                                        );

                                                                                        shouldSetState = true;
                                                                                        if ((_model.apiSellLimit?.succeeded ?? true)) {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiSellLimit?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiSellLimit?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).errorRed,
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      } else {
                                                                                        _model.apiSellMarket = await ExchangeGroup.pOSTordersCall.call(
                                                                                          type: 'MARKET',
                                                                                          side: 'SELL',
                                                                                          amount: double.tryParse(_model.textController2.text),
                                                                                          price: getJsonField(
                                                                                            FFAppState().tradeBids.first,
                                                                                            r'''$.price''',
                                                                                          ),
                                                                                          accesstoken: FFAppState().accesstoken,
                                                                                          csrftoken: FFAppState().csrftoken,
                                                                                          sessionid: FFAppState().sessionId,
                                                                                          currency: (String var1) {
                                                                                            return var1.split('/')[0];
                                                                                          }(_model.pair),
                                                                                          pair: (String var1) {
                                                                                            return var1.split('/')[1];
                                                                                          }(_model.pair),
                                                                                        );

                                                                                        shouldSetState = true;
                                                                                        if ((_model.apiSellMarket?.succeeded ?? true)) {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiSellMarket?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiSellMarket?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).errorRed,
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      if (shouldSetState) setState(() {});
                                                                                    },
                                                                                    text: 'Sell (${(String var1) {
                                                                                      return var1.split('/')[0];
                                                                                    }(_model.pair)})',
                                                                                    options: FFButtonOptions(
                                                                                      height: 40.0,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).errorRed,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Lexend',
                                                                                            color: FlutterFlowTheme.of(context).darkBackground,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderSide: const BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(height: 15.0)),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(
                                                    height: 8.0)),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              return Container(
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                decoration: const BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.aITradeModel,
                                  updateCallback: () => setState(() {}),
                                  child: AITradeWidget(
                                    balance: _model.sellBalance!,
                                    currency: (String var1) {
                                      return var1.split('/')[0];
                                    }(FFAppState().symbol),
                                    pair: (String var1) {
                                      return var1.split('/')[1];
                                    }(FFAppState().symbol),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Divider(
                        thickness: 0.2,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      wrapWithModel(
                        model: _model.exchanageOrderComponentModel,
                        updateCallback: () => setState(() {}),
                        child: ExchanageOrderComponentWidget(
                          symbol: _model.pairsDDValue != null &&
                                  _model.pairsDDValue != ''
                              ? _model.pairsDDValue!
                              : FFAppState().symbol,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!(isWeb
                    ? MediaQuery.viewInsetsOf(context).bottom > 0
                    : _isKeyboardVisible))
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => setState(() {}),
                      child: const NavBarWidget(
                        activePage: 3,
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              height: 70.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                    offset: const Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 38.0, 8.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            HapticFeedback.lightImpact();
                            _model.navB = 'Spot';
                            setState(() {});
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ptru7s8l' /* Spot */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: _model.navB == 'Spot'
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        if (functions.extensionsVisibility(
                                FFAppState().extensions.toList(), 'futures') ??
                            true)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              HapticFeedback.lightImpact();
                              _model.navB = 'AI';
                              setState(() {});
                            },
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '4z7bszee' /* AI Investment */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: _model.navB == 'AI'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'wlnm51wn' /* Grid */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: _model.navB == 'Grid'
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ].divide(const SizedBox(width: 18.0)),
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
