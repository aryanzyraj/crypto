import '/components/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'forex_transactions_model.dart';
export 'forex_transactions_model.dart';

class ForexTransactionsWidget extends StatefulWidget {
  const ForexTransactionsWidget({
    super.key,
    required this.all,
    required this.pending,
  });

  final List<dynamic>? all;
  final List<dynamic>? pending;

  @override
  State<ForexTransactionsWidget> createState() =>
      _ForexTransactionsWidgetState();
}

class _ForexTransactionsWidgetState extends State<ForexTransactionsWidget>
    with TickerProviderStateMixin {
  late ForexTransactionsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForexTransactionsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 4.0,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0x4D262D34),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 770.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(33.0),
                        topRight: Radius.circular(33.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 44.0,
                            fillColor: FlutterFlowTheme.of(context).accent4,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 770.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 12.0,
                          color: Color(0x1E000000),
                          offset: Offset(
                            0.0,
                            5.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 570.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(-1.0, 0),
                                    child: FlutterFlowButtonTabBar(
                                      useToggleButtonStyle: false,
                                      isScrollable: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                      unselectedLabelStyle: const TextStyle(),
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      unselectedBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      unselectedBorderColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 12.0,
                                      elevation: 0.0,
                                      labelPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16.0, 0.0, 16.0, 0.0),
                                      buttonMargin:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16.0, 8.0, 0.0, 8.0),
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '5pztnxat' /* All */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'zchznmay' /* Pending */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        KeepAliveWidgetWrapper(
                                          builder: (context) =>
                                              SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Divider(
                                                  height: 1.0,
                                                  thickness: 1.0,
                                                  indent: 0.0,
                                                  endIndent: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                                Divider(
                                                  height: 1.0,
                                                  thickness: 1.0,
                                                  indent: 0.0,
                                                  endIndent: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final all =
                                                        widget.all!.toList();
                                                    if (all.isEmpty) {
                                                      return const Center(
                                                        child:
                                                            EmptyStateSimpleWidget(
                                                          icon: Icon(
                                                            Icons
                                                                .compare_arrows,
                                                            size: 55.0,
                                                          ),
                                                          title:
                                                              'No Transactions',
                                                          body: ' ',
                                                        ),
                                                      );
                                                    }

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: all.length,
                                                      itemBuilder:
                                                          (context, allIndex) {
                                                        final allItem =
                                                            all[allIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 110.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      0.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  offset:
                                                                      const Offset(
                                                                    0.0,
                                                                    1.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          (String var1) {
                                                                            return var1 ==
                                                                                "FOREX_DEPOSIT";
                                                                          }(getJsonField(
                                                                            allItem,
                                                                            r'''$.type''',
                                                                          ).toString())
                                                                              ? 'Deposit'
                                                                              : 'Withdrawel',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: (String var1) {
                                                                                  return var1 == "FOREX_DEPOSIT";
                                                                                }(getJsonField(
                                                                                  allItem,
                                                                                  r'''$.type''',
                                                                                ).toString())
                                                                                    ? FlutterFlowTheme.of(context).primary
                                                                                    : FlutterFlowTheme.of(context).errorRed,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .timeAgo(getJsonField(
                                                                            allItem,
                                                                            r'''$.createdAt''',
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
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            allItem,
                                                                            r'''$.amount''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            allItem,
                                                                            r'''$.fee''',
                                                                          ).toString(),
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
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            28.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                        ),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              allItem,
                                                                              r'''$.status''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Lexend',
                                                                                  color: (String var1) {
                                                                                    return var1 == "PENDING";
                                                                                  }(getJsonField(
                                                                                    allItem,
                                                                                    r'''$.status''',
                                                                                  ).toString())
                                                                                      ? FlutterFlowTheme.of(context).secondary
                                                                                      : FlutterFlowTheme.of(context).exchangeGreen,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        KeepAliveWidgetWrapper(
                                          builder: (context) =>
                                              SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Divider(
                                                  height: 1.0,
                                                  thickness: 1.0,
                                                  indent: 0.0,
                                                  endIndent: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final pending = widget
                                                        .pending!
                                                        .toList();
                                                    if (pending.isEmpty) {
                                                      return const Center(
                                                        child:
                                                            EmptyStateSimpleWidget(
                                                          icon: Icon(
                                                            Icons
                                                                .compare_arrows,
                                                            size: 55.0,
                                                          ),
                                                          title:
                                                              'No Transactions',
                                                          body: ' ',
                                                        ),
                                                      );
                                                    }

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: pending.length,
                                                      itemBuilder: (context,
                                                          pendingIndex) {
                                                        final pendingItem =
                                                            pending[
                                                                pendingIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 110.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      0.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  offset:
                                                                      const Offset(
                                                                    0.0,
                                                                    1.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          (String var1) {
                                                                            return var1 ==
                                                                                "FOREX_DEPOSIT";
                                                                          }(getJsonField(
                                                                            pendingItem,
                                                                            r'''$.type''',
                                                                          ).toString())
                                                                              ? 'Deposit'
                                                                              : 'Withdrawel',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: (String var1) {
                                                                                  return var1 == "FOREX_DEPOSIT";
                                                                                }(getJsonField(
                                                                                  pendingItem,
                                                                                  r'''$.type''',
                                                                                ).toString())
                                                                                    ? FlutterFlowTheme.of(context).primary
                                                                                    : FlutterFlowTheme.of(context).errorRed,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .timeAgo(getJsonField(
                                                                            pendingItem,
                                                                            r'''$.createdAt''',
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
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            pendingItem,
                                                                            r'''$.amount''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            pendingItem,
                                                                            r'''$.fee''',
                                                                          ).toString(),
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
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            28.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                        ),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              pendingItem,
                                                                              r'''$.status''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Lexend',
                                                                                  color: (String var1) {
                                                                                    return var1 == "PENDING";
                                                                                  }(getJsonField(
                                                                                    pendingItem,
                                                                                    r'''$.status''',
                                                                                  ).toString())
                                                                                      ? FlutterFlowTheme.of(context).secondary
                                                                                      : FlutterFlowTheme.of(context).exchangeGreen,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
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
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation2']!),
                ),
              ],
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
        ),
      ),
    );
  }
}
