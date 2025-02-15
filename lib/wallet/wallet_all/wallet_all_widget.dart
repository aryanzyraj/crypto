import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'wallet_all_model.dart';
export 'wallet_all_model.dart';

class WalletAllWidget extends StatefulWidget {
  const WalletAllWidget({super.key});

  @override
  State<WalletAllWidget> createState() => _WalletAllWidgetState();
}

class _WalletAllWidgetState extends State<WalletAllWidget>
    with TickerProviderStateMixin {
  late WalletAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletAllModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isOrderBookOpen = false;
      FFAppState().isWebSocketOpen = false;
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.6, 0.6),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-24.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(24.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 33.0),
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: Stack(
          alignment: const AlignmentDirectional(0.0, 1.0),
          children: [
            FutureBuilder<ApiCallResponse>(
              future: WalletGroup.getAllUserwalletsCall.call(
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
                final columnGetAllUserwalletsResponse = snapshot.data!;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FutureBuilder<ApiCallResponse>(
                      future: WalletGroup.getAllUserwalletsWIthPnlCall.call(
                        pnl: true,
                        accesstoken: FFAppState().accesstoken,
                        csrftoken: FFAppState().csrftoken,
                        sessionid: FFAppState().sessionId,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 120.0, 0.0, 120.0),
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
                        final containerGetAllUserwalletsWIthPnlResponse =
                            snapshot.data!;

                        return SafeArea(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'hkbjyhuz' /* Balance */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation1']!),
                                      Text(
                                        (double.parse(getJsonField(
                                                  containerGetAllUserwalletsWIthPnlResponse
                                                      .jsonBody,
                                                  r'''$.today''',
                                                ).toStringAsFixed(3))) <
                                                1000000.0
                                            ? formatNumber(
                                                double.parse(getJsonField(
                                                  containerGetAllUserwalletsWIthPnlResponse
                                                      .jsonBody,
                                                  r'''$.today''',
                                                ).toStringAsFixed(3)),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: '\$',
                                              )
                                            : formatNumber(
                                                double.parse(getJsonField(
                                                  containerGetAllUserwalletsWIthPnlResponse
                                                      .jsonBody,
                                                  r'''$.today''',
                                                ).toStringAsFixed(3)),
                                                formatType:
                                                    FormatType.compactLong,
                                              ),
                                        style: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation2']!),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (functions.siteSetting(
                                              FFAppState().Setting.toList(),
                                              'deposit') ==
                                          'true')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.lightImpact();
                                            if ((functions.siteSetting(
                                                        FFAppState()
                                                            .Setting
                                                            .toList(),
                                                        'depositRestrictions') ==
                                                    'true') &&
                                                (FFAppState().kycStatus !=
                                                    'APPROVED')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text('Deposit'),
                                                      content: const Text(
                                                          'To access Deposit services, it is mandatory to complete the (KYC) verification process beforehand.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              context.pushNamed(
                                                'WalletDeposit',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .scale,
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                  ),
                                                },
                                              );
                                            }
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .darkBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Icon(
                                                    FFIcons.karrowCircleUp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textColor,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ab2htmvi' /* Deposit */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(height: 5.0)),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'columnOnPageLoadAnimation1']!),
                                      if (functions.siteSetting(
                                              FFAppState().Setting.toList(),
                                              'withdraw') ==
                                          'true')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.lightImpact();
                                            if ((functions.siteSetting(
                                                        FFAppState()
                                                            .Setting
                                                            .toList(),
                                                        'withdrawalRestrictions') ==
                                                    'true') &&
                                                (FFAppState().kycStatus !=
                                                    'APPROVED')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text('Withdraw'),
                                                      content: const Text(
                                                          'To access Withdraw services, it is mandatory to complete the (KYC) verification process beforehand.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              context.pushNamed(
                                                'WalletWithdraw',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .scale,
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                  ),
                                                },
                                              );
                                            }
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .darkBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Icon(
                                                    FFIcons.karrowCircleDown,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textColor,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'nidcf5e4' /* Withdraw */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(height: 5.0)),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'columnOnPageLoadAnimation2']!),
                                      if (functions.siteSetting(
                                              FFAppState().Setting.toList(),
                                              'transfer') ==
                                          'true')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.lightImpact();
                                            if ((functions.siteSetting(
                                                        FFAppState()
                                                            .Setting
                                                            .toList(),
                                                        'transferRestrictions') ==
                                                    'true') &&
                                                (FFAppState().kycStatus !=
                                                    'APPROVED')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text('Transfer'),
                                                      content: const Text(
                                                          'To access Transfer services, it is mandatory to complete the (KYC) verification process beforehand.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              context.pushNamed(
                                                'newTransfer',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .scale,
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                  ),
                                                },
                                              );
                                            }
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .darkBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Icon(
                                                    FFIcons.karrowCircleLeft,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textColor,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ys0io0kd' /* Transfer */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(height: 5.0)),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'columnOnPageLoadAnimation3']!),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              2.0, 12.0, 2.0, 100.0),
                          child: Builder(
                            builder: (context) {
                              final wallets = WalletGroup.getAllUserwalletsCall
                                      .items(
                                        columnGetAllUserwalletsResponse
                                            .jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              if (wallets.isEmpty) {
                                return const EmptyStateSimpleWidget(
                                  icon: FaIcon(
                                    FontAwesomeIcons.wallet,
                                  ),
                                  title: 'No Wallets',
                                  body: 'There are no associated wallet yet',
                                );
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: wallets.length,
                                itemBuilder: (context, walletsIndex) {
                                  final walletsItem = wallets[walletsIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 12.0, 8.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        HapticFeedback.lightImpact();

                                        context.pushNamed(
                                          'walletTransactions',
                                          queryParameters: {
                                            'walletType': serializeParam(
                                              getJsonField(
                                                walletsItem,
                                                r'''$.type''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'currency': serializeParam(
                                              getJsonField(
                                                walletsItem,
                                                r'''$.currency''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                            ),
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              if (functions.generateImageUrl(
                                                          getJsonField(
                                                        walletsItem,
                                                        r'''$.currency''',
                                                      ).toString()) !=
                                                      null &&
                                                  functions.generateImageUrl(
                                                          getJsonField(
                                                        walletsItem,
                                                        r'''$.currency''',
                                                      ).toString()) !=
                                                      '') {
                                                return Container(
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(1.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              55.0),
                                                      child: Image.network(
                                                        functions
                                                            .generateImageUrl(
                                                                getJsonField(
                                                          walletsItem,
                                                          r'''$.currency''',
                                                        ).toString())!,
                                                        width: 45.0,
                                                        height: 45.0,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          width: 45.0,
                                                          height: 45.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(1.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              55.0),
                                                      child: Image.asset(
                                                        'assets/images/defaultCurrecny.png',
                                                        width: 45.0,
                                                        height: 45.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        walletsItem,
                                                        r'''$.currency''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      getJsonField(
                                                        walletsItem,
                                                        r'''$.type''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  walletsItem,
                                                  r'''$.balance''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                functions
                                                    .monthDayYear(getJsonField(
                                                  walletsItem,
                                                  r'''$.createdAt''',
                                                ).toString())!,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ).animateOnPageLoad(animationsMap[
                                  'listViewOnPageLoadAnimation']!);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            wrapWithModel(
              model: _model.navBarModel,
              updateCallback: () => setState(() {}),
              child: const NavBarWidget(
                activePage: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
