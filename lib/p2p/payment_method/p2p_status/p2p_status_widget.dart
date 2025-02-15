import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'p2p_status_model.dart';
export 'p2p_status_model.dart';

class P2pStatusWidget extends StatefulWidget {
  const P2pStatusWidget({
    super.key,
    required this.id,
    required this.status,
  });

  final String? id;
  final bool? status;

  @override
  State<P2pStatusWidget> createState() => _P2pStatusWidgetState();
}

class _P2pStatusWidgetState extends State<P2pStatusWidget> {
  late P2pStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P2pStatusModel());

    _model.switchValue = widget.status!;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Switch.adaptive(
      value: _model.switchValue!,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue);
        if (newValue) {
          HapticFeedback.lightImpact();
          _model.apiStatusTrue = await PeerToPeerGroup.eDiTPMStatusCall.call(
            id: widget.id,
            status: true,
            accesstoken: FFAppState().accesstoken,
            csrftoken: FFAppState().csrftoken,
            sessionid: FFAppState().sessionId,
          );

          if ((_model.apiStatusTrue?.succeeded ?? true)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.apiStatusTrue?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).primary,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.apiStatusTrue?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }

          setState(() {});
        } else {
          HapticFeedback.lightImpact();
          _model.apiStatusFalse = await PeerToPeerGroup.eDiTPMStatusCall.call(
            id: widget.id,
            status: false,
            accesstoken: FFAppState().accesstoken,
            csrftoken: FFAppState().csrftoken,
            sessionid: FFAppState().sessionId,
          );

          if ((_model.apiStatusFalse?.succeeded ?? true)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.apiStatusFalse?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).primary,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.apiStatusFalse?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }

          setState(() {});
        }
      },
      activeColor: FlutterFlowTheme.of(context).primary,
      activeTrackColor: FlutterFlowTheme.of(context).primary,
      inactiveTrackColor: FlutterFlowTheme.of(context).secondaryBackground,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
    );
  }
}
