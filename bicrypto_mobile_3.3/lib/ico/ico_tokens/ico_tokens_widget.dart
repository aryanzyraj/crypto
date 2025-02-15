import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'ico_tokens_model.dart';
export 'ico_tokens_model.dart';

class IcoTokensWidget extends StatefulWidget {
  const IcoTokensWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<IcoTokensWidget> createState() => _IcoTokensWidgetState();
}

class _IcoTokensWidgetState extends State<IcoTokensWidget>
    with TickerProviderStateMixin {
  late IcoTokensModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IcoTokensModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
      'circleImageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 2.0,
          ),
        ],
      ),
      'circleImageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 2.0,
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
      future: IcoGroup.icoProjectIDCall.call(
        id: widget.id,
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
        final icoTokensIcoProjectIDResponse = snapshot.data!;

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
                      'regvn156' /* Tokens */,
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
                      color: FlutterFlowTheme.of(context).secondaryText,
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
                        final tokensList = IcoGroup.icoProjectIDCall
                                .tokens(
                                  icoTokensIcoProjectIDResponse.jsonBody,
                                )
                                ?.toList() ??
                            [];
                        if (tokensList.isEmpty) {
                          return const EmptyStateSimpleWidget(
                            icon: Icon(
                              Icons.token,
                              size: 70.0,
                            ),
                            title: 'No Tokens',
                            body: 'There are no tokens yet..',
                          );
                        }

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: tokensList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                          itemBuilder: (context, tokensListIndex) {
                            final tokensListItem = tokensList[tokensListIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 6.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    if (getJsonField(
                                                          tokensListItem,
                                                          r'''$.image''',
                                                        ) !=
                                                        null) {
                                                      return Container(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          '${FFAppConstants.Domain}${getJsonField(
                                                            tokensListItem,
                                                            r'''$.image''',
                                                          ).toString()}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'circleImageOnPageLoadAnimation1']!);
                                                    } else {
                                                      return Container(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          'https://images.unsplash.com/photo-1543083115-638c32cd3d58?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxzY2klMjBmaXxlbnwwfHx8fDE3MDg3MjA3MjB8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'circleImageOnPageLoadAnimation2']!);
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: getJsonField(
                                                          tokensListItem,
                                                          r'''$.currency''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'aeygm0xq' /*  -  */,
                                                        ),
                                                        style: const TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text: getJsonField(
                                                          tokensListItem,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'b2gs29c4' /* Ends at :  */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text: functions
                                                            .formatDatatoyearmonthday(
                                                                getJsonField(
                                                          tokensListItem,
                                                          r'''$.phases[:].endDate''',
                                                        ).toString()),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child:
                                                            LinearPercentIndicator(
                                                          percent: getJsonField(
                                                                tokensListItem,
                                                                r'''$.phases[:].contributionPercentage''',
                                                              ) /
                                                              100.0,
                                                          lineHeight: 15.0,
                                                          animation: true,
                                                          animateFromLastPercent:
                                                              true,
                                                          progressColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent4,
                                                          center: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '${getJsonField(
                                                                tokensListItem,
                                                                r'''$.phases[?(@.status == 'ACTIVE')].contributionPercentage''',
                                                              ).toString()}%',
                                                              '0%',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          barRadius:
                                                              const Radius.circular(
                                                                  4.0),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: 30.0,
                                                    child: custom_widgets
                                                        .TimerCountDown(
                                                      width: double.infinity,
                                                      height: 30.0,
                                                      seconds:
                                                          functions.icoTimeLeft(
                                                              getJsonField(
                                                        tokensListItem,
                                                        r'''$.phases[:].endDate''',
                                                      ).toString()),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                HapticFeedback.lightImpact();

                                                context.pushNamed(
                                                  'icoOfferDetail',
                                                  queryParameters: {
                                                    'id': serializeParam(
                                                      getJsonField(
                                                        tokensListItem,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'walletType':
                                                        serializeParam(
                                                      getJsonField(
                                                        tokensListItem,
                                                        r'''$.purchaseWalletType''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'currency': serializeParam(
                                                      getJsonField(
                                                        tokensListItem,
                                                        r'''$.purchaseCurrency''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'cmgycbjp' /* View Offering */,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor1,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            );
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
