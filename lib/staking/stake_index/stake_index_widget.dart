import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/staking/stake_btm_sheet/stake_btm_sheet_widget.dart';
import '/staking/stake_collect_view/stake_collect_view_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'stake_index_model.dart';
export 'stake_index_model.dart';

class StakeIndexWidget extends StatefulWidget {
  const StakeIndexWidget({super.key});

  @override
  State<StakeIndexWidget> createState() => _StakeIndexWidgetState();
}

class _StakeIndexWidgetState extends State<StakeIndexWidget>
    with TickerProviderStateMixin {
  late StakeIndexModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StakeIndexModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.market(
        context,
      );
      FFAppState().isOrderBookOpen = false;
      FFAppState().isWebSocketOpen = false;
    });

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1500.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-58.0, 0.0),
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
      future: StakingPoolsGroup.stakingPoolsCall.call(
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
        final stakeIndexStakingPoolsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'kb4ud76m' /* Staking */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Lexend',
                          letterSpacing: 0.0,
                        ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
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
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['iconOnPageLoadAnimation2']!),
                ],
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Stack(
              alignment: const AlignmentDirectional(0.0, 1.0),
              children: [
                Builder(
                  builder: (context) {
                    final stakingList = StakingPoolsGroup.stakingPoolsCall
                            .dataResult(
                              stakeIndexStakingPoolsResponse.jsonBody,
                            )
                            ?.toList() ??
                        [];
                    if (stakingList.isEmpty) {
                      return const EmptyStateSimpleWidget(
                        icon: Icon(
                          Icons.style_sharp,
                          size: 50.0,
                        ),
                        title: 'No Staking Pools',
                        body: 'There are no staking pools yet..',
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      scrollDirection: Axis.vertical,
                      itemCount: stakingList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                      itemBuilder: (context, stakingListIndex) {
                        final stakingListItem = stakingList[stakingListIndex];
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.lightImpact();
                                  if ((getJsonField(
                                            stakingListItem,
                                            r'''$.stakingLogs[?(@.status=='ACTIVE')].status''',
                                          ) !=
                                          null) &&
                                      ((String var1) {
                                        return var1 == 'ACTIVE';
                                      }(getJsonField(
                                        stakingListItem,
                                        r'''$.stakingLogs[?(@.status=='ACTIVE')].status''',
                                      ).toString()))) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: StakeCollectViewWidget(
                                                id: getJsonField(
                                                  stakingListItem,
                                                  r'''$.stakingLogs[?(@.status=='ACTIVE')].id''',
                                                ).toString(),
                                                duration: getJsonField(
                                                  stakingListItem,
                                                  r'''$.stakingLogs[?(@.status=='ACTIVE')].duration.duration''',
                                                ),
                                                interestRate: getJsonField(
                                                  stakingListItem,
                                                  r'''$.stakingLogs[?(@.status=='ACTIVE')].duration.interestRate''',
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: StakeBtmSheetWidget(
                                                stakeItem: stakingListItem,
                                                durationList: getJsonField(
                                                  stakingListItem,
                                                  r'''$.stakingDurations[:]''',
                                                  true,
                                                )!,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 6.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      '${FFAppConstants.Domain}${getJsonField(
                                                        stakingListItem,
                                                        r'''$.icon''',
                                                      ).toString()}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  '${getJsonField(
                                                                    stakingListItem,
                                                                    r'''$.currency''',
                                                                  ).toString()} ( ${getJsonField(
                                                                    stakingListItem,
                                                                    r'''$.name''',
                                                                  ).toString()} )',
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
                                                              ],
                                                            ),
                                                          ),
                                                          SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
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
                                                                          '32275kbd' /* LIMITS:   */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            getJsonField(
                                                                          stakingListItem,
                                                                          r'''$.minStake''',
                                                                        ).toString(),
                                                                        style:
                                                                            const TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'a4sdylmd' /*  -  */,
                                                                        ),
                                                                        style:
                                                                            const TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            getJsonField(
                                                                          stakingListItem,
                                                                          r'''$.maxStake''',
                                                                        ).toString(),
                                                                        style:
                                                                            const TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'rlaxrvf9' /*   */,
                                                                        ),
                                                                        style:
                                                                            const TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            getJsonField(
                                                                          stakingListItem,
                                                                          r'''$.currency''',
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
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(const SizedBox(height: 8.0)),
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
                        ).animateOnPageLoad(
                            animationsMap['stackOnPageLoadAnimation']!);
                      },
                    );
                  },
                ),
                Align(
                  alignment: const AlignmentDirectional(0.08, 1.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      HapticFeedback.lightImpact();

                      context.pushNamed(
                        'myStaking',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.bottomToTop,
                          ),
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(88.0),
                          topRight: Radius.circular(88.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'xas2a44f' /* Staking History */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 33.0,
                            ).animateOnPageLoad(
                                animationsMap['iconOnPageLoadAnimation1']!),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
