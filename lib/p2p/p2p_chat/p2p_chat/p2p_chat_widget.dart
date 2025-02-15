import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/p2p/p2p_chat/p2pchat_component/p2pchat_component_widget.dart';
import '/p2p/p2p_dispute_trade/p2p_dispute_trade_widget.dart';
import '/p2p/p2p_review_trade/p2p_review_trade_widget.dart';
import '/p2p/p2p_submit_transaction_id/p2p_submit_transaction_id_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'p2p_chat_model.dart';
export 'p2p_chat_model.dart';

class P2pChatWidget extends StatefulWidget {
  const P2pChatWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<P2pChatWidget> createState() => _P2pChatWidgetState();
}

class _P2pChatWidgetState extends State<P2pChatWidget> {
  late P2pChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P2pChatModel());
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
      future: PeerToPeerGroup.gETtradeIDCall.call(
        id: widget.id,
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const LoadingWidget(
              dimension: 150,
            ),
          );
        }
        final p2pChatGETtradeIDResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            endDrawer: FutureBuilder<ApiCallResponse>(
              future: _model.profile(
                requestFn: () => AuthinticationGroup.getProfileCall.call(
                  accesstoken: FFAppState().accesstoken,
                  csrftoken: FFAppState().csrftoken,
                  sessionid: FFAppState().sessionId,
                ),
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
                final endDrawerGetProfileResponse = snapshot.data!;

                return Drawer(
                  elevation: 16.0,
                  child: WebViewAware(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'j568vq9w' /* Trade Detail */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (widget.id != null &&
                                                      widget.id != '') {
                                                    return Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayDark,
                                                      elevation: 4.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(80.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(2.0),
                                                        child: Container(
                                                          width: 120.0,
                                                          height: 120.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            '${FFAppConstants.Domain}${PeerToPeerGroup.gETtradeIDCall.userAvatar(
                                                              p2pChatGETtradeIDResponse
                                                                  .jsonBody,
                                                            )}',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayDark,
                                                      elevation: 4.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(80.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(2.0),
                                                        child: Container(
                                                          width: 120.0,
                                                          height: 120.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            '${FFAppConstants.Domain}${PeerToPeerGroup.gETtradeIDCall.sellerAvatar(
                                                              p2pChatGETtradeIDResponse
                                                                  .jsonBody,
                                                            )}',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                              RatingBarIndicator(
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                                direction: Axis.horizontal,
                                                rating: functions.ratingCF(
                                                    PeerToPeerGroup
                                                        .gETtradeIDCall
                                                        .rates(
                                                          p2pChatGETtradeIDResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList()),
                                                unratedColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                itemCount: 5,
                                                itemSize: 40.0,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              if (widget.id != null &&
                                                  widget.id != '') {
                                                return Row(
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
                                                        'ln3qjnct' /* Buyer: */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      '${PeerToPeerGroup.gETtradeIDCall.userFN(
                                                        p2pChatGETtradeIDResponse
                                                            .jsonBody,
                                                      )} ${PeerToPeerGroup.gETtradeIDCall.userLN(
                                                        p2pChatGETtradeIDResponse
                                                            .jsonBody,
                                                      )}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                );
                                              } else {
                                                return Row(
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
                                                        'ica073yl' /* Seller: */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      '${PeerToPeerGroup.gETtradeIDCall.sellerFN(
                                                        p2pChatGETtradeIDResponse
                                                            .jsonBody,
                                                      )} ${PeerToPeerGroup.gETtradeIDCall.sellerLN(
                                                        p2pChatGETtradeIDResponse
                                                            .jsonBody,
                                                      )}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                );
                                              }
                                            },
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'dbt3b758' /* Amount: */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                '${PeerToPeerGroup.gETtradeIDCall.ammount(
                                                      p2pChatGETtradeIDResponse
                                                          .jsonBody,
                                                    )?.toString()} ${PeerToPeerGroup.gETtradeIDCall.currency(
                                                  p2pChatGETtradeIDResponse
                                                      .jsonBody,
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'rl9jylfb' /* Paid at: */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                functions.timeAgo(
                                                    PeerToPeerGroup
                                                        .gETtradeIDCall
                                                        .paidAt(
                                                  p2pChatGETtradeIDResponse
                                                      .jsonBody,
                                                )!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5mwocvzy' /* Status: */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if ((String var1) {
                                                        return var1 ==
                                                            'COMPLETED';
                                                      }(PeerToPeerGroup
                                                          .gETtradeIDCall
                                                          .status(
                                                        p2pChatGETtradeIDResponse
                                                            .jsonBody,
                                                      )!)) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .customColor1;
                                                      } else if ((String var1) {
                                                        return var1 ==
                                                            'PENDING';
                                                      }(PeerToPeerGroup
                                                          .gETtradeIDCall
                                                          .status(
                                                        p2pChatGETtradeIDResponse
                                                            .jsonBody,
                                                      )!)) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .customColor3;
                                                      } else if ((String var1) {
                                                        return var1 ==
                                                            'CANCELLED';
                                                      }(PeerToPeerGroup
                                                          .gETtradeIDCall
                                                          .status(
                                                        p2pChatGETtradeIDResponse
                                                            .jsonBody,
                                                      )!)) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .customColor8;
                                                      } else if ((String var1) {
                                                        return var1 == 'PAID';
                                                      }(PeerToPeerGroup
                                                          .gETtradeIDCall
                                                          .status(
                                                        p2pChatGETtradeIDResponse
                                                            .jsonBody,
                                                      )!)) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .customColor5;
                                                      } else if ((String var1) {
                                                        return var1 ==
                                                            'DISPUTE_OPEN';
                                                      }(PeerToPeerGroup
                                                          .gETtradeIDCall
                                                          .status(
                                                        p2pChatGETtradeIDResponse
                                                            .jsonBody,
                                                      )!)) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .customColor9;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .grayLight;
                                                      }
                                                    }(),
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 6.0, 8.0, 6.0),
                                                  child: Text(
                                                    PeerToPeerGroup
                                                        .gETtradeIDCall
                                                        .status(
                                                      p2pChatGETtradeIDResponse
                                                          .jsonBody,
                                                    )!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                        ].divide(const SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'ska7arki' /* Trade ID */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '#${PeerToPeerGroup.gETtradeIDCall.tradeID(
                                                p2pChatGETtradeIDResponse
                                                    .jsonBody,
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 4.0)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '9vkf9phz' /* Offer ID */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '#${PeerToPeerGroup.gETtradeIDCall.offerID(
                                                  p2pChatGETtradeIDResponse
                                                      .jsonBody,
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(height: 4.0)),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'ljsniw4z' /* Payment Method */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5nizaggk' /* Usd */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 4.0)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 19.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'r867lo18' /* Instructions */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Text(
                                                    PeerToPeerGroup
                                                        .gETtradeIDCall
                                                        .instructions(
                                                      p2pChatGETtradeIDResponse
                                                          .jsonBody,
                                                    )!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                        ].divide(const SizedBox(height: 4.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (PeerToPeerGroup.gETtradeIDCall.sellerID(
                                    p2pChatGETtradeIDResponse.jsonBody,
                                  ) !=
                                  FFAppState().userID) {
                                return Builder(
                                  builder: (context) {
                                    if (PeerToPeerGroup.gETtradeIDCall.status(
                                          p2pChatGETtradeIDResponse.jsonBody,
                                        ) ==
                                        'PENDING') {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        title: const Text(
                                                                            'Cancel Trade?'),
                                                                        content:
                                                                            const Text('This action can\'t be undone!'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                const Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                const Text('Confirm'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          _model.apiCancelTradeResult =
                                                              await PeerToPeerGroup
                                                                  .pOSTCancelTradeCall
                                                                  .call(
                                                            id: widget.id,
                                                            accesstoken:
                                                                FFAppState()
                                                                    .accesstoken,
                                                            csrftoken:
                                                                FFAppState()
                                                                    .csrftoken,
                                                            sessionid:
                                                                FFAppState()
                                                                    .sessionId,
                                                          );

                                                          if ((_model
                                                                  .apiCancelTradeResult
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.isStatusChanged =
                                                                true;
                                                            setState(() {});
                                                            Navigator.pop(
                                                                context);
                                                            _model.isStatusChanged =
                                                                false;
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.apiCancelTradeResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.message''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .errorRed,
                                                              ),
                                                            );
                                                          } else {
                                                            Navigator.pop(
                                                                context);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.apiCancelTradeResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.error.message''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .errorRed,
                                                              ),
                                                            );
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'o84lfe7a' /* Cancel Trade */,
                                                      ),
                                                      icon: const Icon(
                                                        Icons.cancel_outlined,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .errorRed,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 40.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      P2pSubmitTransactionIdWidget(
                                                                    uuid: widget
                                                                        .id!,
                                                                    tidcomponentAction:
                                                                        () async {
                                                                      _model.isTransactionSubmited =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                      _model.isTransactionSubmited =
                                                                          false;
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'cysdw0jr' /* Submit Transaction ID */,
                                                      ),
                                                      icon: const Icon(
                                                        Icons
                                                            .check_circle_outline_outlined,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if ((PeerToPeerGroup.gETtradeIDCall
                                                .status(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'PAID') &&
                                        (PeerToPeerGroup.gETtradeIDCall
                                                    .disputeStatus(
                                                  p2pChatGETtradeIDResponse
                                                      .jsonBody,
                                                ) ==
                                                null ||
                                            PeerToPeerGroup.gETtradeIDCall
                                                    .disputeStatus(
                                                  p2pChatGETtradeIDResponse
                                                      .jsonBody,
                                                ) ==
                                                '')) {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 40.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: const BoxDecoration(),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  P2pDisputeTradeWidget(
                                                                uuid:
                                                                    widget.id!,
                                                                disputecomponentAction:
                                                                    () async {
                                                                  _model.isDispute =
                                                                      !_model
                                                                          .isDispute;
                                                                  setState(
                                                                      () {});
                                                                  _model.isDispute =
                                                                      false;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'gqcv4jeq' /* Dispute Trade */,
                                                  ),
                                                  icon: const Icon(
                                                    Icons.warning_rounded,
                                                    size: 15.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 100.0,
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .warning,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .darkBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if ((PeerToPeerGroup.gETtradeIDCall
                                                .status(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'PAID') &&
                                        (PeerToPeerGroup.gETtradeIDCall
                                                .disputeStatus(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'CANCELLED')) {
                                      return const Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [],
                                      );
                                    } else if ((PeerToPeerGroup.gETtradeIDCall
                                                .status(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'DISPUTE_OPEN') &&
                                        (PeerToPeerGroup.gETtradeIDCall
                                                .disputeStatus(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'PENDING')) {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .report_gmailerrorred_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 40.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'u00yz03x' /* Trade is in dispute, please wa... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 40.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          title:
                                                                              const Text('Cancel Dispute?'),
                                                                          content:
                                                                              const Text('Are you sure you want to cancel the dispute? This action cannot be undone, and you will not be able to open a dispute again.'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: const Text('Cancel'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: const Text('Confirm'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            _model.apiCancelDisputeResult =
                                                                await PeerToPeerGroup
                                                                    .cancelDisputeCall
                                                                    .call(
                                                              id: widget.id,
                                                              accesstoken:
                                                                  FFAppState()
                                                                      .accesstoken,
                                                              csrftoken:
                                                                  FFAppState()
                                                                      .csrftoken,
                                                              sessionid:
                                                                  FFAppState()
                                                                      .sessionId,
                                                            );

                                                            if ((_model
                                                                    .apiCancelDisputeResult
                                                                    ?.succeeded ??
                                                                true)) {
                                                              Navigator.pop(
                                                                  context);
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    getJsonField(
                                                                      (_model.apiCancelDisputeResult
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.message''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                ),
                                                              );
                                                            } else {
                                                              Navigator.pop(
                                                                  context);
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    getJsonField(
                                                                      (_model.apiCancelDisputeResult
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.message''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .errorRed,
                                                                ),
                                                              );
                                                            }
                                                          }

                                                          setState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '83goe5zh' /* Cancel Dispute  */,
                                                        ),
                                                        icon: const Icon(
                                                          Icons.warning_rounded,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 100.0,
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .warning,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .darkBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 12.0)),
                                        ),
                                      );
                                    } else if (PeerToPeerGroup.gETtradeIDCall
                                            .status(
                                          p2pChatGETtradeIDResponse.jsonBody,
                                        ) ==
                                        'COMPLETED') {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      P2pReviewTradeWidget(
                                                                    uuid: PeerToPeerGroup
                                                                        .gETtradeIDCall
                                                                        .offerID(
                                                                      p2pChatGETtradeIDResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    reviewcomponentAction:
                                                                        () async {
                                                                      _model.isStatusChanged =
                                                                          !_model
                                                                              .isStatusChanged;
                                                                      setState(
                                                                          () {});
                                                                      _model.isStatusChanged =
                                                                          false;
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2d3va84f' /* Review Offer */,
                                                      ),
                                                      icon: const Icon(
                                                        Icons.reviews_rounded,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(4.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '6jl2nxfj' /* TRADE COMPLETED */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend',
                                                            fontSize: 22.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (PeerToPeerGroup.gETtradeIDCall
                                            .status(
                                          p2pChatGETtradeIDResponse.jsonBody,
                                        ) ==
                                        'CANCELLED') {
                                      return Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .errorRed,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '3d8o6epc' /* TRADE CANCELLED */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .errorRed,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else if ((PeerToPeerGroup.gETtradeIDCall
                                                .status(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'DISPUTE_OPEN') &&
                                        (PeerToPeerGroup.gETtradeIDCall
                                                .disputeStatus(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'OPEN')) {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 40.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor5,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 6.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .report_gmailerrorred_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 40.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          PeerToPeerGroup
                                                              .gETtradeIDCall
                                                              .disputeResolutin(
                                                            p2pChatGETtradeIDResponse
                                                                .jsonBody,
                                                          )!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else if ((PeerToPeerGroup.gETtradeIDCall
                                                .status(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'PAID') &&
                                        (PeerToPeerGroup.gETtradeIDCall
                                                .disputeStatus(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'RESOLVED')) {
                                      return const Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [],
                                      );
                                    } else {
                                      return const Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [],
                                      );
                                    }
                                  },
                                );
                              } else {
                                return Builder(
                                  builder: (context) {
                                    if (PeerToPeerGroup.gETtradeIDCall.status(
                                          p2pChatGETtradeIDResponse.jsonBody,
                                        ) ==
                                        'PENDING') {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: const BoxDecoration(),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: const Text(
                                                                        'Cancel Trade?'),
                                                                    content: const Text(
                                                                        'This action can\'t be undone!'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: const Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: const Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      _model.apiSELLERCancelTradeResult =
                                                          await PeerToPeerGroup
                                                              .pOSTCancelTradeCall
                                                              .call(
                                                        id: widget.id,
                                                        accesstoken:
                                                            FFAppState()
                                                                .accesstoken,
                                                        csrftoken: FFAppState()
                                                            .csrftoken,
                                                        sessionid: FFAppState()
                                                            .sessionId,
                                                      );

                                                      if ((_model
                                                              .apiSELLERCancelTradeResult
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.isStatusChanged =
                                                            true;
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.apiSELLERCancelTradeResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                          ),
                                                        );
                                                        _model.isStatusChanged =
                                                            false;
                                                      } else {
                                                        Navigator.pop(context);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.apiSELLERCancelTradeResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.error.message''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .errorRed,
                                                          ),
                                                        );
                                                      }
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'pud8y05g' /* Cancel Trade */,
                                                  ),
                                                  icon: const Icon(
                                                    Icons.cancel_outlined,
                                                    size: 15.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 100.0,
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .errorRed,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if ((PeerToPeerGroup.gETtradeIDCall
                                                .status(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'PAID') &&
                                        (PeerToPeerGroup.gETtradeIDCall
                                                .disputeStatus(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'CANCELLED')) {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 40.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: const BoxDecoration(),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: const Text(
                                                                        'Complete Trade'),
                                                                    content: const Text(
                                                                        'Are you sure?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: const Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: const Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      _model.apiReleaseResult =
                                                          await PeerToPeerGroup
                                                              .releaseCall
                                                              .call(
                                                        id: widget.id,
                                                        accesstoken:
                                                            FFAppState()
                                                                .accesstoken,
                                                        csrftoken: FFAppState()
                                                            .csrftoken,
                                                        sessionid: FFAppState()
                                                            .sessionId,
                                                      );

                                                      if ((_model
                                                              .apiReleaseResult
                                                              ?.succeeded ??
                                                          true)) {
                                                        Navigator.pop(context);
                                                        _model.isStatusChanged =
                                                            !_model
                                                                .isStatusChanged;
                                                        setState(() {});
                                                        _model.isStatusChanged =
                                                            false;
                                                        setState(() {});
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.apiReleaseResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                          ),
                                                        );
                                                      } else {
                                                        Navigator.pop(context);
                                                        _model.isStatusChanged =
                                                            !_model
                                                                .isStatusChanged;
                                                        setState(() {});
                                                        _model.isStatusChanged =
                                                            false;
                                                        setState(() {});
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.apiReleaseResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .errorRed,
                                                          ),
                                                        );
                                                      }
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'dwhm05bi' /* Complete Trade */,
                                                  ),
                                                  icon: const Icon(
                                                    Icons
                                                        .check_circle_outline_outlined,
                                                    size: 15.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 100.0,
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor11,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (PeerToPeerGroup.gETtradeIDCall
                                            .status(
                                          p2pChatGETtradeIDResponse.jsonBody,
                                        ) ==
                                        'DISPUTE_OPEN') {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .report_gmailerrorred_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 40.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'sxp323nj' /* Trade is in dispute, please wa... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
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
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 40.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        title: const Text(
                                                                            'Complete Trade'),
                                                                        content:
                                                                            const Text('Are you sure?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                const Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                const Text('Confirm'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          _model.apiReleaseResult2 =
                                                              await PeerToPeerGroup
                                                                  .releaseCall
                                                                  .call(
                                                            id: widget.id,
                                                            accesstoken:
                                                                FFAppState()
                                                                    .accesstoken,
                                                            csrftoken:
                                                                FFAppState()
                                                                    .csrftoken,
                                                            sessionid:
                                                                FFAppState()
                                                                    .sessionId,
                                                          );

                                                          if ((_model
                                                                  .apiReleaseResult2
                                                                  ?.succeeded ??
                                                              true)) {
                                                            Navigator.pop(
                                                                context);
                                                            _model.isStatusChanged =
                                                                !_model
                                                                    .isStatusChanged;
                                                            setState(() {});
                                                            _model.isStatusChanged =
                                                                false;
                                                            setState(() {});
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.apiReleaseResult2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.message''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                              ),
                                                            );
                                                          } else {
                                                            Navigator.pop(
                                                                context);
                                                            _model.isStatusChanged =
                                                                !_model
                                                                    .isStatusChanged;
                                                            setState(() {});
                                                            _model.isStatusChanged =
                                                                false;
                                                            setState(() {});
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.apiReleaseResult2
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.message''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .errorRed,
                                                              ),
                                                            );
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'oa2x60jg' /* Complete Trade */,
                                                      ),
                                                      icon: const Icon(
                                                        Icons
                                                            .check_circle_outline_outlined,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor11,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (PeerToPeerGroup.gETtradeIDCall
                                            .status(
                                          p2pChatGETtradeIDResponse.jsonBody,
                                        ) ==
                                        'COMPLETED') {
                                      return const Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [],
                                      );
                                    } else if ((PeerToPeerGroup.gETtradeIDCall
                                                .status(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'DISPUTE_OPEN') &&
                                        (PeerToPeerGroup.gETtradeIDCall
                                                .disputeStatus(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'OPEN')) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 20.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor5,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .report_gmailerrorred_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 40.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              PeerToPeerGroup
                                                                  .gETtradeIDCall
                                                                  .disputeResolutin(
                                                                p2pChatGETtradeIDResponse
                                                                    .jsonBody,
                                                              )!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
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
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 40.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        title: const Text(
                                                                            'Complete Trade'),
                                                                        content:
                                                                            const Text('Are you sure?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                const Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                const Text('Confirm'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          _model.apiReleaseResult3 =
                                                              await PeerToPeerGroup
                                                                  .releaseCall
                                                                  .call(
                                                            id: widget.id,
                                                            accesstoken:
                                                                FFAppState()
                                                                    .accesstoken,
                                                            csrftoken:
                                                                FFAppState()
                                                                    .csrftoken,
                                                            sessionid:
                                                                FFAppState()
                                                                    .sessionId,
                                                          );

                                                          if ((_model
                                                                  .apiReleaseResult3
                                                                  ?.succeeded ??
                                                              true)) {
                                                            Navigator.pop(
                                                                context);
                                                            _model.isStatusChanged =
                                                                !_model
                                                                    .isStatusChanged;
                                                            setState(() {});
                                                            _model.isStatusChanged =
                                                                false;
                                                            setState(() {});
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.apiReleaseResult3
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.message''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                              ),
                                                            );
                                                          } else {
                                                            Navigator.pop(
                                                                context);
                                                            _model.isStatusChanged =
                                                                !_model
                                                                    .isStatusChanged;
                                                            setState(() {});
                                                            _model.isStatusChanged =
                                                                false;
                                                            setState(() {});
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.apiReleaseResult3
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.message''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .errorRed,
                                                              ),
                                                            );
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9mlhzq0b' /* Complete Trade */,
                                                      ),
                                                      icon: const Icon(
                                                        Icons
                                                            .check_circle_outline_outlined,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor11,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if ((PeerToPeerGroup.gETtradeIDCall
                                                .status(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'COMPLETED') &&
                                        (PeerToPeerGroup.gETtradeIDCall
                                                .disputeStatus(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'CANCELLED')) {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 40.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: const BoxDecoration(),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: const Text(
                                                                        'Complete Trade'),
                                                                    content: const Text(
                                                                        'Are you sure?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: const Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: const Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      _model.apiReleaseResult4 =
                                                          await PeerToPeerGroup
                                                              .releaseCall
                                                              .call(
                                                        id: widget.id,
                                                        accesstoken:
                                                            FFAppState()
                                                                .accesstoken,
                                                        csrftoken: FFAppState()
                                                            .csrftoken,
                                                        sessionid: FFAppState()
                                                            .sessionId,
                                                      );

                                                      if ((_model
                                                              .apiReleaseResult4
                                                              ?.succeeded ??
                                                          true)) {
                                                        Navigator.pop(context);
                                                        _model.isStatusChanged =
                                                            !_model
                                                                .isStatusChanged;
                                                        setState(() {});
                                                        _model.isStatusChanged =
                                                            false;
                                                        setState(() {});
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.apiReleaseResult4
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                          ),
                                                        );
                                                      } else {
                                                        Navigator.pop(context);
                                                        _model.isStatusChanged =
                                                            !_model
                                                                .isStatusChanged;
                                                        setState(() {});
                                                        _model.isStatusChanged =
                                                            false;
                                                        setState(() {});
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.apiReleaseResult4
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .errorRed,
                                                          ),
                                                        );
                                                      }
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'bqyxfcyp' /* Complete Trade */,
                                                  ),
                                                  icon: const Icon(
                                                    Icons
                                                        .check_circle_outline_outlined,
                                                    size: 15.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 100.0,
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor11,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if ((PeerToPeerGroup.gETtradeIDCall
                                                .status(
                                              p2pChatGETtradeIDResponse
                                                  .jsonBody,
                                            ) ==
                                            'COMPLETED') &&
                                        (PeerToPeerGroup.gETtradeIDCall
                                                    .disputeStatus(
                                                  p2pChatGETtradeIDResponse
                                                      .jsonBody,
                                                ) ==
                                                null ||
                                            PeerToPeerGroup.gETtradeIDCall
                                                    .disputeStatus(
                                                  p2pChatGETtradeIDResponse
                                                      .jsonBody,
                                                ) ==
                                                '')) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      P2pDisputeTradeWidget(
                                                                    uuid: widget
                                                                        .id!,
                                                                    disputecomponentAction:
                                                                        () async {
                                                                      _model.isDispute =
                                                                          !_model
                                                                              .isDispute;
                                                                      setState(
                                                                          () {});
                                                                      _model.isDispute =
                                                                          false;
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'lls44rfl' /* Dispute Trade */,
                                                      ),
                                                      icon: const Icon(
                                                        Icons.warning_rounded,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 40.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        title: const Text(
                                                                            'Complete Trade'),
                                                                        content:
                                                                            const Text('Are you sure?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                const Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                const Text('Confirm'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          _model.apiReleaseResult5 =
                                                              await PeerToPeerGroup
                                                                  .releaseCall
                                                                  .call(
                                                            id: widget.id,
                                                            accesstoken:
                                                                FFAppState()
                                                                    .accesstoken,
                                                            csrftoken:
                                                                FFAppState()
                                                                    .csrftoken,
                                                            sessionid:
                                                                FFAppState()
                                                                    .sessionId,
                                                          );

                                                          if ((_model
                                                                  .apiReleaseResult5
                                                                  ?.succeeded ??
                                                              true)) {
                                                            Navigator.pop(
                                                                context);
                                                            _model.isStatusChanged =
                                                                !_model
                                                                    .isStatusChanged;
                                                            setState(() {});
                                                            _model.isStatusChanged =
                                                                false;
                                                            setState(() {});
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.apiReleaseResult5
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.message''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                              ),
                                                            );
                                                          } else {
                                                            Navigator.pop(
                                                                context);
                                                            _model.isStatusChanged =
                                                                !_model
                                                                    .isStatusChanged;
                                                            setState(() {});
                                                            _model.isStatusChanged =
                                                                false;
                                                            setState(() {});
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.apiReleaseResult5
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.message''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .errorRed,
                                                              ),
                                                            );
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '865jkg5p' /* Complete Trade */,
                                                      ),
                                                      icon: const Icon(
                                                        Icons
                                                            .check_circle_outline_outlined,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor11,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                      return const Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [],
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
                );
              },
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: Container(
                            width: 44.0,
                            height: 44.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  functions.generateImageUrl(getJsonField(
                                    p2pChatGETtradeIDResponse.jsonBody,
                                    r'''$.offer.paymentMethod.currency''',
                                  ).toString())!,
                                  width: 44.0,
                                  height: 44.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getJsonField(
                                p2pChatGETtradeIDResponse.jsonBody,
                                r'''$.offer.paymentMethod.name''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: AutoSizeText(
                                PeerToPeerGroup.gETtradeIDCall
                                    .offerID(
                                      p2pChatGETtradeIDResponse.jsonBody,
                                    )!
                                    .maybeHandleOverflow(
                                      maxChars: 40,
                                      replacement: '…',
                                    ),
                                minFontSize: 10.0,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: _model.profile(
                  requestFn: () => AuthinticationGroup.getProfileCall.call(
                    accesstoken: FFAppState().accesstoken,
                    csrftoken: FFAppState().csrftoken,
                    sessionid: FFAppState().sessionId,
                  ),
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
                  final p2pchatComponentGetProfileResponse = snapshot.data!;

                  return wrapWithModel(
                    model: _model.p2pchatComponentModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: P2pchatComponentWidget(
                      dataResulltMassages:
                          PeerToPeerGroup.gETtradeIDCall.messagesList(
                        p2pChatGETtradeIDResponse.jsonBody,
                      ),
                      sellerAvatar: PeerToPeerGroup.gETtradeIDCall.sellerAvatar(
                                    p2pChatGETtradeIDResponse.jsonBody,
                                  ) !=
                                  null &&
                              PeerToPeerGroup.gETtradeIDCall.sellerAvatar(
                                    p2pChatGETtradeIDResponse.jsonBody,
                                  ) !=
                                  ''
                          ? '${FFAppConstants.Domain}${PeerToPeerGroup.gETtradeIDCall.sellerAvatar(
                              p2pChatGETtradeIDResponse.jsonBody,
                            )}'
                          : 'https://images.unsplash.com/photo-1511367461989-f85a21fda167?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxwcm9maWxlfGVufDB8fHx8MTcwNzY1MTczNnww&ixlib=rb-4.0.3&q=80&w=1080',
                      userAvatar: PeerToPeerGroup.gETtradeIDCall.userAvatar(
                                    p2pChatGETtradeIDResponse.jsonBody,
                                  ) !=
                                  null &&
                              PeerToPeerGroup.gETtradeIDCall.userAvatar(
                                    p2pChatGETtradeIDResponse.jsonBody,
                                  ) !=
                                  ''
                          ? '${FFAppConstants.Domain}${PeerToPeerGroup.gETtradeIDCall.userAvatar(
                              p2pChatGETtradeIDResponse.jsonBody,
                            )}'
                          : 'https://images.unsplash.com/photo-1511367461989-f85a21fda167?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxwcm9maWxlfGVufDB8fHx8MTcwNzY1MTczNnww&ixlib=rb-4.0.3&q=80&w=1080',
                      status: getJsonField(
                        p2pChatGETtradeIDResponse.jsonBody,
                        r'''$.status''',
                      ).toString(),
                      uuid: widget.id!,
                      userId: PeerToPeerGroup.gETtradeIDCall.userID(
                        p2pChatGETtradeIDResponse.jsonBody,
                      )!,
                      sellerID: PeerToPeerGroup.gETtradeIDCall.sellerID(
                        p2pChatGETtradeIDResponse.jsonBody,
                      )!,
                    ),
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
