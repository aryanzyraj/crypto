import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'kyc_main_model.dart';
export 'kyc_main_model.dart';

class KycMainWidget extends StatefulWidget {
  const KycMainWidget({super.key});

  @override
  State<KycMainWidget> createState() => _KycMainWidgetState();
}

class _KycMainWidgetState extends State<KycMainWidget>
    with TickerProviderStateMixin {
  late KycMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KycMainModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isOrderBookOpen = false;
      FFAppState().isWebSocketOpen = false;
    });

    animationsMap.addAll({
      'progressBarOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0, 0.349),
            end: const Offset(0, 0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: const Offset(20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 300.0.ms,
            begin: const Offset(20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'conditionalBuilderOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(1.4, 1.4),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: -220.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: -220.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.4, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: -220.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: -220.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.4, 0.0),
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
      future: (_model.apiRequestCompleter2 ??= Completer<ApiCallResponse>()
            ..complete(KycGroup.gETkycTemplateCall.call(
              accesstoken: FFAppState().accesstoken,
              csrftoken: FFAppState().csrftoken,
              sessionid: FFAppState().sessionId,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            body: const LoadingWidget(
              dimension: 150,
            ),
          );
        }
        final kycMainGETkycTemplateResponse = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          body: FutureBuilder<ApiCallResponse>(
            future:
                (_model.apiRequestCompleter1 ??= Completer<ApiCallResponse>()
                      ..complete(AuthinticationGroup.getProfileCall.call(
                        accesstoken: FFAppState().accesstoken,
                        csrftoken: FFAppState().csrftoken,
                        sessionid: FFAppState().sessionId,
                      )))
                    .future,
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return const LoadingWidget(
                  dimension: 150,
                );
              }
              final columnGetProfileResponse = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.sizeOf(context).height * 0.84,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 44.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ejpfl0sb' /* KYC */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    AlignedTooltip(
                                      content: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '9kotdj1z' /* To comply with regulations, ea... */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Open Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      offset: 4.0,
                                      preferredDirection: AxisDirection.down,
                                      borderRadius: BorderRadius.circular(8.0),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).grayDark,
                                      elevation: 4.0,
                                      tailBaseWidth: 24.0,
                                      tailLength: 12.0,
                                      waitDuration: const Duration(milliseconds: 100),
                                      showDuration:
                                          const Duration(milliseconds: 1500),
                                      triggerMode: TooltipTriggerMode.tap,
                                      child: FaIcon(
                                        FontAwesomeIcons.questionCircle,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      Icons.arrow_back_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 25.0,
                                    ),
                                    onPressed: () async {
                                      context.goNamed(
                                        'BicryptoHomePage',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 40.0, 12.0, 40.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(),
                                              child: LinearPercentIndicator(
                                                percent:
                                                    functions.kycProgressBar(
                                                        functions.kycMaxlevel(
                                                            kycMainGETkycTemplateResponse
                                                                .jsonBody),
                                                        AuthinticationGroup
                                                            .getProfileCall
                                                            .kycLevel(
                                                          columnGetProfileResponse
                                                              .jsonBody,
                                                        ),
                                                        AuthinticationGroup
                                                            .getProfileCall
                                                            .kycStatus(
                                                          columnGetProfileResponse
                                                              .jsonBody,
                                                        )),
                                                lineHeight: 16.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                barRadius:
                                                    const Radius.circular(20.0),
                                                padding: EdgeInsets.zero,
                                              ).animateOnPageLoad(animationsMap[
                                                  'progressBarOnPageLoadAnimation']!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          if ((functions.kycMaxlevel(kycMainGETkycTemplateResponse.jsonBody).toString() == '3') ||
                                              (functions
                                                      .kycMaxlevel(
                                                          kycMainGETkycTemplateResponse
                                                              .jsonBody)
                                                      .toString() ==
                                                  '2') ||
                                              (functions
                                                      .kycMaxlevel(
                                                          kycMainGETkycTemplateResponse
                                                              .jsonBody)
                                                      .toString() ==
                                                  '1'))
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                6.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'gxzjaix3' /* Level */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'ekjr8wxf' /* 1 */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayLight,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(1.0),
                                                    child: Container(
                                                      width: 15.0,
                                                      height: 15.0,
                                                      decoration: BoxDecoration(
                                                        color: functions
                                                                .kycContainerLevel(
                                                                    functions.kycMaxlevel(
                                                                        kycMainGETkycTemplateResponse
                                                                            .jsonBody),
                                                                    'first',
                                                                    AuthinticationGroup
                                                                        .getProfileCall
                                                                        .kycLevel(
                                                                      columnGetProfileResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    AuthinticationGroup
                                                                        .getProfileCall
                                                                        .kycStatus(
                                                                      columnGetProfileResponse
                                                                          .jsonBody,
                                                                    ))
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 5.0)),
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation1']!),
                                          if ((functions
                                                      .kycMaxlevel(
                                                          kycMainGETkycTemplateResponse
                                                              .jsonBody)
                                                      .toString() ==
                                                  '3') ||
                                              (functions
                                                      .kycMaxlevel(
                                                          kycMainGETkycTemplateResponse
                                                              .jsonBody)
                                                      .toString() ==
                                                  '2'))
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                6.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'i11yn84f' /* Level */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'lo5vgm19' /* 2 */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayLight,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(1.0),
                                                    child: Container(
                                                      width: 15.0,
                                                      height: 15.0,
                                                      decoration: BoxDecoration(
                                                        color: functions
                                                                .kycContainerLevel(
                                                                    functions.kycMaxlevel(
                                                                        kycMainGETkycTemplateResponse
                                                                            .jsonBody),
                                                                    'second',
                                                                    AuthinticationGroup
                                                                        .getProfileCall
                                                                        .kycLevel(
                                                                      columnGetProfileResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    AuthinticationGroup
                                                                        .getProfileCall
                                                                        .kycStatus(
                                                                      columnGetProfileResponse
                                                                          .jsonBody,
                                                                    ))
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 5.0)),
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation2']!),
                                          if (functions
                                                  .kycMaxlevel(
                                                      kycMainGETkycTemplateResponse
                                                          .jsonBody)
                                                  .toString() ==
                                              '3')
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor11,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                6.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              't9eao1fw' /* Level */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor11,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'l0qog37w' /* 3 */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayLight,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(1.0),
                                                    child: Container(
                                                      width: 15.0,
                                                      height: 15.0,
                                                      decoration: BoxDecoration(
                                                        color: functions
                                                                .kycContainerLevel(
                                                                    functions
                                                                        .kycMaxlevel(
                                                                            getJsonField(
                                                                      kycMainGETkycTemplateResponse
                                                                          .jsonBody,
                                                                      r'''$''',
                                                                    )),
                                                                    'third',
                                                                    AuthinticationGroup
                                                                        .getProfileCall
                                                                        .kycLevel(
                                                                      columnGetProfileResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    AuthinticationGroup
                                                                        .getProfileCall
                                                                        .kycStatus(
                                                                      columnGetProfileResponse
                                                                          .jsonBody,
                                                                    ))
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor11
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 5.0)),
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation3']!),
                                        ],
                                      ),
                                    ],
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (AuthinticationGroup.getProfileCall
                                        .kycStatus(
                                      columnGetProfileResponse.jsonBody,
                                    ) ==
                                    'PENDING') {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .grayLight,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  child: RiveAnimation.asset(
                                                    'assets/rive_animations/loading_circle.riv',
                                                    artboard: 'New Artboard',
                                                    fit: BoxFit.cover,
                                                    controllers: _model
                                                        .riveAnimationControllers1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ty8k2z6q' /* Your identity verification is ... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '3oqneh9i' /* We are still working on your i... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (AuthinticationGroup.getProfileCall
                                        .kycStatus(
                                      columnGetProfileResponse.jsonBody,
                                    ) ==
                                    'APPROVED') {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .grayLight,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  child: RiveAnimation.asset(
                                                    'assets/rive_animations/success.riv',
                                                    artboard: 'success.json',
                                                    fit: BoxFit.cover,
                                                    controllers: _model
                                                        .riveAnimationControllers2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'uhuqxzdr' /* Your identity has been verifie... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'qapf1rzr' /* One of our team members has ve... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (AuthinticationGroup.getProfileCall
                                        .kycStatus(
                                      columnGetProfileResponse.jsonBody,
                                    ) ==
                                    'REJECTED') {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .grayLight,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.warning_amber_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .errorRed,
                                                  size: 80.0,
                                                ).animateOnPageLoad(animationsMap[
                                                    'iconOnPageLoadAnimation']!),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'zoei8hee' /* Sorry! Your application was re... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .errorRed,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'f3nhf7mm' /* In our verification process, w... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .grayLight,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  child: RiveAnimation.asset(
                                                    'assets/rive_animations/warning_icon_(2).riv',
                                                    artboard: 'Artboard',
                                                    fit: BoxFit.cover,
                                                    controllers: _model
                                                        .riveAnimationControllers3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'qsmvrwl9' /* You have not submitted your ne... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ).animateOnPageLoad(animationsMap[
                                'conditionalBuilderOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (functions.kycSubmitBTN(
                                        functions.kycMaxlevel(getJsonField(
                                          kycMainGETkycTemplateResponse
                                              .jsonBody,
                                          r'''$''',
                                        )),
                                        AuthinticationGroup.getProfileCall
                                            .kycStatus(
                                          columnGetProfileResponse.jsonBody,
                                        ),
                                        AuthinticationGroup.getProfileCall
                                            .kycLevel(
                                          columnGetProfileResponse.jsonBody,
                                        )) ==
                                    'KYC Completed') {
                                  return Text(
                                    FFLocalizations.of(context).getText(
                                      '978c3r4n' /* KYC Completed */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  );
                                } else if ((functions.kycSubmitBTN(
                                            functions.kycMaxlevel(getJsonField(
                                              kycMainGETkycTemplateResponse
                                                  .jsonBody,
                                              r'''$''',
                                            )),
                                            AuthinticationGroup.getProfileCall
                                                .kycStatus(
                                              columnGetProfileResponse.jsonBody,
                                            ),
                                            AuthinticationGroup.getProfileCall
                                                .kycLevel(
                                              columnGetProfileResponse.jsonBody,
                                            )) !=
                                        'KYC Completed') &&
                                    (functions.kycSubmitBTN(
                                            functions.kycMaxlevel(getJsonField(
                                              kycMainGETkycTemplateResponse
                                                  .jsonBody,
                                              r'''$''',
                                            )),
                                            AuthinticationGroup.getProfileCall
                                                .kycStatus(
                                              columnGetProfileResponse.jsonBody,
                                            ),
                                            AuthinticationGroup.getProfileCall
                                                .kycLevel(
                                              columnGetProfileResponse.jsonBody,
                                            )) !=
                                        'Pending')) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          HapticFeedback.lightImpact();

                                          context.pushNamed(
                                            'kycForm',
                                            queryParameters: {
                                              'level': serializeParam(
                                                () {
                                                  if ((AuthinticationGroup
                                                              .getProfileCall
                                                              .kycLevel(
                                                            columnGetProfileResponse
                                                                .jsonBody,
                                                          ) ==
                                                          2) &&
                                                      (AuthinticationGroup
                                                              .getProfileCall
                                                              .kycStatus(
                                                            columnGetProfileResponse
                                                                .jsonBody,
                                                          ) ==
                                                          'APPROVED')) {
                                                    return 3;
                                                  } else if ((AuthinticationGroup
                                                              .getProfileCall
                                                              .kycLevel(
                                                            columnGetProfileResponse
                                                                .jsonBody,
                                                          ) ==
                                                          2) &&
                                                      (AuthinticationGroup
                                                              .getProfileCall
                                                              .kycStatus(
                                                            columnGetProfileResponse
                                                                .jsonBody,
                                                          ) ==
                                                          'REJECTED')) {
                                                    return 2;
                                                  } else if ((AuthinticationGroup
                                                              .getProfileCall
                                                              .kycLevel(
                                                            columnGetProfileResponse
                                                                .jsonBody,
                                                          ) ==
                                                          1) &&
                                                      (AuthinticationGroup
                                                              .getProfileCall
                                                              .kycStatus(
                                                            columnGetProfileResponse
                                                                .jsonBody,
                                                          ) ==
                                                          'APPROVED')) {
                                                    return 2;
                                                  } else if ((AuthinticationGroup
                                                              .getProfileCall
                                                              .kycLevel(
                                                            columnGetProfileResponse
                                                                .jsonBody,
                                                          ) ==
                                                          1) &&
                                                      (AuthinticationGroup
                                                              .getProfileCall
                                                              .kycStatus(
                                                            columnGetProfileResponse
                                                                .jsonBody,
                                                          ) ==
                                                          'REJECTED')) {
                                                    return 1;
                                                  } else {
                                                    return 1;
                                                  }
                                                }(),
                                                ParamType.int,
                                              ),
                                              'template': serializeParam(
                                                kycMainGETkycTemplateResponse
                                                    .jsonBody,
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .bottomToTop,
                                                duration:
                                                    Duration(milliseconds: 220),
                                              ),
                                            },
                                          );
                                        },
                                        text: functions.kycSubmitBTN(
                                            functions.kycMaxlevel(
                                                kycMainGETkycTemplateResponse
                                                    .jsonBody),
                                            AuthinticationGroup.getProfileCall
                                                .kycStatus(
                                              columnGetProfileResponse.jsonBody,
                                            ),
                                            AuthinticationGroup.getProfileCall
                                                .kycLevel(
                                              columnGetProfileResponse.jsonBody,
                                            )),
                                        options: FFButtonOptions(
                                          width: 300.0,
                                          height: 70.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '7a1d4ph3' /* Tap above to complete KYC */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: const Color(0x43000000),
                                              letterSpacing: 0.0,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation']!),
                                    ],
                                  );
                                } else if (functions.kycSubmitBTN(
                                        functions.kycMaxlevel(getJsonField(
                                          kycMainGETkycTemplateResponse
                                              .jsonBody,
                                          r'''$''',
                                        )),
                                        AuthinticationGroup.getProfileCall
                                            .kycStatus(
                                          columnGetProfileResponse.jsonBody,
                                        ),
                                        AuthinticationGroup.getProfileCall
                                            .kycLevel(
                                          columnGetProfileResponse.jsonBody,
                                        )) ==
                                    'Pending') {
                                  return FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 80.0,
                                    icon: Icon(
                                      Icons.refresh_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                      size: 60.0,
                                    ),
                                    showLoadingIndicator: true,
                                    onPressed: () async {
                                      setState(() =>
                                          _model.apiRequestCompleter2 = null);
                                      await _model
                                          .waitForApiRequestCompleted2();
                                      setState(() =>
                                          _model.apiRequestCompleter1 = null);
                                      await _model
                                          .waitForApiRequestCompleted1();
                                      _model.update = !_model.update;
                                      setState(() {});
                                    },
                                  );
                                } else {
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      HapticFeedback.lightImpact();

                                      context.pushNamed(
                                        'kycForm',
                                        queryParameters: {
                                          'level': serializeParam(
                                            () {
                                              if ((AuthinticationGroup
                                                          .getProfileCall
                                                          .kycLevel(
                                                        columnGetProfileResponse
                                                            .jsonBody,
                                                      ) ==
                                                      2) &&
                                                  (AuthinticationGroup
                                                          .getProfileCall
                                                          .kycStatus(
                                                        columnGetProfileResponse
                                                            .jsonBody,
                                                      ) ==
                                                      'APPROVED')) {
                                                return 3;
                                              } else if ((AuthinticationGroup
                                                          .getProfileCall
                                                          .kycLevel(
                                                        columnGetProfileResponse
                                                            .jsonBody,
                                                      ) ==
                                                      2) &&
                                                  (AuthinticationGroup
                                                          .getProfileCall
                                                          .kycStatus(
                                                        columnGetProfileResponse
                                                            .jsonBody,
                                                      ) ==
                                                      'REJECTED')) {
                                                return 2;
                                              } else if ((AuthinticationGroup
                                                          .getProfileCall
                                                          .kycLevel(
                                                        columnGetProfileResponse
                                                            .jsonBody,
                                                      ) ==
                                                      1) &&
                                                  (AuthinticationGroup
                                                          .getProfileCall
                                                          .kycStatus(
                                                        columnGetProfileResponse
                                                            .jsonBody,
                                                      ) ==
                                                      'APPROVED')) {
                                                return 2;
                                              } else if ((AuthinticationGroup
                                                          .getProfileCall
                                                          .kycLevel(
                                                        columnGetProfileResponse
                                                            .jsonBody,
                                                      ) ==
                                                      1) &&
                                                  (AuthinticationGroup
                                                          .getProfileCall
                                                          .kycStatus(
                                                        columnGetProfileResponse
                                                            .jsonBody,
                                                      ) ==
                                                      'REJECTED')) {
                                                return 1;
                                              } else {
                                                return 1;
                                              }
                                            }(),
                                            ParamType.int,
                                          ),
                                          'template': serializeParam(
                                            kycMainGETkycTemplateResponse
                                                .jsonBody,
                                            ParamType.JSON,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                            duration:
                                                Duration(milliseconds: 220),
                                          ),
                                        },
                                      );
                                    },
                                    text: functions.kycSubmitBTN(
                                        functions.kycMaxlevel(
                                            kycMainGETkycTemplateResponse
                                                .jsonBody),
                                        AuthinticationGroup.getProfileCall
                                            .kycStatus(
                                          columnGetProfileResponse.jsonBody,
                                        ),
                                        AuthinticationGroup.getProfileCall
                                            .kycLevel(
                                          columnGetProfileResponse.jsonBody,
                                        )),
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 70.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .textColor,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation']!),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
