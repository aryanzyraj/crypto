import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'kyc_custom_text_field_component_model.dart';
export 'kyc_custom_text_field_component_model.dart';

class KycCustomTextFieldComponentWidget extends StatefulWidget {
  const KycCustomTextFieldComponentWidget({
    super.key,
    this.title,
    required this.type,
    required this.level,
    required this.customfielsAction,
  });

  final String? title;
  final String? type;
  final int? level;
  final Future Function(String? customField)? customfielsAction;

  @override
  State<KycCustomTextFieldComponentWidget> createState() =>
      _KycCustomTextFieldComponentWidgetState();
}

class _KycCustomTextFieldComponentWidgetState
    extends State<KycCustomTextFieldComponentWidget> {
  late KycCustomTextFieldComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KycCustomTextFieldComponentModel());

    _model.costomFieldTextTextController ??= TextEditingController();
    _model.costomFieldTextFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: TextFormField(
        controller: _model.costomFieldTextTextController,
        focusNode: _model.costomFieldTextFocusNode,
        onFieldSubmitted: (_) async {
          await widget.customfielsAction?.call(
            _model.costomFieldTextTextController.text,
          );
        },
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelText: widget.title,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Poppins',
                letterSpacing: 0.0,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Poppins',
                letterSpacing: 0.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
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
        validator:
            _model.costomFieldTextTextControllerValidator.asValidator(context),
      ),
    );
  }
}
