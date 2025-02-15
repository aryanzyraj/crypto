import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/e_commerce/ecommerce_rates_component/ecommerce_rates_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'ecommerce_reviews_model.dart';
export 'ecommerce_reviews_model.dart';

class EcommerceReviewsWidget extends StatefulWidget {
  const EcommerceReviewsWidget({
    super.key,
    required this.reviews,
    required this.id,
  });

  final List<dynamic>? reviews;
  final String? id;

  @override
  State<EcommerceReviewsWidget> createState() => _EcommerceReviewsWidgetState();
}

class _EcommerceReviewsWidgetState extends State<EcommerceReviewsWidget>
    with TickerProviderStateMixin {
  late EcommerceReviewsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EcommerceReviewsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 259.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 259.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 259.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'dividerOnPageLoadAnimation': AnimationInfo(
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
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 259.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 259.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 259.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 259.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 259.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 259.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 259.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation': AnimationInfo(
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
      'rowOnPageLoadAnimation3': AnimationInfo(
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 600.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).alternate,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x25090F13),
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
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'duvswadh' /* Reviews */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Lexend',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.close_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation1']!),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  child: Builder(
                    builder: (context) {
                      if (widget.reviews != null &&
                          (widget.reviews)!.isNotEmpty) {
                        return Builder(
                          builder: (context) {
                            final reviewList = widget.reviews!.toList();
                            if (reviewList.isEmpty) {
                              return EmptyStateSimpleWidget(
                                icon: Icon(
                                  Icons.reviews_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 50.0,
                                ),
                                title: 'No Reviews',
                                body:
                                    'Please tell us your review in the section below',
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: reviewList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 5.0),
                              itemBuilder: (context, reviewListIndex) {
                                final reviewListItem =
                                    reviewList[reviewListIndex];
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (getJsonField(
                                                            reviewListItem,
                                                            r'''$.user.avatar''',
                                                          ) !=
                                                          null) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  1.0),
                                                          child: Container(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              '${FFAppConstants.Domain}${getJsonField(
                                                                reviewListItem,
                                                                r'''$.user.avatar''',
                                                              ).toString()}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  1.0),
                                                          child: Container(
                                                            width: 60.0,
                                                            height: 60.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Image.asset(
                                                              'assets/images/Annonymous.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                                Text(
                                                  '${getJsonField(
                                                    reviewListItem,
                                                    r'''$.user.firstName''',
                                                  ).toString()} ${getJsonField(
                                                    reviewListItem,
                                                    r'''$.user.lastName''',
                                                  ).toString()}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(width: 5.0)),
                                            ),
                                            EcommerceRatesComponentWidget(
                                              key: Key(
                                                  'Key50a_${reviewListIndex}_of_${reviewList.length}'),
                                              parameter1: getJsonField(
                                                reviewListItem,
                                                r'''$.rating''',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Text(
                                                    getJsonField(
                                                      reviewListItem,
                                                      r'''$.comment''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Text Me One',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!);
                              },
                            );
                          },
                        );
                      } else {
                        return wrapWithModel(
                          model: _model.emptyStateSimpleModel,
                          updateCallback: () => setState(() {}),
                          child: EmptyStateSimpleWidget(
                            icon: Icon(
                              Icons.reviews_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 50.0,
                            ),
                            title: ' No Reviews',
                            body:
                                'Please tell us your review in the section below...',
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ).animateOnPageLoad(animationsMap['dividerOnPageLoadAnimation']!),
              Text(
                FFLocalizations.of(context).getText(
                  'q5xqc120' /* Tell us your Review */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Lexend',
                      letterSpacing: 0.0,
                    ),
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RatingBar.builder(
                      onRatingUpdate: (newValue) =>
                          setState(() => _model.ratingBarValue = newValue),
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                      direction: Axis.horizontal,
                      initialRating: _model.ratingBarValue ??= 0.0,
                      unratedColor: FlutterFlowTheme.of(context).secondaryText,
                      itemCount: 5,
                      itemSize: 35.0,
                      glowColor: FlutterFlowTheme.of(context).tertiary,
                    ),
                  ].divide(const SizedBox(width: 5.0)),
                ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation2']!),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'x0u883wk' /* Write a comment... */,
                    ),
                    labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Lexend',
                          letterSpacing: 0.0,
                        ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                  maxLines: null,
                  minLines: 1,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ).animateOnPageLoad(
                    animationsMap['textFieldOnPageLoadAnimation']!),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.apiPOSTReviewResult =
                                  await EcommerceGroup.pOSTreviewsCall.call(
                                comment: _model.textController.text,
                                rating: _model.ratingBarValue?.round(),
                                accesstoken: FFAppState().accesstoken,
                                csrftoken: FFAppState().csrftoken,
                                sessionid: FFAppState().sessionId,
                                productId: widget.id,
                              );

                              if ((_model.apiPOSTReviewResult?.succeeded ??
                                  true)) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiPOSTReviewResult?.jsonBody ??
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
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                                );
                              } else {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiPOSTReviewResult?.jsonBody ??
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
                                        FlutterFlowTheme.of(context).errorRed,
                                  ),
                                );
                              }

                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'c3do6tw7' /* Submit */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: Colors.white,
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
                    ),
                  ].divide(const SizedBox(width: 10.0)),
                ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation3']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
