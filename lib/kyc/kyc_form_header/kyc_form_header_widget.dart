import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'kyc_form_header_model.dart';
export 'kyc_form_header_model.dart';

class KycFormHeaderWidget extends StatefulWidget {
  const KycFormHeaderWidget({super.key});

  @override
  State<KycFormHeaderWidget> createState() => _KycFormHeaderWidgetState();
}

class _KycFormHeaderWidgetState extends State<KycFormHeaderWidget> {
  late KycFormHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KycFormHeaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(8.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).grayLight,
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'bbnaii77' /* 1 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 28.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '7ih1c31n' /* General Information for your a... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ].divide(const SizedBox(width: 5.0)),
          ),
        ),
        Divider(
          thickness: 1.0,
          color: FlutterFlowTheme.of(context).accent4,
        ),
      ],
    );
  }
}
