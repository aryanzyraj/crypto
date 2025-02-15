import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    this.activePage,
  });

  final int? activePage;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget>
    with TickerProviderStateMixin {
  late NavBarModel _model;

  var hasImageTriggered1 = false;
  var hasImageTriggered2 = false;
  var hasImageTriggered3 = false;
  var hasImageTriggered4 = false;
  var hasImageTriggered5 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    animationsMap.addAll({
      'imageOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.1, 1.1),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.1, 1.1),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.1, 1.1),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.1, 1.1),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.1, 1.1),
            end: const Offset(1.0, 1.0),
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
    context.watch<FFAppState>();

    return SizedBox(
      height: 75.0,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            HapticFeedback.lightImpact();
                            if (animationsMap[
                                    'imageOnActionTriggerAnimation1'] !=
                                null) {
                              setState(() => hasImageTriggered1 = true);
                              SchedulerBinding.instance.addPostFrameCallback(
                                  (_) async => await animationsMap[
                                          'imageOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0));
                            }

                            context.goNamed(
                              'BicryptoHomePage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget.activePage == 1) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/solar--home-angle-2-bold.svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ).animateOnActionTrigger(
                                        animationsMap[
                                            'imageOnActionTriggerAnimation1']!,
                                        hasBeenTriggered: hasImageTriggered1);
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/solar--home-angle-2-bold-duotone.svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '4awiub45' /* Home */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: valueOrDefault<Color>(
                                        widget.activePage == 1
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ]
                                .divide(const SizedBox(height: 4.0))
                                .addToStart(const SizedBox(height: 12.0))
                                .addToEnd(const SizedBox(height: 12.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            HapticFeedback.lightImpact();
                            if (animationsMap[
                                    'imageOnActionTriggerAnimation2'] !=
                                null) {
                              setState(() => hasImageTriggered2 = true);
                              SchedulerBinding.instance.addPostFrameCallback(
                                  (_) async => await animationsMap[
                                          'imageOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0));
                            }

                            context.goNamed(
                              'exchangeAllTickersCopy',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget.activePage == 2) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/solar--chart-bold.svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ).animateOnActionTrigger(
                                        animationsMap[
                                            'imageOnActionTriggerAnimation2']!,
                                        hasBeenTriggered: hasImageTriggered2);
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/solar--chart-bold-duotone.svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'mwl316zz' /* Markets */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: widget.activePage == 2
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ]
                                .divide(const SizedBox(height: 4.0))
                                .addToStart(const SizedBox(height: 12.0))
                                .addToEnd(const SizedBox(height: 12.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            HapticFeedback.lightImpact();
                            if (animationsMap[
                                    'imageOnActionTriggerAnimation3'] !=
                                null) {
                              setState(() => hasImageTriggered3 = true);
                              SchedulerBinding.instance.addPostFrameCallback(
                                  (_) async => await animationsMap[
                                          'imageOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0));
                            }

                            context.goNamed(
                              'exchangeTrade',
                              queryParameters: {
                                'pair': serializeParam(
                                  'BTC/USDT',
                                  ParamType.String,
                                ),
                                'comeFromMarket': serializeParam(
                                  false,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget.activePage == 3) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/solar--transfer-vertical-bold.svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ).animateOnActionTrigger(
                                        animationsMap[
                                            'imageOnActionTriggerAnimation3']!,
                                        hasBeenTriggered: hasImageTriggered3);
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/solar--transfer-vertical-bold-duotone.svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'fhy3xap0' /* Trade */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: widget.activePage == 3
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ]
                                .divide(const SizedBox(height: 4.0))
                                .addToStart(const SizedBox(height: 12.0))
                                .addToEnd(const SizedBox(height: 12.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            HapticFeedback.lightImpact();
                            if (animationsMap[
                                    'imageOnActionTriggerAnimation4'] !=
                                null) {
                              setState(() => hasImageTriggered4 = true);
                              SchedulerBinding.instance.addPostFrameCallback(
                                  (_) async => await animationsMap[
                                          'imageOnActionTriggerAnimation4']!
                                      .controller
                                      .forward(from: 0.0));
                            }

                            context.goNamed(
                              'news',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget.activePage == 4) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/solar--bookmark-bold.svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ).animateOnActionTrigger(
                                        animationsMap[
                                            'imageOnActionTriggerAnimation4']!,
                                        hasBeenTriggered: hasImageTriggered4);
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/solar--bookmark-bold-duotone.svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'w5at1zmr' /* News */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: widget.activePage == 4
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ]
                                .divide(const SizedBox(height: 4.0))
                                .addToStart(const SizedBox(height: 12.0))
                                .addToEnd(const SizedBox(height: 12.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            HapticFeedback.lightImpact();
                            if (animationsMap[
                                    'imageOnActionTriggerAnimation5'] !=
                                null) {
                              setState(() => hasImageTriggered5 = true);
                              SchedulerBinding.instance.addPostFrameCallback(
                                  (_) async => await animationsMap[
                                          'imageOnActionTriggerAnimation5']!
                                      .controller
                                      .forward(from: 0.0));
                            }
                            if ((functions.siteSetting(
                                        FFAppState().Setting.toList(),
                                        'walletRestrictions') ==
                                    'true') &&
                                (FFAppState().kycStatus != 'APPROVED')) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: const Text('Wallet'),
                                      content: const Text(
                                          'To access Wallet services, it is mandatory to complete the (KYC) verification process beforehand.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              context.goNamed(
                                'Wallet_All',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget.activePage == 5) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/solar--wallet-bold.svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ).animateOnActionTrigger(
                                        animationsMap[
                                            'imageOnActionTriggerAnimation5']!,
                                        hasBeenTriggered: hasImageTriggered5);
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/solar--wallet-bold-duotone.svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'o2leqb3a' /* Wallet */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: widget.activePage == 5
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ]
                                .divide(const SizedBox(height: 4.0))
                                .addToStart(const SizedBox(height: 12.0))
                                .addToEnd(const SizedBox(height: 12.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
