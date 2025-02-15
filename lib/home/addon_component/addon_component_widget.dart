import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addon_component_model.dart';
export 'addon_component_model.dart';

class AddonComponentWidget extends StatefulWidget {
  const AddonComponentWidget({
    super.key,
    required this.isNew,
    required this.title,
    required this.action,
    required this.icon,
  });

  final bool? isNew;
  final String? title;
  final Future Function()? action;
  final Widget? icon;

  @override
  State<AddonComponentWidget> createState() => _AddonComponentWidgetState();
}

class _AddonComponentWidgetState extends State<AddonComponentWidget> {
  late AddonComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddonComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        HapticFeedback.lightImpact();
        await widget.action?.call();
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 70.0,
            height: 50.0,
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 0.0),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: widget.icon!,
                  ),
                ),
                if (widget.isNew ?? true)
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).warning,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 2.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '8q07u00v' /* NEW */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .darkBackground,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Text(
            widget.title!,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Poppins',
                  letterSpacing: 0.0,
                ),
          ),
        ].divide(const SizedBox(height: 4.0)),
      ),
    );
  }
}
