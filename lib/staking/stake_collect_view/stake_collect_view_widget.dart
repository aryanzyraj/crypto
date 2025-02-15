import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'stake_collect_view_model.dart';
export 'stake_collect_view_model.dart';

class StakeCollectViewWidget extends StatefulWidget {
  const StakeCollectViewWidget({
    super.key,
    required this.id,
    required this.duration,
    required this.interestRate,
  });

  final String? id;
  final int? duration;
  final int? interestRate;

  @override
  State<StakeCollectViewWidget> createState() => _StakeCollectViewWidgetState();
}

class _StakeCollectViewWidgetState extends State<StakeCollectViewWidget>
    with TickerProviderStateMixin {
  late StakeCollectViewModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StakeCollectViewModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
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
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
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
      'richTextOnPageLoadAnimation3': AnimationInfo(
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
      'rowOnPageLoadAnimation2': AnimationInfo(
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
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 450.ms),
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
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: StakingPoolsGroup.stakingLogIDCall.call(
        id: widget.id,
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
        final containerStakingLogIDResponse = snapshot.data!;

        return Container(
          height: 370.0,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.9,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                    child: Container(
                      width: 100.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryText,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation2']!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '8gz3cs7w' /* Amount */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: formatNumber(
                                            StakingPoolsGroup.stakingLogIDCall
                                                .amount(
                                              containerStakingLogIDResponse
                                                  .jsonBody,
                                            ),
                                            formatType: FormatType.compact,
                                          ),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
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
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'jrj3dz2x' /* Interest Rate */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: formatNumber(
                                            widget.interestRate,
                                            formatType: FormatType.percent,
                                          ),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .errorRed,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'richTextOnPageLoadAnimation2']!),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                              SizedBox(
                                height: 60.0,
                                child: VerticalDivider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '1ri5k0uf' /* Earning */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            formatNumber(
                                              (StakingPoolsGroup
                                                      .stakingLogIDCall
                                                      .amount(
                                                    containerStakingLogIDResponse
                                                        .jsonBody,
                                                  )!) *
                                                  ((widget.interestRate!) /
                                                      100.0),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            ),
                                            '0',
                                          ),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'richTextOnPageLoadAnimation3']!),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: StakingPoolsGroup.stakingLogIDCall
                                        .poolName(
                                      containerStakingLogIDResponse.jsonBody,
                                    )!,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Open Sans',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'n09t4b8i' /*  (  */,
                                    ),
                                    style: const TextStyle(),
                                  ),
                                  TextSpan(
                                    text: StakingPoolsGroup.stakingLogIDCall
                                        .poolCurrency(
                                      containerStakingLogIDResponse.jsonBody,
                                    )!,
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'd29n9z15' /*  ) */,
                                    ),
                                    style: const TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Open Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 5.0)),
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation']!),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'pfmy7xli' /* Min Amount */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: StakingPoolsGroup.stakingLogIDCall
                                          .poolMinStake(
                                            containerStakingLogIDResponse
                                                .jsonBody,
                                          )!
                                          .toString(),
                                      style: const TextStyle(),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '6shrumpl' /*   */,
                                      ),
                                      style: const TextStyle(),
                                    ),
                                    TextSpan(
                                      text: StakingPoolsGroup.stakingLogIDCall
                                          .poolCurrency(
                                        containerStakingLogIDResponse.jsonBody,
                                      )!,
                                      style: const TextStyle(),
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
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation1']!),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'xovhnfnz' /* Max Amount */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: formatNumber(
                                        StakingPoolsGroup.stakingLogIDCall
                                            .poolMaxStake(
                                          containerStakingLogIDResponse
                                              .jsonBody,
                                        ),
                                        formatType: FormatType.compact,
                                      ),
                                      style: const TextStyle(),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'gobal49k' /*   */,
                                      ),
                                      style: const TextStyle(),
                                    ),
                                    TextSpan(
                                      text: StakingPoolsGroup.stakingLogIDCall
                                          .poolCurrency(
                                        containerStakingLogIDResponse.jsonBody,
                                      )!,
                                      style: const TextStyle(),
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
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation2']!),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'oju1bqj7' /* Wallet Type */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                StakingPoolsGroup.stakingLogIDCall.poolType(
                                  containerStakingLogIDResponse.jsonBody,
                                )!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation3']!),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ge9uhxdc' /* Currency */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                StakingPoolsGroup.stakingLogIDCall.poolCurrency(
                                  containerStakingLogIDResponse.jsonBody,
                                )!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation4']!),
                        ].divide(const SizedBox(height: 5.0)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            HapticFeedback.lightImpact();
                            _model.apiPOSTinvestmentResult =
                                await StakingPoolsGroup.postCollectStakingCall
                                    .call(
                              id: widget.id,
                              accesstoken: FFAppState().accesstoken,
                              csrftoken: FFAppState().csrftoken,
                              sessionid: FFAppState().sessionId,
                            );

                            if ((_model.apiPOSTinvestmentResult?.succeeded ??
                                true)) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.apiPOSTinvestmentResult
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).success,
                                ),
                              );
                            } else {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.apiPOSTinvestmentResult
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).errorRed,
                                ),
                              );
                            }

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'xbkidynw' /* Collect */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).customColor2,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['buttonOnPageLoadAnimation']!),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!);
      },
    );
  }
}
