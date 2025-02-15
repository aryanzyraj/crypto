import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'blog_articledetail_model.dart';
export 'blog_articledetail_model.dart';

class BlogArticledetailWidget extends StatefulWidget {
  const BlogArticledetailWidget({
    super.key,
    required this.slug,
    required this.firstName,
    required this.lastName,
  });

  final String? slug;
  final String? firstName;
  final String? lastName;

  @override
  State<BlogArticledetailWidget> createState() =>
      _BlogArticledetailWidgetState();
}

class _BlogArticledetailWidgetState extends State<BlogArticledetailWidget>
    with TickerProviderStateMixin {
  late BlogArticledetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogArticledetailModel());

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
      'imageOnPageLoadAnimation': AnimationInfo(
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
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 2.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
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
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 170.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 170.0.ms,
            duration: 300.0.ms,
            begin: const Offset(50.0, 15.0),
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
      future: BlogGroup.blogGETpostIDCall.call(
        slug: widget.slug,
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const LoadingWidget(
              dimension: 150,
            ),
          );
        }
        final blogArticledetailBlogGETpostIDResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      if (getJsonField(
                                            blogArticledetailBlogGETpostIDResponse
                                                .jsonBody,
                                            r'''$.author.user.avatar''',
                                          ) !=
                                          null) {
                                        return Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              '${FFAppConstants.Domain}${getJsonField(
                                                blogArticledetailBlogGETpostIDResponse
                                                    .jsonBody,
                                                r'''$.author.user.avatar''',
                                              ).toString()}',
                                              width: 44.0,
                                              height: 44.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.asset(
                                              'assets/images/Untitled_design_(1).png',
                                              width: 44.0,
                                              height: 44.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget.firstName} ${widget.lastName}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            '${functions.timeAgo(getJsonField(
                                              blogArticledetailBlogGETpostIDResponse
                                                  .jsonBody,
                                              r'''$.createdAt''',
                                            ).toString())} - 5 Min Read',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation1']!),
                          ),
                          SizedBox(
                            height: 240.0,
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            getJsonField(
                                                      blogArticledetailBlogGETpostIDResponse
                                                          .jsonBody,
                                                      r'''$.image''',
                                                    ) !=
                                                    null
                                                ? '${FFAppConstants.Domain}${getJsonField(
                                                    blogArticledetailBlogGETpostIDResponse
                                                        .jsonBody,
                                                    r'''$.image''',
                                                  ).toString()}'
                                                : 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8Ym9va3xlbnwwfHx8fDE3MjA3NDAyNTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: getJsonField(
                                                    blogArticledetailBlogGETpostIDResponse
                                                        .jsonBody,
                                                    r'''$.image''',
                                                  ) !=
                                                  null
                                              ? '${FFAppConstants.Domain}${getJsonField(
                                                  blogArticledetailBlogGETpostIDResponse
                                                      .jsonBody,
                                                  r'''$.image''',
                                                ).toString()}'
                                              : 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8Ym9va3xlbnwwfHx8fDE3MjA3NDAyNTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: getJsonField(
                                              blogArticledetailBlogGETpostIDResponse
                                                  .jsonBody,
                                              r'''$.image''',
                                            ) !=
                                            null
                                        ? '${FFAppConstants.Domain}${getJsonField(
                                            blogArticledetailBlogGETpostIDResponse
                                                .jsonBody,
                                            r'''$.image''',
                                          ).toString()}'
                                        : 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8Ym9va3xlbnwwfHx8fDE3MjA3NDAyNTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        getJsonField(
                                                  blogArticledetailBlogGETpostIDResponse
                                                      .jsonBody,
                                                  r'''$.image''',
                                                ) !=
                                                null
                                            ? '${FFAppConstants.Domain}${getJsonField(
                                                blogArticledetailBlogGETpostIDResponse
                                                    .jsonBody,
                                                r'''$.image''',
                                              ).toString()}'
                                            : 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8Ym9va3xlbnwwfHx8fDE3MjA3NDAyNTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(
                                    animationsMap['imageOnPageLoadAnimation']!),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 6.0,
                                          sigmaY: 2.0,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                            width: 64.0,
                                            height: 64.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0x0DFFFEFE),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.document_scanner_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 44.0,
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation']!),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Text(
                              getJsonField(
                                blogArticledetailBlogGETpostIDResponse.jsonBody,
                                r'''$.title''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!),
                          ),
                          Builder(
                            builder: (context) {
                              final tagsList = BlogGroup.blogGETpostIDCall
                                      .tags(
                                        blogArticledetailBlogGETpostIDResponse
                                            .jsonBody,
                                      )
                                      ?.toList() ??
                                  [];

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(tagsList.length,
                                          (tagsListIndex) {
                                    final tagsListItem =
                                        tagsList[tagsListIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Container(
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              '#$tagsListItem',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                      .divide(const SizedBox(width: 8.0))
                                      .addToStart(const SizedBox(width: 16.0))
                                      .addToEnd(const SizedBox(width: 16.0)),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['rowOnPageLoadAnimation2']!);
                            },
                          ),
                          Html(
                            data: getJsonField(
                              blogArticledetailBlogGETpostIDResponse.jsonBody,
                              r'''$.content''',
                            ).toString(),
                            onLinkTap: (url, _, __) => launchURL(url!),
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
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
