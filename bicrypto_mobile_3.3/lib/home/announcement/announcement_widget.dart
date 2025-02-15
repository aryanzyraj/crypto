import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'announcement_model.dart';
export 'announcement_model.dart';

class AnnouncementWidget extends StatefulWidget {
  const AnnouncementWidget({super.key});

  @override
  State<AnnouncementWidget> createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
  late AnnouncementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnnouncementModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              's2nqrcls' /* Announcements */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lexend',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: Builder(
                    builder: (context) {
                      final announcement = FFAppState().announcements.toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: announcement.length,
                        itemBuilder: (context, announcementIndex) {
                          final announcementItem =
                              announcement[announcementIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    getJsonField(
                                      announcementItem,
                                      r'''$.title''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: () {
                                        if ((String var1) {
                                          return var1 == "UPDATE";
                                        }(getJsonField(
                                          announcementItem,
                                          r'''$.type''',
                                        ).toString())) {
                                          return FlutterFlowTheme.of(context)
                                              .customColor4;
                                        } else if ((String var1) {
                                          return var1 == "GENERAL";
                                        }(getJsonField(
                                          announcementItem,
                                          r'''$.type''',
                                        ).toString())) {
                                          return FlutterFlowTheme.of(context)
                                              .customColor2;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .exchangeGreenLight;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          6.0, 6.0, 6.0, 6.0),
                                      child: Text(
                                        getJsonField(
                                          announcementItem,
                                          r'''$.type''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                getJsonField(
                                  announcementItem,
                                  r'''$.message''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto Mono',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              if (!((String var1) {
                                return var1 == ' ';
                              }(getJsonField(
                                announcementItem,
                                r'''$.link''',
                              ).toString())))
                                Text(
                                  getJsonField(
                                    announcementItem,
                                    r'''$.link''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    functions.timeAgo(getJsonField(
                                      announcementItem,
                                      r'''$.createdAt''',
                                    ).toString()),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      HapticFeedback.lightImpact();

                                      context.pushNamed(
                                        'urlLunch',
                                        queryParameters: {
                                          'url': serializeParam(
                                            getJsonField(
                                              announcementItem,
                                              r'''$.link''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            6.0, 6.0, 6.0, 6.0),
                                        child: Icon(
                                          Icons.link,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              StyledDivider(
                                thickness: 0.5,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                lineStyle: DividerLineStyle.dashed,
                              ),
                            ].divide(const SizedBox(height: 5.0)),
                          );
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
