import '/components/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'blog_articles_list_model.dart';
export 'blog_articles_list_model.dart';

class BlogArticlesListWidget extends StatefulWidget {
  const BlogArticlesListWidget({
    super.key,
    required this.posts,
  });

  final List<dynamic>? posts;

  @override
  State<BlogArticlesListWidget> createState() => _BlogArticlesListWidgetState();
}

class _BlogArticlesListWidgetState extends State<BlogArticlesListWidget>
    with TickerProviderStateMixin {
  late BlogArticlesListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogArticlesListModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 500.0.ms,
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
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
          title: Text(
            FFLocalizations.of(context).getText(
              '7w4z6scq' /* Articles */,
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Lexend',
                  letterSpacing: 0.0,
                ),
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
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final posts = widget.posts!.toList();
                      if (posts.isEmpty) {
                        return const EmptyStateSimpleWidget(
                          icon: Icon(
                            Icons.content_paste_sharp,
                            size: 40.0,
                          ),
                          title: 'No Posts',
                          body:
                              'There are no posts associate with this category or authors',
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: posts.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                        itemBuilder: (context, postsIndex) {
                          final postsItem = posts[postsIndex];
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
                                      postsItem,
                                      r'''$.slug''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                  'firstName': serializeParam(
                                    getJsonField(
                                      postsItem,
                                      r'''$.author.user.firstName''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                  'lastName': serializeParam(
                                    getJsonField(
                                      postsItem,
                                      r'''$.author.user.lastName''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Color(0x411D2429),
                                    offset: Offset(
                                      0.0,
                                      1.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (getJsonField(
                                              postsItem,
                                              r'''$.image''',
                                            ) !=
                                            null) {
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 1.0, 1.0, 1.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              child: Image.network(
                                                '${FFAppConstants.Domain}${getJsonField(
                                                  postsItem,
                                                  r'''$.image''',
                                                ).toString()}',
                                                width: 80.0,
                                                height: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 1.0, 1.0, 1.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1516641396056-0ce60a85d49f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8YXJ0aWNsZXxlbnwwfHx8fDE3MDk5NzEyMTV8MA&ixlib=rb-4.0.3&q=80&w=400',
                                                width: 80.0,
                                                height: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 4.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getJsonField(
                                                postsItem,
                                                r'''$.title''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 8.0, 0.0),
                                              child: AutoSizeText(
                                                functions
                                                    .timeAgo(getJsonField(
                                                      postsItem,
                                                      r'''$.createdAt''',
                                                    ).toString())
                                                    .maybeHandleOverflow(
                                                      maxChars: 70,
                                                      replacement: '…',
                                                    ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
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
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
