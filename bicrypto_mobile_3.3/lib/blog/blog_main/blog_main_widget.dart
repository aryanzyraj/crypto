import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'blog_main_model.dart';
export 'blog_main_model.dart';

class BlogMainWidget extends StatefulWidget {
  const BlogMainWidget({super.key});

  @override
  State<BlogMainWidget> createState() => _BlogMainWidgetState();
}

class _BlogMainWidgetState extends State<BlogMainWidget>
    with TickerProviderStateMixin {
  late BlogMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogMainModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isOrderBookOpen = false;
      FFAppState().isWebSocketOpen = false;
    });

    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(50.0, 15.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 50.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 300.0.ms,
            begin: const Offset(50.0, 15.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: const Offset(50.0, 15.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 150.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: const Offset(50.0, 15.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 180.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 180.0.ms,
            duration: 300.0.ms,
            begin: const Offset(50.0, 15.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0, 0.524),
            end: const Offset(0, 0),
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
      future: AuthinticationGroup.getProfileCall.call(
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
        final blogMainGetProfileResponse = snapshot.data!;

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
                  context.goNamed(
                    'BicryptoHomePage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                      ),
                    },
                  );
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'dxeckuzo' /* BLOG */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Lexend',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).customColor4,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Builder(
                      builder: (context) {
                        if (AuthinticationGroup.getProfileCall.authorStatus(
                              blogMainGetProfileResponse.jsonBody,
                            ) ==
                            'APPROVED') {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'blogCreateArticle',
                                  queryParameters: {
                                    'authorID': serializeParam(
                                      AuthinticationGroup.getProfileCall
                                          .authorID(
                                        blogMainGetProfileResponse.jsonBody,
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Icon(
                                Icons.playlist_add_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                            ),
                          );
                        } else if (AuthinticationGroup.getProfileCall
                                .authorStatus(
                              blogMainGetProfileResponse.jsonBody,
                            ) ==
                            'PENDING') {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6.0, 4.0, 6.0, 4.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text(
                                            'Hello, ${AuthinticationGroup.getProfileCall.lastName(
                                          blogMainGetProfileResponse.jsonBody,
                                        )}'),
                                        content: const Text(
                                            'Your author profile is currently pending for approval.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Icon(
                                Icons.pending_actions,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 4.0, 4.0, 4.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: const Text('Authorship Program'),
                                            content: const Text(
                                                'Dear Applicant, We have noticed your interest in contributing to our platform. Due to the increasing volume of content, we are currently expanding our team of authors. We\'d be delighted to consider you for this role.'),
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
                                _model.apiResultqyf =
                                    await BlogGroup.blogPostAuthorsCall.call(
                                  accesstoken: FFAppState().accesstoken,
                                  csrftoken: FFAppState().csrftoken,
                                  sessionid: FFAppState().sessionId,
                                );

                                if (functions.statusResponse(
                                    (_model.apiResultqyf?.jsonBody ?? ''))) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Your author profile is currently pending for approval.',
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
                                  _model.isApplied = true;
                                  setState(() {});
                                }

                                setState(() {});
                              },
                              child: Icon(
                                Icons.touch_app_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                            ),
                          );
                        }
                      },
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
              child: FutureBuilder<ApiCallResponse>(
                future: FFAppState().posts(
                  requestFn: () => BlogGroup.blogpostsCall.call(
                    accesstoken: FFAppState().accesstoken,
                    csrftoken: FFAppState().csrftoken,
                    sessionid: FFAppState().sessionId,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: LinearProgressIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                  }
                  final columnBlogpostsResponse = snapshot.data!;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 6.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ik0ct8hq' /* Authers */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation1']!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 6.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: FFAppState().authors(
                              requestFn: () =>
                                  BlogGroup.blogGETAuthorsCall.call(
                                accesstoken: FFAppState().accesstoken,
                                csrftoken: FFAppState().csrftoken,
                                sessionid: FFAppState().sessionId,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 40.0),
                                    child: LinearProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              final rowBlogGETAuthorsResponse = snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final authersList =
                                      BlogGroup.blogGETAuthorsCall
                                              .dataResult(
                                                rowBlogGETAuthorsResponse
                                                    .jsonBody,
                                              )
                                              ?.toList() ??
                                          [];
                                  if (authersList.isEmpty) {
                                    return EmptyStateSimpleWidget(
                                      icon: Icon(
                                        Icons.auto_stories,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      title: 'No Authers',
                                      body: '    ',
                                    );
                                  }

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(authersList.length,
                                              (authersListIndex) {
                                        final authersListItem =
                                            authersList[authersListIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'blogArticlesList',
                                              queryParameters: {
                                                'posts': serializeParam(
                                                  functions
                                                      .blogFilterByNameANDCat(
                                                          BlogGroup
                                                              .blogpostsCall
                                                              .postsResult(
                                                                columnBlogpostsResponse
                                                                    .jsonBody,
                                                              )!
                                                              .toList(),
                                                          getJsonField(
                                                            authersListItem,
                                                            r'''$.user.firstName''',
                                                          ).toString(),
                                                          getJsonField(
                                                            authersListItem,
                                                            r'''$.user.lastName''',
                                                          ).toString(),
                                                          ' '),
                                                  ParamType.JSON,
                                                  isList: true,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 85.0,
                                            height: 85.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor1,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    if (getJsonField(
                                                          authersListItem,
                                                          r'''$.user.avatar''',
                                                        ) !=
                                                        null) {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      200),
                                                          fadeOutDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      200),
                                                          imageUrl:
                                                              '${FFAppConstants.Domain}${getJsonField(
                                                            authersListItem,
                                                            r'''$.user.avatar''',
                                                          ).toString()}',
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                          errorWidget: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        child: Image.asset(
                                                          'assets/images/Annonymous.png',
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 0.0, 3.0, 0.0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        3.0),
                                                            child: Text(
                                                              getJsonField(
                                                                authersListItem,
                                                                r'''$.user.firstName''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .textColor,
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
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!);
                                      }).divide(const SizedBox(width: 5.0)),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 3.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'lejc8xje' /* Categories */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation2']!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 6.0, 12.0, 6.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FutureBuilder<ApiCallResponse>(
                                  future: FFAppState().categories(
                                    requestFn: () =>
                                        BlogGroup.blogGETcategoriesCall.call(
                                      accesstoken: FFAppState().accesstoken,
                                      csrftoken: FFAppState().csrftoken,
                                      sessionid: FFAppState().sessionId,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 145.0, 0.0, 0.0),
                                          child: LinearProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    final rowBlogGETcategoriesResponse =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        final categoryList =
                                            BlogGroup.blogGETcategoriesCall
                                                    .categoryDataResult(
                                                      rowBlogGETcategoriesResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];
                                        if (categoryList.isEmpty) {
                                          return EmptyStateSimpleWidget(
                                            icon: Icon(
                                              Icons.category_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 100.0,
                                            ),
                                            title: 'No Categoty',
                                            body: '    ',
                                          );
                                        }

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                categoryList.length,
                                                (categoryListIndex) {
                                              final categoryListItem =
                                                  categoryList[
                                                      categoryListIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 0.0, 3.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'blogArticlesList',
                                                      queryParameters: {
                                                        'posts': serializeParam(
                                                          functions
                                                              .blogFilterByNameANDCat(
                                                                  BlogGroup
                                                                      .blogpostsCall
                                                                      .postsResult(
                                                                        columnBlogpostsResponse
                                                                            .jsonBody,
                                                                      )!
                                                                      .toList(),
                                                                  ' ',
                                                                  ' ',
                                                                  getJsonField(
                                                                    categoryListItem,
                                                                    r'''$.name''',
                                                                  ).toString()),
                                                          ParamType.JSON,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 150.0,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  2.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              '${FFAppConstants.Domain}${getJsonField(
                                                                categoryListItem,
                                                                r'''$.image''',
                                                              ).toString()}',
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            1.0,
                                                                            1.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          80.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            const Color(0x00FFFFFF),
                                                                            FlutterFlowTheme.of(context).customColor1
                                                                          ],
                                                                          stops: const [
                                                                            0.0,
                                                                            1.0
                                                                          ],
                                                                          begin: const AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          end: const AlignmentDirectional(
                                                                              0,
                                                                              1.0),
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(12.0),
                                                                          bottomRight:
                                                                              Radius.circular(12.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 10.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  categoryListItem,
                                                                                  r'''$.name''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Lexend',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation2']!),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 6.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'pnaw73to' /* Latest Posts */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
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
                                        context.pushNamed(
                                          'blogArticlesList',
                                          queryParameters: {
                                            'posts': serializeParam(
                                              BlogGroup.blogpostsCall
                                                  .postsResult(
                                                columnBlogpostsResponse
                                                    .jsonBody,
                                              ),
                                              ParamType.JSON,
                                              isList: true,
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
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'e76vd1jj' /* view more */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              letterSpacing: 0.0,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation3']!),
                              ),
                              Builder(
                                builder: (context) {
                                  final postsListResult =
                                      (BlogGroup.blogpostsCall
                                                  .postsResult(
                                                    columnBlogpostsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [])
                                          .take(3)
                                          .toList();
                                  if (postsListResult.isEmpty) {
                                    return EmptyStateSimpleWidget(
                                      icon: FaIcon(
                                        FontAwesomeIcons.paste,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 50.0,
                                      ),
                                      title: 'No Post',
                                      body: '      ',
                                    );
                                  }

                                  return SizedBox(
                                    width: double.infinity,
                                    height: 219.0,
                                    child: CarouselSlider.builder(
                                      itemCount: postsListResult.length,
                                      itemBuilder:
                                          (context, postsListResultIndex, _) {
                                        final postsListResultItem =
                                            postsListResult[
                                                postsListResultIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'blogArticledetail',
                                              queryParameters: {
                                                'slug': serializeParam(
                                                  getJsonField(
                                                    postsListResultItem,
                                                    r'''$.slug''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'firstName': serializeParam(
                                                  getJsonField(
                                                    postsListResultItem,
                                                    r'''$.author.user.firstName''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'lastName': serializeParam(
                                                  getJsonField(
                                                    postsListResultItem,
                                                    r'''$.author.user.lastName''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  getJsonField(
                                                            postsListResultItem,
                                                            r'''$.image''',
                                                          ) !=
                                                          null
                                                      ? '${FFAppConstants.Domain}${getJsonField(
                                                          postsListResultItem,
                                                          r'''$.image''',
                                                        ).toString()}'
                                                      : 'https://images.unsplash.com/photo-1471107340929-a87cd0f5b5f3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxibG9nfGVufDB8fHx8MTcyMDczNDUxOHww&ixlib=rb-4.0.3&q=80&w=1080',
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.03),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 120.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        const Color(0x00FFFFFF),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate
                                                      ],
                                                      stops: const [0.0, 1.0],
                                                      begin:
                                                          const AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: const AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -0.97, 0.97),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 80.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              postsListResultItem,
                                                              r'''$.title''',
                                                            ).toString(),
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              postsListResultItem,
                                                              r'''$.description''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Container(
                                                  height: 35.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayLight,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      22.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            '${FFAppConstants.Domain}${getJsonField(
                                                              postsListResultItem,
                                                              r'''$.author.user.avatar''',
                                                            ).toString()}',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              postsListResultItem,
                                                              r'''$.author.user.firstName''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            functions.timeAgo(
                                                                getJsonField(
                                                              postsListResultItem,
                                                              r'''$.createdAt''',
                                                            ).toString()),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 4.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'stackOnPageLoadAnimation']!);
                                      },
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselController(),
                                      options: CarouselOptions(
                                        initialPage: max(0,
                                            min(2, postsListResult.length - 1)),
                                        viewportFraction: 0.8,
                                        disableCenter: true,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.25,
                                        enableInfiniteScroll: true,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: false,
                                        onPageChanged: (index, _) =>
                                            _model.carouselCurrentIndex = index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
