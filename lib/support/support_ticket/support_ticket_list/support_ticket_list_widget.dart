import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/support/support_ticket/empty_state_dynamic/empty_state_dynamic_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'support_ticket_list_model.dart';
export 'support_ticket_list_model.dart';

class SupportTicketListWidget extends StatefulWidget {
  const SupportTicketListWidget({super.key});

  @override
  State<SupportTicketListWidget> createState() =>
      _SupportTicketListWidgetState();
}

class _SupportTicketListWidgetState extends State<SupportTicketListWidget> {
  late SupportTicketListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportTicketListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isOrderBookOpen = false;
      FFAppState().isWebSocketOpen = false;
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
      future: SupportGroup.supportTicketsCall.call(
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitDualRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final supportTicketListSupportTicketsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                  context.goNamed(
                    'BicryptoHomePage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                      ),
                    },
                  );
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'mgjnflrq' /* Support Tickets */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Lexend',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 6.0, 8.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).primary,
                      borderRadius: 12.0,
                      borderWidth: 2.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.post_add_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('support_SubmitTicket');
                      },
                    ),
                  ),
                ],
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'jwk7o85w' /* Below are a list of recent tic... */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final getTickets = SupportGroup.supportTicketsCall
                                .items(
                                  supportTicketListSupportTicketsResponse
                                      .jsonBody,
                                )
                                ?.toList() ??
                            [];
                        if (getTickets.isEmpty) {
                          return Center(
                            child: SizedBox(
                              height: 330.0,
                              child: EmptyStateDynamicWidget(
                                icon: Icon(
                                  Icons.live_help_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 90.0,
                                ),
                                title: 'No Support Tickets Exist',
                                body:
                                    'Ah, you are in luck, none of your support tickets exist.',
                                buttonText: 'Create Ticket',
                                buttonAction: () async {
                                  context.pushNamed('support_SubmitTicket');
                                },
                              ),
                            ),
                          );
                        }

                        return ListView.separated(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            12.0,
                            0,
                            44.0,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: getTickets.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                          itemBuilder: (context, getTicketsIndex) {
                            final getTicketsItem = getTickets[getTicketsIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 6.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (getJsonField(
                                        getTicketsItem,
                                        r'''$.agent.firstName''',
                                      ) !=
                                      null) {
                                    HapticFeedback.lightImpact();

                                    context.pushNamed(
                                      'supoortChat',
                                      queryParameters: {
                                        'uuid': serializeParam(
                                          getJsonField(
                                            getTicketsItem,
                                            r'''$.id''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'subject': serializeParam(
                                          getJsonField(
                                            getTicketsItem,
                                            r'''$.subject''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: const Text('Pending'),
                                            content: const Text(
                                                'Your ticket is currently in the queue awaiting review. We appreciate your patience as our support team diligently works to address each request in the order it was received. You will be notified as soon as an agent opens your ticket. Thank you for your understanding'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  constraints: const BoxConstraints(
                                    maxWidth: 570.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        getTicketsItem,
                                                        r'''$.subject''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  functions
                                                      .timeAgo(getJsonField(
                                                    getTicketsItem,
                                                    r'''$.updatedAt''',
                                                  ).toString()),
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Container(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (getJsonField(
                                                            getTicketsItem,
                                                            r'''$.agent.avatar''',
                                                          ) !=
                                                          null) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  1.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          200),
                                                              fadeOutDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          200),
                                                              imageUrl:
                                                                  '${FFAppConstants.Domain}${getJsonField(
                                                                getTicketsItem,
                                                                r'''$.agent.avatar''',
                                                              ).toString()}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Icon(
                                                          Icons
                                                              .watch_later_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 4.0)),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 12.0,
                                                height: 12.0,
                                                decoration: BoxDecoration(
                                                  color: () {
                                                    if ((String var1) {
                                                      return var1 == 'LOW';
                                                    }(getJsonField(
                                                      getTicketsItem,
                                                      r'''$.importance''',
                                                    ).toString())) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .success;
                                                    } else if ((String var1) {
                                                      return var1 == 'MEDIUM';
                                                    }(getJsonField(
                                                      getTicketsItem,
                                                      r'''$.importance''',
                                                    ).toString())) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .warning;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .errorRed;
                                                    }
                                                  }(),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: () {
                                                      if ((String var1) {
                                                        return var1 == 'LOW';
                                                      }(getJsonField(
                                                        getTicketsItem,
                                                        r'''$.importance''',
                                                      ).toString())) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .textColor;
                                                      } else if ((String var1) {
                                                        return var1 == 'MEDIUM';
                                                      }(getJsonField(
                                                        getTicketsItem,
                                                        r'''$.importance''',
                                                      ).toString())) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .textColor;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondary;
                                                      }
                                                    }(),
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        getTicketsItem,
                                                        r'''$.importance''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (!((String var1) {
                                                return var1 == 'CLOSED';
                                              }(getJsonField(
                                                getTicketsItem,
                                                r'''$.status''',
                                              ).toString())))
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: Icon(
                                                    Icons.attach_file_sharp,
                                                    color: (String var1) {
                                                      return var1 == 'PENDING';
                                                    }(getJsonField(
                                                      getTicketsItem,
                                                      r'''$.status''',
                                                    ).toString())
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .grayDark
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .customColor5,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              Container(
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: () {
                                                    if ((String var1) {
                                                      return var1 == 'PENDING';
                                                    }(getJsonField(
                                                      getTicketsItem,
                                                      r'''$.status''',
                                                    ).toString())) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .customColor3;
                                                    } else if ((String var1) {
                                                      return var1 == 'CLOSED';
                                                    }(getJsonField(
                                                      getTicketsItem,
                                                      r'''$.status''',
                                                    ).toString())) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .customColor12;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .customColor2;
                                                    }
                                                  }(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        getTicketsItem,
                                                        r'''$.status''',
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
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ),
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
        );
      },
    );
  }
}
