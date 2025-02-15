import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'investment_my_plan_detail_model.dart';
export 'investment_my_plan_detail_model.dart';

class InvestmentMyPlanDetailWidget extends StatefulWidget {
  const InvestmentMyPlanDetailWidget({
    super.key,
    required this.currency,
    required this.title,
  });

  final String? currency;
  final String? title;

  @override
  State<InvestmentMyPlanDetailWidget> createState() =>
      _InvestmentMyPlanDetailWidgetState();
}

class _InvestmentMyPlanDetailWidgetState
    extends State<InvestmentMyPlanDetailWidget> with TickerProviderStateMixin {
  late InvestmentMyPlanDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvestmentMyPlanDetailModel());

    animationsMap.addAll({
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
          VisibilityEffect(duration: 350.ms),
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 2.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 29.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 29.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 320.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 320.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 29.0),
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
      future: InvestmrntGroup.gETinvestmentCall.call(
        type: 'general',
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
        final investmentMyPlanDetailGETinvestmentResponse = snapshot.data!;

        return GestureDetector(
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
                  context.pushNamed('investmentSelectPlan');
                },
              ),
              title: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '40dt5476' /* Plan Detail */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              percent: functions.investmentProgress(
                                  InvestmrntGroup.gETinvestmentCall.createdAt(
                                    investmentMyPlanDetailGETinvestmentResponse
                                        .jsonBody,
                                  )!,
                                  InvestmrntGroup.gETinvestmentCall.duartion(
                                    investmentMyPlanDetailGETinvestmentResponse
                                        .jsonBody,
                                  )!),
                              radius: 90.0,
                              lineWidth: 18.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              center: Text(
                                'Progress: ${(functions.investmentProgress(InvestmrntGroup.gETinvestmentCall.createdAt(
                                      investmentMyPlanDetailGETinvestmentResponse
                                          .jsonBody,
                                    )!, InvestmrntGroup.gETinvestmentCall.duartion(
                                      investmentMyPlanDetailGETinvestmentResponse
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
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation1']!),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '3rk40w0n' /* Ends In : */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
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
                                seconds: functions.investmentTimeLeftInSecond(
                                    InvestmrntGroup.gETinvestmentCall.createdAt(
                                      investmentMyPlanDetailGETinvestmentResponse
                                          .jsonBody,
                                    )!,
                                    InvestmrntGroup.gETinvestmentCall.duartion(
                                      investmentMyPlanDetailGETinvestmentResponse
                                          .jsonBody,
                                    )!),
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 22.0,
                              ),
                            ),
                          ].divide(const SizedBox(width: 10.0)),
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation2']!),
                      ].divide(const SizedBox(height: 5.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 10.0, 5.0, 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'otqb3alm' /* Invested Amount : */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                                        investmentMyPlanDetailGETinvestmentResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ptd6ut46' /*   */,
                                                  ),
                                                  style: const TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: widget.currency!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'yf399jpv' /* Profit :  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                                      .profit(
                                                        investmentMyPlanDetailGETinvestmentResponse
                                                            .jsonBody,
                                                      )!
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '94vc3q5q' /*   */,
                                                  ),
                                                  style: const TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: widget.currency!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 5.0)),
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation3']!),
                      ].divide(const SizedBox(height: 5.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title:
                                                const Text('Cancel Investment Plan'),
                                            content: const Text(
                                                'Do you really want to cancel your investment plan? This process cannot be undone. '),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: const Text('Confirm'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  _model.apiCancelPlanResult =
                                      await InvestmrntGroup.deleteInvestmentCall
                                          .call(
                                    id: InvestmrntGroup.gETinvestmentCall
                                        .planid(
                                      investmentMyPlanDetailGETinvestmentResponse
                                          .jsonBody,
                                    ),
                                    type: 'general',
                                    accesstoken: FFAppState().accesstoken,
                                    csrftoken: FFAppState().csrftoken,
                                    sessionid: FFAppState().sessionId,
                                  );

                                  if ((_model.apiCancelPlanResult?.succeeded ??
                                      true)) {
                                    context.goNamed('investmentSelectPlan');

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Plan Is Cancelled',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor1,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.apiCancelPlanResult
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.message''',
                                          ).toString(),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .customColor8,
                                      ),
                                    );
                                  }
                                }

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '7x4uszo7' /* Cancel */,
                              ),
                              icon: const Icon(
                                Icons.cancel_outlined,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 45.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).customColor8,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).errorRed,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation1']!),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.goNamed('investmentSelectPlan');
                              },
                              text: FFLocalizations.of(context).getText(
                                '44qb8a1c' /* Widraw profit */,
                              ),
                              icon: const Icon(
                                Icons.download_rounded,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 45.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).customColor2,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation2']!),
                          ),
                        ),
                      ].divide(const SizedBox(width: 20.0)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
