import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/p2p/offer/p2p_my_offers_drpdown/p2p_my_offers_drpdown_widget.dart';
import '/p2p/rate_component/rate_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'p2p_my_offers_model.dart';
export 'p2p_my_offers_model.dart';

class P2pMyOffersWidget extends StatefulWidget {
  const P2pMyOffersWidget({super.key});

  @override
  State<P2pMyOffersWidget> createState() => _P2pMyOffersWidgetState();
}

class _P2pMyOffersWidgetState extends State<P2pMyOffersWidget>
    with TickerProviderStateMixin {
  late P2pMyOffersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P2pMyOffersModel());

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
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 2.0,
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
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      future: PeerToPeerGroup.gETmyOffersCall.call(
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
        final p2pMyOffersGETmyOffersResponse = snapshot.data!;

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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 25.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '7yuk1jpo' /* My Offers */,
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
                          width: 4.0,
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
                                          'dz99uobp' /* OFFERS */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
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
                                          context.pushNamed(
                                            'p2pCreateOffer',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
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
                                        final offersList =
                                            PeerToPeerGroup.gETmyOffersCall
                                                    .dataResult(
                                                      p2pMyOffersGETmyOffersResponse
                                                          .jsonBody,
                                                    )
                                                    ?.map((e) => e)
                                                    .toList()
                                                    .toList() ??
                                                [];

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: offersList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, offersListIndex) {
                                            final offersListItem =
                                                offersList[offersListIndex];
                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                                Container(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    functions
                                                                        .generateImageUrl(
                                                                            getJsonField(
                                                                      offersListItem,
                                                                      r'''$.currency''',
                                                                    ).toString())!,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                        '${getJsonField(
                                                                          offersListItem,
                                                                          r'''$.currency''',
                                                                        ).toString()} (${getJsonField(
                                                                          offersListItem,
                                                                          r'''$.walletType''',
                                                                        ).toString()} Wallet)',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        getJsonField(
                                                                          offersListItem,
                                                                          r'''$.paymentMethod.name''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
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
                                                        Builder(
                                                          builder: (context) =>
                                                              FlutterFlowIconButton(
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .settings_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              HapticFeedback
                                                                  .lightImpact();
                                                              await showAlignedDialog(
                                                                context:
                                                                    context,
                                                                isGlobal: false,
                                                                avoidOverflow:
                                                                    true,
                                                                targetAnchor:
                                                                    const AlignmentDirectional(
                                                                            -5.0,
                                                                            4.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                followerAnchor:
                                                                    const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(dialogContext).unfocus(),
                                                                        child:
                                                                            P2pMyOffersDrpdownWidget(
                                                                          status:
                                                                              getJsonField(
                                                                            offersListItem,
                                                                            r'''$.status''',
                                                                          ).toString(),
                                                                          id: getJsonField(
                                                                            offersListItem,
                                                                            r'''$.id''',
                                                                          ).toString(),
                                                                          walletType:
                                                                              getJsonField(
                                                                            offersListItem,
                                                                            r'''$.walletType''',
                                                                          ).toString(),
                                                                          currency:
                                                                              getJsonField(
                                                                            offersListItem,
                                                                            r'''$.currency''',
                                                                          ).toString(),
                                                                          statusAction:
                                                                              (isupdated) async {
                                                                            if (animationsMap['containerOnActionTriggerAnimation'] !=
                                                                                null) {
                                                                              animationsMap['containerOnActionTriggerAnimation']!.controller.forward(from: 0.0);
                                                                            }
                                                                            _model.status =
                                                                                !_model.status;
                                                                            setState(() {});
                                                                          },
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
                                                            MainAxisSize.max,
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
                                                                  'xy3uxaq6' /* Available */,
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
                                                                  offersListItem,
                                                                  r'''$.amount''',
                                                                ).toString()} ${getJsonField(
                                                                  offersListItem,
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
                                                                  'd30qn5sf' /* Price */,
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
                                                                  offersListItem,
                                                                  r'''$.price''',
                                                                ).toString()} ${getJsonField(
                                                                  offersListItem,
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
                                                                  'jtoxrroa' /* Status */,
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
                                                                  color: () {
                                                                    if ((String
                                                                        var1) {
                                                                      return var1 ==
                                                                          'ACTIVE';
                                                                    }(getJsonField(
                                                                      offersListItem,
                                                                      r'''$.status''',
                                                                    ).toString())) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor2;
                                                                    } else if ((String var1) {
                                                                      return var1 ==
                                                                          'COMPLETED';
                                                                    }(getJsonField(
                                                                      offersListItem,
                                                                      r'''$.status''',
                                                                    ).toString())) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .exchangeGreenLight;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor3;
                                                                    }
                                                                  }(),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          4.0,
                                                                          6.0,
                                                                          4.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      offersListItem,
                                                                      r'''$.status''',
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
                                                                ),
                                                              ).animateOnActionTrigger(
                                                                animationsMap[
                                                                    'containerOnActionTriggerAnimation']!,
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
                                                                  'qk0kx1cz' /* Rating */,
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
                                                              RateComponentWidget(
                                                                key: Key(
                                                                    'Keyxwd_${offersListIndex}_of_${offersList.length}'),
                                                                parameter1:
                                                                    getJsonField(
                                                                  offersListItem,
                                                                  r'''$.reviews[:]''',
                                                                  true,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 10.0)),
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
