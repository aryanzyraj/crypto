import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/support/support_chat/support_chat_component/support_chat_component_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'supoort_chat_model.dart';
export 'supoort_chat_model.dart';

class SupoortChatWidget extends StatefulWidget {
  const SupoortChatWidget({
    super.key,
    required this.uuid,
    required this.subject,
  });

  final String? uuid;
  final String? subject;

  @override
  State<SupoortChatWidget> createState() => _SupoortChatWidgetState();
}

class _SupoortChatWidgetState extends State<SupoortChatWidget> {
  late SupoortChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupoortChatModel());
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
      future: SupportGroup.supportTicketIDCall.call(
        id: widget.uuid,
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
        final supoortChatSupportTicketIDResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            endDrawer: Drawer(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'gu3m6xfj' /* Ticket Detail */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              if (SupportGroup
                                                          .supportTicketIDCall
                                                          .agaentAvatar(
                                                        supoortChatSupportTicketIDResponse
                                                            .jsonBody,
                                                      ) !=
                                                      null &&
                                                  SupportGroup
                                                          .supportTicketIDCall
                                                          .agaentAvatar(
                                                        supoortChatSupportTicketIDResponse
                                                            .jsonBody,
                                                      ) !=
                                                      '') {
                                                return Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayDark,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(2.0),
                                                    child: Container(
                                                      width: 120.0,
                                                      height: 120.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        '${SupportGroup.supportTicketIDCall.agaentAvatar(
                                                          supoortChatSupportTicketIDResponse
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayDark,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(2.0),
                                                    child: Container(
                                                      width: 120.0,
                                                      height: 120.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/unknownUser.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'v38gawi1' /* Agent:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: SupportGroup
                                                    .supportTicketIDCall
                                                    .agentFN(
                                                  supoortChatSupportTicketIDResponse
                                                      .jsonBody,
                                                )!,
                                                style: const TextStyle(),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'm7ggchgq' /*   */,
                                                ),
                                                style: const TextStyle(),
                                              ),
                                              TextSpan(
                                                text: SupportGroup
                                                    .supportTicketIDCall
                                                    .agentLN(
                                                  supoortChatSupportTicketIDResponse
                                                      .jsonBody,
                                                )!,
                                                style: const TextStyle(),
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
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'lr7jwtna' /* Ticekt */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        '#${widget.uuid}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'xnlk92o4' /* Status */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          SupportGroup.supportTicketIDCall
                                              .status(
                                            supoortChatSupportTicketIDResponse
                                                .jsonBody,
                                          )!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: () {
                                                  if (SupportGroup
                                                          .supportTicketIDCall
                                                          .status(
                                                        supoortChatSupportTicketIDResponse
                                                            .jsonBody,
                                                      ) ==
                                                      'CLOSED') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .errorRed;
                                                  } else if (SupportGroup
                                                          .supportTicketIDCall
                                                          .status(
                                                        supoortChatSupportTicketIDResponse
                                                            .jsonBody,
                                                      ) ==
                                                      'OPEN') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary;
                                                  } else if (SupportGroup
                                                          .supportTicketIDCall
                                                          .status(
                                                        supoortChatSupportTicketIDResponse
                                                            .jsonBody,
                                                      ) ==
                                                      'PENDING') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondary;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .info;
                                                  }
                                                }(),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
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
                                          FFLocalizations.of(context).getText(
                                            'dt3s41pk' /* Importance */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          SupportGroup.supportTicketIDCall
                                              .importance(
                                            supoortChatSupportTicketIDResponse
                                                .jsonBody,
                                          )!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: () {
                                                  if (SupportGroup
                                                          .supportTicketIDCall
                                                          .importance(
                                                        supoortChatSupportTicketIDResponse
                                                            .jsonBody,
                                                      ) ==
                                                      'LOW') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .warning;
                                                  } else if (SupportGroup
                                                          .supportTicketIDCall
                                                          .importance(
                                                        supoortChatSupportTicketIDResponse
                                                            .jsonBody,
                                                      ) ==
                                                      'MEDIUM') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondary;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .errorRed;
                                                  }
                                                }(),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(const SizedBox(height: 10.0)),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'o618qw5p' /* Subject */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        '${widget.subject}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(const SizedBox(height: 30.0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                HapticFeedback.lightImpact();
                                _model.apicloseResult =
                                    await SupportGroup.closeTicketCall.call(
                                  accesstoken: FFAppState().accesstoken,
                                  csrftoken: FFAppState().newsurl,
                                  sessionid: FFAppState().sessionId,
                                  id: widget.uuid,
                                );

                                if ((_model.apicloseResult?.succeeded ??
                                    true)) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                          (_model.apicloseResult?.jsonBody ??
                                              ''),
                                          r'''$.message''',
                                        ).toString(),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                  );
                                } else {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                          (_model.apicloseResult?.jsonBody ??
                                              ''),
                                          r'''$.message''',
                                        ).toString(),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).errorRed,
                                    ),
                                  );
                                }

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '142fhk2c' /* Close Ticket */,
                              ),
                              icon: const Icon(
                                Icons.close_outlined,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: 250.0,
                                height: 45.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).errorRed,
                                textStyle: FlutterFlowTheme.of(context)
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
                                borderRadius: BorderRadius.circular(24.0),
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
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                            ),
                            child: Builder(
                              builder: (context) {
                                if (SupportGroup.supportTicketIDCall
                                            .agaentAvatar(
                                          supoortChatSupportTicketIDResponse
                                              .jsonBody,
                                        ) !=
                                        null &&
                                    SupportGroup.supportTicketIDCall
                                            .agaentAvatar(
                                          supoortChatSupportTicketIDResponse
                                              .jsonBody,
                                        ) !=
                                        '') {
                                  return Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        '${FFAppConstants.Domain}${SupportGroup.supportTicketIDCall.agaentAvatar(
                                          supoortChatSupportTicketIDResponse
                                              .jsonBody,
                                        )}',
                                        width: 44.0,
                                        height: 44.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        FFAppConstants.Domain,
                                        width: 44.0,
                                        height: 44.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }
                              },
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
                              '${SupportGroup.supportTicketIDCall.agentFN(
                                supoortChatSupportTicketIDResponse.jsonBody,
                              )} ${SupportGroup.supportTicketIDCall.agentLN(
                                supoortChatSupportTicketIDResponse.jsonBody,
                              )}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: AutoSizeText(
                                widget.uuid!.maybeHandleOverflow(
                                  maxChars: 40,
                                  replacement: '…',
                                ),
                                minFontSize: 10.0,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Poppins',
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
                future: _model
                    .profile(
                  requestFn: () => AuthinticationGroup.getProfileCall.call(
                    accesstoken: FFAppState().accesstoken,
                    csrftoken: FFAppState().csrftoken,
                    sessionid: FFAppState().sessionId,
                  ),
                )
                    .then((result) {
                  _model.apiRequestCompleted = true;
                  return result;
                }),
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
                  final supportChatComponentGetProfileResponse = snapshot.data!;

                  return wrapWithModel(
                    model: _model.supportChatComponentModel,
                    updateCallback: () => setState(() {}),
                    child: SupportChatComponentWidget(
                      agnetAvatar:
                          SupportGroup.supportTicketIDCall.agaentAvatar(
                        supoortChatSupportTicketIDResponse.jsonBody,
                      )!,
                      status: SupportGroup.supportTicketIDCall.status(
                        supoortChatSupportTicketIDResponse.jsonBody,
                      )!,
                      massages: SupportGroup.supportTicketIDCall.messages(
                        supoortChatSupportTicketIDResponse.jsonBody,
                      ),
                      userID: SupportGroup.supportTicketIDCall.userid(
                        supoortChatSupportTicketIDResponse.jsonBody,
                      )!,
                      uuid: widget.uuid!,
                      componentAction: () async {
                        setState(() {
                          _model.clearProfileCache();
                          _model.apiRequestCompleted = false;
                        });
                        await _model.waitForApiRequestCompleted();
                      },
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
