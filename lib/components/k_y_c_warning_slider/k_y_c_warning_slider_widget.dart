import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'k_y_c_warning_slider_model.dart';
export 'k_y_c_warning_slider_model.dart';

class KYCWarningSliderWidget extends StatefulWidget {
  const KYCWarningSliderWidget({super.key});

  @override
  State<KYCWarningSliderWidget> createState() => _KYCWarningSliderWidgetState();
}

class _KYCWarningSliderWidgetState extends State<KYCWarningSliderWidget> {
  late KYCWarningSliderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KYCWarningSliderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).report,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          HapticFeedback.lightImpact();

          context.pushNamed('kycMain');
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 45.0,
                child: custom_widgets.KycReport(
                  width: double.infinity,
                  height: 45.0,
                  report:
                      'Please complete your KYC verification to unlock full account functionality. Incomplete verification may restrict your ability to trade, invest, and access certain features. Verify your identity now to ensure uninterrupted service.',
                  containerColor: FlutterFlowTheme.of(context).report,
                  textColor: FlutterFlowTheme.of(context).errorRed,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
