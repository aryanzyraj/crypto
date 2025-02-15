import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/staking/stake_collect_view/stake_collect_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'my_staking_model.dart';
export 'my_staking_model.dart';

class MyStakingWidget extends StatefulWidget {
  const MyStakingWidget({super.key});

  @override
  State<MyStakingWidget> createState() => _MyStakingWidgetState();
}

class _MyStakingWidgetState extends State<MyStakingWidget>
    with TickerProviderStateMixin {
  late MyStakingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyStakingModel());

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
      future: StakingPoolsGroup.getMyStakingCall.call(
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
        final myStakingGetMyStakingResponse = snapshot.data!;

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
                      'o6tjiz0o' /* My Staking */,
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
                      context.safePop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
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
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final stakingList = StakingPoolsGroup.getMyStakingCall
                                .dataResult(
                                  myStakingGetMyStakingResponse.jsonBody,
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
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: stakingList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                          itemBuilder: (context, stakingListIndex) {
                            final stakingListItem =
                                stakingList[stakingListIndex];
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
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: StakeCollectViewWidget(
                                                  id: getJsonField(
                                                    stakingListItem,
                                                    r'''$.id''',
                                                  ).toString(),
                                                  duration: getJsonField(
                                                    stakingListItem,
                                                    r'''$.duration.duration''',
                                                  ),
                                                  interestRate: getJsonField(
                                                    stakingListItem,
                                                    r'''$.duration.interestRate''',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 0.0, 6.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(6.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          '${FFAppConstants.Domain}${getJsonField(
                                                            stakingListItem,
                                                            r'''$.pool.icon''',
                                                          ).toString()}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
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
                                                                            r'''$.pool.currency''',
                                                                          ).toString()} ( ${getJsonField(
                                                                            stakingListItem,
                                                                            r'''$.pool.name''',
                                                                          ).toString()} )',
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
                                                                  SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'l3xtpsyq' /* Ends :   */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: functions.stakingEndDate(
                                                                                    getJsonField(
                                                                                      stakingListItem,
                                                                                      r'''$.createdAt''',
                                                                                    ).toString(),
                                                                                    getJsonField(
                                                                                      stakingListItem,
                                                                                      r'''$.duration.duration''',
                                                                                    ))!,
                                                                                style: const TextStyle(),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        5.0)),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: (String
                                                                      var1) {
                                                                return var1 ==
                                                                    'ACTIVE';
                                                              }(getJsonField(
                                                                stakingListItem,
                                                                r'''$.pool.status''',
                                                              ).toString())
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor1
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: (String
                                                                        var1) {
                                                                  return var1 ==
                                                                      'ACTIVE';
                                                                }(getJsonField(
                                                                  stakingListItem,
                                                                  r'''$.pool.status''',
                                                                ).toString())
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          6.0,
                                                                          8.0,
                                                                          6.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  stakingListItem,
                                                                  r'''$.pool.status''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: (String
                                                                              var1) {
                                                                        return var1 ==
                                                                            'ACTIVE';
                                                                      }(getJsonField(
                                                                        stakingListItem,
                                                                        r'''$.pool.status''',
                                                                      ).toString())
                                                                          ? FlutterFlowTheme.of(context).primary
                                                                          : FlutterFlowTheme.of(context).secondary,
                                                                      fontSize:
                                                                          11.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 8.0)),
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
