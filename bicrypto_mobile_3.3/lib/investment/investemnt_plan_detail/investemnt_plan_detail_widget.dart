import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'investemnt_plan_detail_model.dart';
export 'investemnt_plan_detail_model.dart';

class InvestemntPlanDetailWidget extends StatefulWidget {
  const InvestemntPlanDetailWidget({super.key});

  @override
  State<InvestemntPlanDetailWidget> createState() =>
      _InvestemntPlanDetailWidgetState();
}

class _InvestemntPlanDetailWidgetState extends State<InvestemntPlanDetailWidget>
    with TickerProviderStateMixin {
  late InvestemntPlanDetailModel _model;

  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvestemntPlanDetailModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 37.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'richTextOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'richTextOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 250.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 29.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 2.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 270.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 270.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 270.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 270.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 270.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 270.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 450.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 450.0.ms,
            duration: 600.0.ms,
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

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['containerOnPageLoadAnimation']!
          .controller
          .forward(from: 0.0);
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

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: FutureBuilder<ApiCallResponse>(
        future: InvestmrntGroup.gETinvestmentCall.call(
          type: 'general',
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
          final mainContainerGETinvestmentResponse = snapshot.data!;

          return Container(
            height: MediaQuery.sizeOf(context).height * 0.85,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            child: FutureBuilder<ApiCallResponse>(
              future: InvestmrntGroup.gETuserInvestmentCall.call(
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
                final columnGETuserInvestmentResponse = snapshot.data!;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      InvestmrntGroup.gETuserInvestmentCall
                                          .title(
                                        columnGETuserInvestmentResponse
                                            .jsonBody,
                                      )!,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Open Sans',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.close,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        HapticFeedback.lightImpact();
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'rl5ph2ig' /* INVEST */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: InvestmrntGroup
                                                      .gETinvestmentCall
                                                      .amount(
                                                        mainContainerGETinvestmentResponse
                                                            .jsonBody,
                                                      )!
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .errorRed,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '138b8osq' /*   */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .errorRed,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: InvestmrntGroup
                                                      .gETuserInvestmentCall
                                                      .currency(
                                                    columnGETuserInvestmentResponse
                                                        .jsonBody,
                                                  )!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .errorRed,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'richTextOnPageLoadAnimation1']!),
                                        ].divide(const SizedBox(height: 16.0)),
                                      ),
                                      SizedBox(
                                        height: 60.0,
                                        child: VerticalDivider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'v56tv5o2' /* ROI */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: getJsonField(
                                                    mainContainerGETinvestmentResponse
                                                        .jsonBody,
                                                    r'''$.profit''',
                                                  ).toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'tuccnwom' /*   */,
                                                  ),
                                                  style: const TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: InvestmrntGroup
                                                      .gETuserInvestmentCall
                                                      .currency(
                                                    columnGETuserInvestmentResponse
                                                        .jsonBody,
                                                  )!,
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'richTextOnPageLoadAnimation2']!),
                                        ].divide(const SizedBox(height: 16.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            InvestmrntGroup.gETinvestmentCall
                                                .status(
                                              mainContainerGETinvestmentResponse
                                                  .jsonBody,
                                            )!,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 5.0)),
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 30.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularPercentIndicator(
                                          percent: functions.forexProgress(
                                              getJsonField(
                                                mainContainerGETinvestmentResponse
                                                    .jsonBody,
                                                r'''$.createdAt''',
                                              ).toString(),
                                              InvestmrntGroup.gETinvestmentCall
                                                  .enddate(
                                                mainContainerGETinvestmentResponse
                                                    .jsonBody,
                                              )!),
                                          radius: 90.0,
                                          lineWidth: 18.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          center: Text(
                                            'Progress: ${(functions.forexProgress(getJsonField(
                                                  mainContainerGETinvestmentResponse
                                                      .jsonBody,
                                                  r'''$.createdAt''',
                                                ).toString(), InvestmrntGroup.gETinvestmentCall.enddate(
                                                  mainContainerGETinvestmentResponse
                                                      .jsonBody,
                                                )!) * 100).toString()}%',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'rowOnPageLoadAnimation1']!),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '32rgs7h4' /* Ends In : */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 170.0,
                                          height: 30.0,
                                          child: custom_widgets.TimerCountDown(
                                            width: 170.0,
                                            height: 30.0,
                                            seconds:
                                                functions.forexTimeLeftInSecond(
                                                    getJsonField(
                                                      mainContainerGETinvestmentResponse
                                                          .jsonBody,
                                                      r'''$.createdAt''',
                                                    ).toString(),
                                                    InvestmrntGroup
                                                        .gETinvestmentCall
                                                        .enddate(
                                                      mainContainerGETinvestmentResponse
                                                          .jsonBody,
                                                    )!),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 22.0,
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 10.0)),
                                    ).animateOnPageLoad(animationsMap[
                                        'rowOnPageLoadAnimation2']!),
                                  ].divide(const SizedBox(height: 5.0)),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'a27y2zm7' /* Duration: */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '${InvestmrntGroup.gETinvestmentCall.duartion(
                                              mainContainerGETinvestmentResponse
                                                  .jsonBody,
                                            )?.toString()} ${InvestmrntGroup.gETinvestmentCall.durationtimeframe(
                                          mainContainerGETinvestmentResponse
                                              .jsonBody,
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'rowOnPageLoadAnimation3']!),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'g57nouwh' /* Amount:  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '${InvestmrntGroup.gETinvestmentCall.amount(
                                              mainContainerGETinvestmentResponse
                                                  .jsonBody,
                                            )?.toString()} ${InvestmrntGroup.gETuserInvestmentCall.currency(
                                          columnGETuserInvestmentResponse
                                              .jsonBody,
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'rowOnPageLoadAnimation4']!),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'v16cl7a0' /* Return of Investment: */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        getJsonField(
                                          mainContainerGETinvestmentResponse
                                              .jsonBody,
                                          r'''$.profit''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ).animateOnPageLoad(animationsMap[
                                      'rowOnPageLoadAnimation5']!),
                                ].divide(const SizedBox(height: 5.0)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  HapticFeedback.lightImpact();
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: const Text(
                                                                      'Cancel Forex Plan'),
                                                                  content: const Text(
                                                                      'Do you really want to cancel your investment? This process cannot be undone. '),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: const Text(
                                                                          'Cancel'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: const Text(
                                                                          'Confirm'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    _model.apiCancelResult =
                                                        await InvestmrntGroup
                                                            .deleteInvestmentCall
                                                            .call(
                                                      id: getJsonField(
                                                        mainContainerGETinvestmentResponse
                                                            .jsonBody,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      type: 'general',
                                                      accesstoken: FFAppState()
                                                          .accesstoken,
                                                      csrftoken: FFAppState()
                                                          .accesstoken,
                                                      sessionid: FFAppState()
                                                          .sessionId,
                                                    );

                                                    if ((_model.apiCancelResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      Navigator.pop(context);

                                                      context.pushNamed(
                                                        'investmentSelectPlan',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Investment Cancelled Successfully',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                        ),
                                                      );
                                                    } else {
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            getJsonField(
                                                              (_model.apiCancelResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.message''',
                                                            ).toString(),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .errorRed,
                                                        ),
                                                      );
                                                    }
                                                  }

                                                  setState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '7cu4i7na' /* Cancel Investment */,
                                                ),
                                                icon: const Icon(
                                                  Icons.cancel_outlined,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 45.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor8,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .errorRed,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ).animateOnPageLoad(animationsMap[
                                          'rowOnPageLoadAnimation6']!),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  HapticFeedback.lightImpact();
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '1fgubwxv' /* Withdraw Profit */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 45.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .exchangeGreenLight,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .exchangeGreen,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ).animateOnPageLoad(animationsMap[
                                          'rowOnPageLoadAnimation7']!),
                                    ),
                                  ].divide(const SizedBox(height: 10.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
              .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!)
              .animateOnActionTrigger(
                  animationsMap['containerOnActionTriggerAnimation']!,
                  hasBeenTriggered: hasContainerTriggered);
        },
      ),
    );
  }
}
