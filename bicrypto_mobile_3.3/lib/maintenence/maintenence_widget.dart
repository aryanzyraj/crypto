import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'maintenence_model.dart';
export 'maintenence_model.dart';

class MaintenenceWidget extends StatefulWidget {
  const MaintenenceWidget({super.key});

  @override
  State<MaintenenceWidget> createState() => _MaintenenceWidgetState();
}

class _MaintenenceWidgetState extends State<MaintenenceWidget> {
  late MaintenenceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MaintenenceModel());
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.hourglass_empty_rounded,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 100.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 8.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'me5fng44' /* Site Under Maintenance */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '0y3arod9' /* Please try again later. */,
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Lexend',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
