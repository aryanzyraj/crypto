import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_welcome_model.dart';
export 'user_welcome_model.dart';

class UserWelcomeWidget extends StatefulWidget {
  const UserWelcomeWidget({
    super.key,
    required this.pagecontent,
  });

  final String? pagecontent;

  @override
  State<UserWelcomeWidget> createState() => _UserWelcomeWidgetState();
}

class _UserWelcomeWidgetState extends State<UserWelcomeWidget> {
  late UserWelcomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserWelcomeModel());
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
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).tertiary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Builder(
                  builder: (context) {
                    if (FFAppState().avatar != '') {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            '${FFAppConstants.Domain}${FFAppState().avatar}',
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'tu1x8fxw' /* Welcome, */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Lexend',
                                letterSpacing: 0.0,
                              ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFAppState().lastName,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Lexend',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Text(
                    widget.pagecontent!,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Lexend',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
