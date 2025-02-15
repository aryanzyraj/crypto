import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'p2p_review_model.dart';
export 'p2p_review_model.dart';

class P2pReviewWidget extends StatefulWidget {
  const P2pReviewWidget({
    super.key,
    required this.uuid,
  });

  final String? uuid;

  @override
  State<P2pReviewWidget> createState() => _P2pReviewWidgetState();
}

class _P2pReviewWidgetState extends State<P2pReviewWidget>
    with TickerProviderStateMixin {
  late P2pReviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P2pReviewModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-40.0, 0.0),
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
            begin: const Offset(40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 26.0),
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
      future: PeerToPeerGroup.gETofferIDCall.call(
        id: widget.uuid,
        sessionid: FFAppState().sessionId,
        csrftoken: FFAppState().csrftoken,
        accesstoken: FFAppState().accesstoken,
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
        final p2pReviewGETofferIDResponse = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              buttonSize: 46.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 25.0,
              ),
              onPressed: () async {
                context.pop();
              },
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color(0x39000000),
                        offset: Offset(
                          0.0,
                          1.0,
                        ),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Text(
                                  (PeerToPeerGroup.gETofferIDCall
                                                  .listJasonReview(
                                                    p2pReviewGETofferIDResponse
                                                        .jsonBody,
                                                  )
                                                  ?.length ==
                                              functions.alwaysReturnNull()
                                          ? 0
                                          : PeerToPeerGroup.gETofferIDCall
                                              .listJasonReview(
                                                p2pReviewGETofferIDResponse
                                                    .jsonBody,
                                              )!
                                              .length)
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        fontSize: 28.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '04lpb1xs' /* # of Ratings */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation1']!),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Text(
                                      functions
                                          .ratingCF(
                                              PeerToPeerGroup.gETofferIDCall
                                                  .listRating(
                                                    p2pReviewGETofferIDResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList())
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 12.0),
                                    child: Icon(
                                      Icons.star_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '1qtpwwn3' /* Avg. Rating */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation2']!),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final reviews = PeerToPeerGroup.gETofferIDCall
                              .listJasonReview(
                                p2pReviewGETofferIDResponse.jsonBody,
                              )
                              ?.toList() ??
                          [];
                      if (reviews.isEmpty) {
                        return const SizedBox(
                          height: 500.0,
                          child: EmptyStateSimpleWidget(
                            icon: Icon(
                              Icons.reviews_outlined,
                              size: 50.0,
                            ),
                            title: 'No Reviews',
                            body: ' ',
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          10.0,
                          0,
                          5.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: reviews.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                        itemBuilder: (context, reviewsIndex) {
                          final reviewsItem = reviews[reviewsIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${getJsonField(
                                                      reviewsItem,
                                                      r'''$.reviewer.firstName''',
                                                    ).toString()} ${getJsonField(
                                                      reviewsItem,
                                                      r'''$.reviewer.lastName''',
                                                    ).toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
                                                    child: RatingBarIndicator(
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      rating: getJsonField(
                                                              reviewsItem,
                                                              r'''$.rating''',
                                                            ) ?? 0.0,
                                                      unratedColor:
                                                          const Color(0xFF95A1AC),
                                                      itemCount: 5,
                                                      itemSize: 24.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (getJsonField(
                                                          reviewsItem,
                                                          r'''$.reviewer.avatar''',
                                                        ) !=
                                                        null) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets.all(2.0),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            '${FFAppConstants.Domain}${getJsonField(
                                                              reviewsItem,
                                                              r'''$.reviewer.avatar''',
                                                            ).toString()}',
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets.all(2.0),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/Untitled_design.png',
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  getJsonField(
                                                    reviewsItem,
                                                    r'''$.comment''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
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
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation']!);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
