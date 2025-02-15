import '/backend/api_requests/api_calls.dart';
import '/components/emptysearch_widget.dart';
import '/components/toast/toast_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mlm/condition_swap/condition_swap_widget.dart';
import '/mlm/referrals/referrals_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'referrals_mlm_model.dart';
export 'referrals_mlm_model.dart';

class ReferralsMlmWidget extends StatefulWidget {
  const ReferralsMlmWidget({
    super.key,
    required this.conditions,
  });

  final List<dynamic>? conditions;

  @override
  State<ReferralsMlmWidget> createState() => _ReferralsMlmWidgetState();
}

class _ReferralsMlmWidgetState extends State<ReferralsMlmWidget>
    with TickerProviderStateMixin {
  late ReferralsMlmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReferralsMlmModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          FFAppState().isOrderBookOpen = false;
          FFAppState().isWebSocketOpen = false;
        }),
        Future(() async {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: WebViewAware(
                  child: GestureDetector(
                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                    child: ConditionSwapWidget(
                      swap: true,
                      conditionsC: widget.conditions!,
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ]);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'nmc3lyc5' /* Referrals */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Lexend',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 1.0),
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(dialogContext)
                                                  .unfocus(),
                                          child: ConditionSwapWidget(
                                            swap: true,
                                            conditionsC: widget.conditions!,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 180.0,
                                decoration: const BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.conditionSwapModel1,
                                  updateCallback: () => setState(() {}),
                                  child: Hero(
                                    tag: 'swap',
                                    transitionOnUserGestures: true,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ConditionSwapWidget(
                                        swap: false,
                                        conditionsC: widget.conditions!,
                                        isList: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 270.0,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'customWebview',
                                        queryParameters: {
                                          'url': serializeParam(
                                            '${FFAppConstants.Domain}/user/affiliate/network',
                                            ParamType.String,
                                          ),
                                          'title': serializeParam(
                                            'Affiliate',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6t3m6nxa' /* Network */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Icon(
                                                FFIcons.knetworkWired,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ktpnqxvh' /* My Rewards */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .emptysearchModel1,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: const EmptysearchWidget(
                                                        dimantion: 70,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '9ksqm6l2' /* No Rewards */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 10.0)),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: FlutterFlowButtonTabBar(
                              useToggleButtonStyle: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: const TextStyle(),
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              unselectedBackgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              unselectedBorderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 4.0,
                              borderRadius: 8.0,
                              elevation: 4.0,
                              buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  50.0, 12.0, 50.0, 12.0),
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'r8vge6oy' /* Referrals */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'wp4xwob1' /* Rewards */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'fc4npqfr' /* Program */,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                KeepAliveWidgetWrapper(
                                  builder: (context) => wrapWithModel(
                                    model: _model.referralsModel,
                                    updateCallback: () => setState(() {}),
                                    child: const ReferralsWidget(),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => wrapWithModel(
                                    model: _model.emptysearchModel2,
                                    updateCallback: () => setState(() {}),
                                    child: const EmptysearchWidget(
                                      dimantion: 90,
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => wrapWithModel(
                                    model: _model.conditionSwapModel2,
                                    updateCallback: () => setState(() {}),
                                    child: ConditionSwapWidget(
                                      swap: false,
                                      isList: true,
                                      conditionsC: widget.conditions!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 33.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
                              HapticFeedback.mediumImpact();
                              _model.apiNODE = await MlmGroup.nodeCall.call(
                                accesstoken: FFAppState().accesstoken,
                                csrftoken: FFAppState().csrftoken,
                                sessionid: FFAppState().sessionId,
                              );

                              if ((_model.apiNODE?.succeeded ?? true)) {
                                await Clipboard.setData(ClipboardData(
                                    text:
                                        '${FFAppConstants.Domain}/register?ref=${MlmGroup.nodeCall.id(
                                  (_model.apiNODE?.jsonBody ?? ''),
                                )}'));
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(dialogContext)
                                                  .unfocus(),
                                          child: const ToastWidget(
                                            success: true,
                                            message:
                                                'The referral link is now copied to your clipboard',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(dialogContext)
                                                  .unfocus(),
                                          child: ToastWidget(
                                            success: false,
                                            message: getJsonField(
                                              (_model.apiNODE?.jsonBody ?? ''),
                                              r'''$.message''',
                                            ).toString(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }

                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'h4i6zij4' /* Invite Friends */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
