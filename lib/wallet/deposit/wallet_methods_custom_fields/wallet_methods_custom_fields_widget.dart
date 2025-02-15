import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'wallet_methods_custom_fields_model.dart';
export 'wallet_methods_custom_fields_model.dart';

class WalletMethodsCustomFieldsWidget extends StatefulWidget {
  const WalletMethodsCustomFieldsWidget({
    super.key,
    required this.title,
    required this.action,
  });

  final String? title;
  final Future Function(String value)? action;

  @override
  State<WalletMethodsCustomFieldsWidget> createState() =>
      _WalletMethodsCustomFieldsWidgetState();
}

class _WalletMethodsCustomFieldsWidgetState
    extends State<WalletMethodsCustomFieldsWidget> {
  late WalletMethodsCustomFieldsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletMethodsCustomFieldsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        await widget.action?.call(
          _model.textController.text,
        );
      },
    );
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
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.textController',
          const Duration(milliseconds: 200),
          () => setState(() {}),
        ),
        onFieldSubmitted: (_) async {
          await widget.action?.call(
            _model.textController.text,
          );
        },
        autofocus: false,
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
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
