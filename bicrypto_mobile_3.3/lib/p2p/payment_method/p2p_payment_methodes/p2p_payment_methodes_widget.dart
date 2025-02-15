import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/p2p/payment_method/p2p_status/p2p_status_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'p2p_payment_methodes_model.dart';
export 'p2p_payment_methodes_model.dart';

class P2pPaymentMethodesWidget extends StatefulWidget {
  const P2pPaymentMethodesWidget({super.key});

  @override
  State<P2pPaymentMethodesWidget> createState() =>
      _P2pPaymentMethodesWidgetState();
}

class _P2pPaymentMethodesWidgetState extends State<P2pPaymentMethodesWidget>
    with TickerProviderStateMixin {
  late P2pPaymentMethodesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P2pPaymentMethodesModel());

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
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(PeerToPeerGroup.gETpaymentMethodesCall.call(
              accesstoken: FFAppState().accesstoken,
              csrftoken: FFAppState().csrftoken,
              sessionid: FFAppState().sessionId,
            )))
          .future,
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
        final p2pPaymentMethodesGETpaymentMethodesResponse = snapshot.data!;

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
                  color: FlutterFlowTheme.of(context).background,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 25.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'j91b32bw' /* P2P Payment Methods */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).background,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
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
              child: Stack(
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
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
                                          'ixc34grq' /* payment Methods */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 8.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.add,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed('p2pCreatPM');
                                        },
                                      ),
                                    ],
                                  ).animateOnPageLoad(
                                      animationsMap['rowOnPageLoadAnimation']!),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final paymentMethodes = PeerToPeerGroup
                                                .gETpaymentMethodesCall
                                                .items(
                                                  p2pPaymentMethodesGETpaymentMethodesResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                        if (paymentMethodes.isEmpty) {
                                          return EmptyStateSimpleWidget(
                                            icon: Icon(
                                              Icons.credit_card_off,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 80.0,
                                            ),
                                            title: 'No Payment Methods',
                                            body:
                                                'There are no payment method associated yet...',
                                          );
                                        }

                                        return RefreshIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          onRefresh: () async {
                                            setState(() => _model
                                                .apiRequestCompleter = null);
                                            await _model
                                                .waitForApiRequestCompleted();
                                          },
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: paymentMethodes.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 10.0),
                                            itemBuilder: (context,
                                                paymentMethodesIndex) {
                                              final paymentMethodesItem =
                                                  paymentMethodes[
                                                      paymentMethodesIndex];
                                              return Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (getJsonField(
                                                                              paymentMethodesItem,
                                                                              r'''$.image''',
                                                                            ) !=
                                                                            null) {
                                                                          return Container(
                                                                            width:
                                                                                45.0,
                                                                            height:
                                                                                45.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              '${FFAppConstants.Domain}${getJsonField(
                                                                                paymentMethodesItem,
                                                                                r'''$.image''',
                                                                              ).toString()}',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return Container(
                                                                            width:
                                                                                45.0,
                                                                            height:
                                                                                45.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/Annonymous.png',
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
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
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                decoration: const BoxDecoration(),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          8.0)),
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    paymentMethodesItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Currency : ${getJsonField(
                                                                      paymentMethodesItem,
                                                                      r'''$.currency''',
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
                                                                            '5hrlhgvs' /* Type:  */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            paymentMethodesItem,
                                                                            r'''$.walletType''',
                                                                          ).toString(),
                                                                          style:
                                                                              const TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                () {
                                                                              if ((String var1) {
                                                                                return var1 == "SPOT";
                                                                              }(getJsonField(
                                                                                paymentMethodesItem,
                                                                                r'''$.walletType''',
                                                                              ).toString())) {
                                                                                return FlutterFlowTheme.of(context).primary;
                                                                              } else if ((String var1) {
                                                                                return var1 == "FIAT";
                                                                              }(getJsonField(
                                                                                paymentMethodesItem,
                                                                                r'''$.walletType''',
                                                                              ).toString())) {
                                                                                return FlutterFlowTheme.of(context).secondary;
                                                                              } else {
                                                                                return FlutterFlowTheme.of(context).exchangeGreen;
                                                                              }
                                                                            }(),
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .edit,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .textColor,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    HapticFeedback
                                                                        .lightImpact();

                                                                    context
                                                                        .pushNamed(
                                                                      'p2pEditPM',
                                                                      queryParameters:
                                                                          {
                                                                        'id':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            paymentMethodesItem,
                                                                            r'''$.id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      P2pStatusWidget(
                                                                        key: Key(
                                                                            'Keyu3y_${paymentMethodesIndex}_of_${paymentMethodes.length}'),
                                                                        id: getJsonField(
                                                                          paymentMethodesItem,
                                                                          r'''$.id''',
                                                                        ).toString(),
                                                                        status:
                                                                            getJsonField(
                                                                          paymentMethodesItem,
                                                                          r'''$.status''',
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 12.0)),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation']!);
                                            },
                                          ),
                                        );
                                      },
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
