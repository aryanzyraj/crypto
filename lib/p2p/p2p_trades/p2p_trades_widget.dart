import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/p2p/p2p_main_drpdown/p2p_main_drpdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'p2p_trades_model.dart';
export 'p2p_trades_model.dart';

class P2pTradesWidget extends StatefulWidget {
  const P2pTradesWidget({super.key});

  @override
  State<P2pTradesWidget> createState() => _P2pTradesWidgetState();
}

class _P2pTradesWidgetState extends State<P2pTradesWidget>
    with TickerProviderStateMixin {
  late P2pTradesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P2pTradesModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(50.0, 15.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: const Offset(50.0, 15.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, -29.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(38.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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

    return FutureBuilder<ApiCallResponse>(
      future: PeerToPeerGroup.gETtradesCall.call(
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const LoadingWidget(
              dimension: 150,
            ),
          );
        }
        final p2pTradesGETtradesResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).tertiary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).darkBackground,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ).animateOnPageLoad(
                  animationsMap['iconButtonOnPageLoadAnimation']!),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 25.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'gpq4oh50' /* P2P Trades */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Lexend',
                                  color: FlutterFlowTheme.of(context)
                                      .darkBackground,
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: AuthinticationGroup.getProfileCall.call(
                  accesstoken: FFAppState().accesstoken,
                  csrftoken: FFAppState().csrftoken,
                  sessionid: FFAppState().sessionId,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: SpinKitDualRing(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 40.0,
                        ),
                      ),
                    );
                  }
                  final stackGetProfileResponse = snapshot.data!;

                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '31dgxfs4' /* Trades */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ).animateOnPageLoad(animationsMap[
                                          'rowOnPageLoadAnimation']!),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final trades =
                                                PeerToPeerGroup.gETtradesCall
                                                        .dataResult(
                                                          p2pTradesGETtradesResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: trades.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 10.0),
                                              itemBuilder:
                                                  (context, tradesIndex) {
                                                final tradesItem =
                                                    trades[tradesIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'p2pChat',
                                                      queryParameters: {
                                                        'id': serializeParam(
                                                          getJsonField(
                                                            tradesItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              '${getJsonField(
                                                                                tradesItem,
                                                                                r'''$.seller.firstName''',
                                                                              ).toString()} ${getJsonField(
                                                                                tradesItem,
                                                                                r'''$.seller.lastName''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                tradesItem,
                                                                                r'''$.uuid''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).grayLight,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'xn5tmssq' /* Type */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFAppState().userID ==
                                                                              getJsonField(
                                                                                tradesItem,
                                                                                r'''$.sellerId''',
                                                                              ).toString()
                                                                          ? 'Sell'
                                                                          : 'Buy',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color: AuthinticationGroup.getProfileCall.id(
                                                                                      stackGetProfileResponse.jsonBody,
                                                                                    ) ==
                                                                                    getJsonField(
                                                                                      tradesItem,
                                                                                      r'''$.sellerId''',
                                                                                    ).toString()
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).exchangeGreen,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
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
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'f2f1d589' /* Amount */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '${getJsonField(
                                                                        tradesItem,
                                                                        r'''$.amount''',
                                                                      ).toString()} ${getJsonField(
                                                                        tradesItem,
                                                                        r'''$.offer.currency''',
                                                                      ).toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
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
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'u9iabxkt' /* Status */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          () {
                                                                            if ((String
                                                                                var1) {
                                                                              return var1 == 'COMPLETED';
                                                                            }(getJsonField(
                                                                              tradesItem,
                                                                              r'''$.status''',
                                                                            ).toString())) {
                                                                              return FlutterFlowTheme.of(context).customColor1;
                                                                            } else if ((String var1) {
                                                                              return var1 == 'PENDING';
                                                                            }(getJsonField(
                                                                              tradesItem,
                                                                              r'''$.status''',
                                                                            ).toString())) {
                                                                              return FlutterFlowTheme.of(context).customColor3;
                                                                            } else if ((String var1) {
                                                                              return var1 == 'CANCELLED';
                                                                            }(getJsonField(
                                                                              tradesItem,
                                                                              r'''$.status''',
                                                                            ).toString())) {
                                                                              return FlutterFlowTheme.of(context).customColor8;
                                                                            } else if ((String var1) {
                                                                              return var1 == 'PAID';
                                                                            }(getJsonField(
                                                                              tradesItem,
                                                                              r'''$.status''',
                                                                            ).toString())) {
                                                                              return FlutterFlowTheme.of(context).customColor5;
                                                                            } else if ((String var1) {
                                                                              return var1 == 'DISPUTE_OPEN';
                                                                            }(getJsonField(
                                                                              tradesItem,
                                                                              r'''$.status''',
                                                                            ).toString())) {
                                                                              return FlutterFlowTheme.of(context).customColor9;
                                                                            } else {
                                                                              return FlutterFlowTheme.of(context).grayLight;
                                                                            }
                                                                          }(),
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            6.0,
                                                                            8.0,
                                                                            6.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            tradesItem,
                                                                            r'''$.status''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation']!);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, -1.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (_model.dropDownState == true)
                                      wrapWithModel(
                                        model: _model.p2pMainDrpdownModel,
                                        updateCallback: () => setState(() {}),
                                        child: const P2pMainDrpdownWidget(),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
