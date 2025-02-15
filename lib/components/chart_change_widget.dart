import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'chart_change_model.dart';
export 'chart_change_model.dart';

class ChartChangeWidget extends StatefulWidget {
  const ChartChangeWidget({super.key});

  @override
  State<ChartChangeWidget> createState() => _ChartChangeWidgetState();
}

class _ChartChangeWidgetState extends State<ChartChangeWidget> {
  late ChartChangeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChartChangeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '3j3c5wft' /* Today */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                    ),
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'jgis7g9y' /* -2.36% */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).errorRed,
                            letterSpacing: 0.0,
                          ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ].divide(const SizedBox(height: 3.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  's62kc6zd' /* 7 Days */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                    ),
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'wgtewh3p' /* 21.36% */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).tertiary,
                            letterSpacing: 0.0,
                          ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ].divide(const SizedBox(height: 3.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'eatakf9i' /* 30 Days */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                    ),
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'jgyjtpqy' /* 29.36% */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).tertiary,
                            letterSpacing: 0.0,
                          ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ].divide(const SizedBox(height: 3.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'fbtgqwom' /* 90 Days */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                    ),
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'kyvz8esf' /* 21.36% */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).tertiary,
                            letterSpacing: 0.0,
                          ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ].divide(const SizedBox(height: 3.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'znqu8ocf' /* 180 Days */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                    ),
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'k75il7qe' /* 21.36% */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).tertiary,
                            letterSpacing: 0.0,
                          ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ].divide(const SizedBox(height: 3.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'mmwyo2vo' /* 1 Year */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                    ),
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'vtimz16d' /* 21.36% */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).tertiary,
                            letterSpacing: 0.0,
                          ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ].divide(const SizedBox(height: 3.0)),
          ),
        ].divide(const SizedBox(width: 20.0)),
      ),
    );
  }
}
