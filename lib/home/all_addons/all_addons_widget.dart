import '/backend/api_requests/api_calls.dart';
import '/components/toast/toast_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/addon_component/addon_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'all_addons_model.dart';
export 'all_addons_model.dart';

class AllAddonsWidget extends StatefulWidget {
  const AllAddonsWidget({super.key});

  @override
  State<AllAddonsWidget> createState() => _AllAddonsWidgetState();
}

class _AllAddonsWidgetState extends State<AllAddonsWidget>
    with TickerProviderStateMixin {
  late AllAddonsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllAddonsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiSettingResultC = await SettingGroup.settingsCall.call(
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      );

      if ((_model.apiSettingResultC?.succeeded ?? true)) {
        FFAppState().Setting = SettingGroup.settingsCall
            .settings(
              (_model.apiSettingResultC?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        FFAppState().extensions = SettingGroup.settingsCall
            .extensions(
              (_model.apiSettingResultC?.jsonBody ?? ''),
            )!
            .toList()
            .cast<String>();
        _model.addonsShow = true;
        setState(() {});
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation9': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation10': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation11': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation12': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation13': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation14': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation15': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation16': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x3CFFFFFF),
            angle: 0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        if (_model.addonsShow)
          GridView(
            padding: const EdgeInsets.fromLTRB(
              12.0,
              0,
              12.0,
              0,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 1.0,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              if (functions.extensionsVisibility(
                      SettingGroup.settingsCall
                          .extensions(
                            (_model.apiSettingResultC?.jsonBody ?? ''),
                          )!
                          .toList(),
                      'ico') ??
                  true)
                wrapWithModel(
                  model: _model.addonComponentModel1,
                  updateCallback: () => setState(() {}),
                  child: AddonComponentWidget(
                    isNew: false,
                    title: FFLocalizations.of(context).getText(
                      '18og1hmx' /* ICO */,
                    ),
                    icon: Icon(
                      FFIcons.kbxsRocket1120119AM,
                      color: FlutterFlowTheme.of(context).iconsColor,
                    ),
                    action: () async {
                      if ((functions.siteSetting(FFAppState().Setting.toList(),
                                  'icoRestrictions') ==
                              'true') &&
                          (FFAppState().kycStatus != 'APPROVED')) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: const Text('ICO'),
                                content: const Text(
                                    'To access ICO services, it is mandatory to complete the (KYC) verification process beforehand.'),
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
                          'icoProjects',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.leftToRight,
                            ),
                          },
                        );
                      }
                    },
                  ),
                ),
              if (functions.extensionsVisibility(
                      SettingGroup.settingsCall
                          .extensions(
                            (_model.apiSettingResultC?.jsonBody ?? ''),
                          )!
                          .toList(),
                      'staking') ??
                  true)
                wrapWithModel(
                  model: _model.addonComponentModel2,
                  updateCallback: () => setState(() {}),
                  child: AddonComponentWidget(
                    isNew: false,
                    title: FFLocalizations.of(context).getText(
                      'k70v3fml' /* Staking */,
                    ),
                    icon: const Icon(
                      FFIcons.kphPiggyBankFill,
                    ),
                    action: () async {
                      if ((functions.siteSetting(FFAppState().Setting.toList(),
                                  'stakingRestrictions') ==
                              'true') &&
                          (FFAppState().kycStatus != 'APPROVED')) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: const Text('Staking'),
                                content: const Text(
                                    'To access Staking services, it is mandatory to complete the (KYC) verification process beforehand.'),
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
                          'stakeIndex',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.scale,
                              alignment: Alignment.bottomCenter,
                            ),
                          },
                        );
                      }
                    },
                  ),
                ),
              if (functions.extensionsVisibility(
                      SettingGroup.settingsCall
                          .extensions(
                            (_model.apiSettingResultC?.jsonBody ?? ''),
                          )!
                          .toList(),
                      'mlm') ??
                  true)
                Builder(
                  builder: (context) => wrapWithModel(
                    model: _model.addonComponentModel3,
                    updateCallback: () => setState(() {}),
                    child: AddonComponentWidget(
                      isNew: true,
                      title: FFLocalizations.of(context).getText(
                        'ctjpxt02' /* Referral */,
                      ),
                      icon: const Icon(
                        FFIcons.kmakiGift,
                      ),
                      action: () async {
                        _model.apiConditions =
                            await MlmGroup.conditionCall.call(
                          accesstoken: FFAppState().accesstoken,
                          csrftoken: FFAppState().csrftoken,
                          sessionid: FFAppState().sessionId,
                        );

                        if ((_model.apiConditions?.succeeded ?? true)) {
                          context.pushNamed(
                            'REFERRALS_MLM',
                            queryParameters: {
                              'conditions': serializeParam(
                                MlmGroup.conditionCall.list(
                                  (_model.apiConditions?.jsonBody ?? ''),
                                ),
                                ParamType.JSON,
                                isList: true,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 1.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: ToastWidget(
                                    success: false,
                                    message: getJsonField(
                                      (_model.apiConditions?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                  ),
                                ),
                              );
                            },
                          );
                        }

                        setState(() {});
                      },
                    ),
                  ),
                ),
              if (FFAppConstants.KYCStatus)
                wrapWithModel(
                  model: _model.addonComponentModel4,
                  updateCallback: () => setState(() {}),
                  child: AddonComponentWidget(
                    isNew: false,
                    title: FFLocalizations.of(context).getText(
                      'tec753e3' /* KYC */,
                    ),
                    icon: const Icon(
                      FFIcons.kmingcuteFingerprintFill1,
                    ),
                    action: () async {
                      context.goNamed(
                        'kycMain',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                          ),
                        },
                      );
                    },
                  ),
                ),
              if (functions.extensionsVisibility(
                      SettingGroup.settingsCall
                          .extensions(
                            (_model.apiSettingResultC?.jsonBody ?? ''),
                          )!
                          .toList(),
                      'p2p') ??
                  true)
                wrapWithModel(
                  model: _model.addonComponentModel5,
                  updateCallback: () => setState(() {}),
                  child: AddonComponentWidget(
                    isNew: false,
                    title: FFLocalizations.of(context).getText(
                      'rbvh38u7' /* P2P */,
                    ),
                    icon: const Icon(
                      FFIcons.kfluentPeopleSwap28Filled1,
                    ),
                    action: () async {
                      context.goNamed(
                        'p2pOffers',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                          ),
                        },
                      );
                    },
                  ),
                ),
              if (functions.extensionsVisibility(
                      SettingGroup.settingsCall
                          .extensions(
                            (_model.apiSettingResultC?.jsonBody ?? ''),
                          )!
                          .toList(),
                      'ecommerce') ??
                  true)
                wrapWithModel(
                  model: _model.addonComponentModel6,
                  updateCallback: () => setState(() {}),
                  child: AddonComponentWidget(
                    isNew: false,
                    title: FFLocalizations.of(context).getText(
                      's5ixtrgx' /* Shop */,
                    ),
                    icon: const Icon(
                      FFIcons.kstreamlineShoppingCartSubtractSolid,
                    ),
                    action: () async {
                      if ((functions.siteSetting(FFAppState().Setting.toList(),
                                  'ecommerceRestrictions') ==
                              'true') &&
                          (FFAppState().kycStatus != 'APPROVED')) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: const Text('ICO'),
                                content: const Text(
                                    'To access Ecommerce services, it is mandatory to complete the (KYC) verification process beforehand.'),
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
                          'eCommerceIndex',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.leftToRight,
                            ),
                          },
                        );
                      }
                    },
                  ),
                ),
              if (functions.extensionsVisibility(
                      SettingGroup.settingsCall
                          .extensions(
                            (_model.apiSettingResultC?.jsonBody ?? ''),
                          )!
                          .toList(),
                      'forex') ??
                  true)
                wrapWithModel(
                  model: _model.addonComponentModel7,
                  updateCallback: () => setState(() {}),
                  child: AddonComponentWidget(
                    isNew: false,
                    title: FFLocalizations.of(context).getText(
                      'jm7z40n2' /* Forex */,
                    ),
                    icon: const Icon(
                      FFIcons.ktokenBrandedForex,
                    ),
                    action: () async {
                      if ((functions.siteSetting(FFAppState().Setting.toList(),
                                  'forexRestrictions') ==
                              'true') &&
                          (FFAppState().kycStatus != 'APPROVED')) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: const Text('Forex'),
                                content: const Text(
                                    'To access Forex services, it is mandatory to complete the (KYC) verification process beforehand.'),
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
                        _model.apiforexaccountResult =
                            await ForexGroup.gETaccountCall.call(
                          accesstoken: FFAppState().accesstoken,
                          csrftoken: FFAppState().csrftoken,
                          sessionid: FFAppState().sessionId,
                        );

                        if ((_model.apiforexaccountResult?.succeeded ?? true)) {
                          if (ForexGroup.gETaccountCall.demoStatus(
                                (_model.apiforexaccountResult?.jsonBody ?? ''),
                              ) ==
                              true) {
                            context.goNamed(
                              'forexMain',
                              queryParameters: {
                                'json': serializeParam(
                                  ForexGroup.gETaccountCall.data(
                                    (_model.apiforexaccountResult?.jsonBody ??
                                        ''),
                                  ),
                                  ParamType.JSON,
                                ),
                                'accountID': serializeParam(
                                  ForexGroup.gETaccountCall.liveAccountID(
                                    (_model.apiforexaccountResult?.jsonBody ??
                                        ''),
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.leftToRight,
                                ),
                              },
                            );
                          } else {
                            context.goNamed(
                              'forexSplash',
                              queryParameters: {
                                'json': serializeParam(
                                  ForexGroup.gETaccountCall.data(
                                    (_model.apiforexaccountResult?.jsonBody ??
                                        ''),
                                  ),
                                  ParamType.JSON,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.leftToRight,
                                ),
                              },
                            );
                          }
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: const Text('FOREX'),
                                  content: const Text('NOT AVAILABLE '),
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
                        }
                      }

                      setState(() {});
                    },
                  ),
                ),
              wrapWithModel(
                model: _model.addonComponentModel8,
                updateCallback: () => setState(() {}),
                child: AddonComponentWidget(
                  isNew: false,
                  title: FFLocalizations.of(context).getText(
                    'ixbgfeoi' /* Investment */,
                  ),
                  icon: const Icon(
                    FFIcons.kmining,
                  ),
                  action: () async {
                    _model.apiInvestResult =
                        await InvestmrntGroup.gETinvestmentCall.call(
                      type: 'general',
                      accesstoken: FFAppState().accesstoken,
                      csrftoken: FFAppState().csrftoken,
                      sessionid: FFAppState().sessionId,
                    );

                    if ((_model.apiInvestResult?.succeeded ?? true)) {
                      context.goNamed(
                        'investmentSelectPlan',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                          ),
                        },
                      );
                    } else {
                      context.pushNamed('investmentIntro');
                    }

                    setState(() {});
                  },
                ),
              ),
              wrapWithModel(
                model: _model.addonComponentModel9,
                updateCallback: () => setState(() {}),
                child: AddonComponentWidget(
                  isNew: false,
                  title: FFLocalizations.of(context).getText(
                    '9vw3u3at' /* Blog */,
                  ),
                  icon: const FaIcon(
                    FontAwesomeIcons.bookReader,
                  ),
                  action: () async {
                    context.goNamed(
                      'blogMain',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                        ),
                      },
                    );
                  },
                ),
              ),
              wrapWithModel(
                model: _model.addonComponentModel10,
                updateCallback: () => setState(() {}),
                child: AddonComponentWidget(
                  isNew: false,
                  title: FFLocalizations.of(context).getText(
                    '9uyvxyel' /* Support */,
                  ),
                  icon: const Icon(
                    FFIcons.kfluentPersonSupport20Filled1,
                  ),
                  action: () async {
                    context.pushNamed('support_TicketList');
                  },
                ),
              ),
            ],
          ),
        if (!_model.addonsShow)
          GridView(
            padding: const EdgeInsets.fromLTRB(
              12.0,
              0,
              12.0,
              0,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation1']!),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation2']!),
                ].divide(const SizedBox(height: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation3']!),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation4']!),
                ].divide(const SizedBox(height: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation5']!),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation6']!),
                ].divide(const SizedBox(height: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation7']!),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation8']!),
                ].divide(const SizedBox(height: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation9']!),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation10']!),
                ].divide(const SizedBox(height: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation11']!),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation12']!),
                ].divide(const SizedBox(height: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation13']!),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation14']!),
                ].divide(const SizedBox(height: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      shape: BoxShape.circle,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation15']!),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternativ2,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation16']!),
                ].divide(const SizedBox(height: 12.0)),
              ),
            ],
          ),
      ],
    );
  }
}
