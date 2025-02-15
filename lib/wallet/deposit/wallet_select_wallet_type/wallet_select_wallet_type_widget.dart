import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'wallet_select_wallet_type_model.dart';
export 'wallet_select_wallet_type_model.dart';

class WalletSelectWalletTypeWidget extends StatefulWidget {
  const WalletSelectWalletTypeWidget({
    super.key,
    required this.walletTypeAction,
  });

  final Future Function(String? walletType)? walletTypeAction;

  @override
  State<WalletSelectWalletTypeWidget> createState() =>
      _WalletSelectWalletTypeWidgetState();
}

class _WalletSelectWalletTypeWidgetState
    extends State<WalletSelectWalletTypeWidget> with TickerProviderStateMixin {
  late WalletSelectWalletTypeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletSelectWalletTypeModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 29.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 29.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'radioButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 29.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '7ocrtun0' /* Select a Wallet Type */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation1']!),
                  Text(
                    FFLocalizations.of(context).getText(
                      'iwdnokch' /* Pick one of the following wall... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation2']!),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FlutterFlowRadioButton(
                        options: [
                          FFLocalizations.of(context).getText(
                            '2v7bj13l' /* FIAT */,
                          ),
                          FFLocalizations.of(context).getText(
                            'mrcnri74' /* SPOT */,
                          ),
                          FFLocalizations.of(context).getText(
                            'b0f4op31' /* ECO */,
                          )
                        ].toList(),
                        onChanged: (val) async {
                          setState(() {});
                          HapticFeedback.lightImpact();
                          _model.walletType = _model.radioButtonValue;
                          setState(() {});
                          await widget.walletTypeAction?.call(
                            _model.walletType,
                          );
                        },
                        controller: _model.radioButtonValueController ??=
                            FormFieldController<String>(null),
                        optionHeight: 32.0,
                        textStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                        selectedTextStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.horizontal,
                        radioButtonColor: FlutterFlowTheme.of(context).primary,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.spaceEvenly,
                        verticalAlignment: WrapCrossAlignment.start,
                      ).animateOnPageLoad(
                          animationsMap['radioButtonOnPageLoadAnimation']!),
                    ),
                  ],
                ),
              ),
            ].divide(const SizedBox(height: 33.0)),
          ),
        ),
      ),
    );
  }
}
