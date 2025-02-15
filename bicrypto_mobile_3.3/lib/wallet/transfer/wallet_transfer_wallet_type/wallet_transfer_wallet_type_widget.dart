import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'wallet_transfer_wallet_type_model.dart';
export 'wallet_transfer_wallet_type_model.dart';

class WalletTransferWalletTypeWidget extends StatefulWidget {
  const WalletTransferWalletTypeWidget({
    super.key,
    required this.walletTypeAction,
    required this.tragetTypeAction,
  });

  final Future Function(String? walletType)? walletTypeAction;
  final Future Function(String? targetType)? tragetTypeAction;

  @override
  State<WalletTransferWalletTypeWidget> createState() =>
      _WalletTransferWalletTypeWidgetState();
}

class _WalletTransferWalletTypeWidgetState
    extends State<WalletTransferWalletTypeWidget>
    with TickerProviderStateMixin {
  late WalletTransferWalletTypeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletTransferWalletTypeModel());

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
      'radioButtonOnPageLoadAnimation1': AnimationInfo(
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
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 34.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
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
      'textOnPageLoadAnimation4': AnimationInfo(
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
      'radioButtonOnPageLoadAnimation2': AnimationInfo(
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
      'radioButtonOnPageLoadAnimation3': AnimationInfo(
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
      'radioButtonOnPageLoadAnimation4': AnimationInfo(
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '1fb3sptf' /* Select a Wallet Type */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation1']!),
                      Text(
                        FFLocalizations.of(context).getText(
                          'ul8nsyz0' /* Pick one of the following wall... */,
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
                                '4i2cvep5' /* FIAT */,
                              ),
                              FFLocalizations.of(context).getText(
                                'h6gvh9i0' /* SPOT */,
                              ),
                              FFLocalizations.of(context).getText(
                                '4sa8578o' /* ECO */,
                              )
                            ].toList(),
                            onChanged: (val) async {
                              setState(() {});
                              HapticFeedback.lightImpact();
                              _model.walletType = _model.radioButtonValue1;
                              setState(() {});
                              await widget.walletTypeAction?.call(
                                _model.walletType,
                              );
                            },
                            controller: _model.radioButtonValueController1 ??=
                                FormFieldController<String>(null),
                            optionHeight: 32.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            selectedTextStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            buttonPosition: RadioButtonPosition.left,
                            direction: Axis.horizontal,
                            radioButtonColor:
                                FlutterFlowTheme.of(context).primary,
                            inactiveRadioButtonColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            toggleable: false,
                            horizontalAlignment: WrapAlignment.spaceEvenly,
                            verticalAlignment: WrapCrossAlignment.start,
                          ).animateOnPageLoad(animationsMap[
                              'radioButtonOnPageLoadAnimation1']!),
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(height: 33.0)),
              ),
            ),
            if (_model.radioButtonValue1 != null &&
                _model.radioButtonValue1 != '')
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'cpabw3m9' /* Select a Target Wallet Type */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Poppins',
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation3']!),
                        Text(
                          FFLocalizations.of(context).getText(
                            'xpr6b79o' /* Choose the wallet type you wan... */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation4']!),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                if (_model.radioButtonValue1 == 'FIAT') {
                                  return FlutterFlowRadioButton(
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        'x529q45b' /* SPOT */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'idqlxo5c' /* ECO */,
                                      )
                                    ].toList(),
                                    onChanged: (val) async {
                                      setState(() {});
                                      HapticFeedback.lightImpact();
                                      _model.targetType =
                                          _model.radioButtonValue2;
                                      setState(() {});
                                      await widget.tragetTypeAction?.call(
                                        _model.targetType,
                                      );
                                    },
                                    controller:
                                        _model.radioButtonValueController2 ??=
                                            FormFieldController<String>(null),
                                    optionHeight: 32.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    selectedTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.horizontal,
                                    radioButtonColor:
                                        FlutterFlowTheme.of(context).primary,
                                    inactiveRadioButtonColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    toggleable: false,
                                    horizontalAlignment:
                                        WrapAlignment.spaceEvenly,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ).animateOnPageLoad(animationsMap[
                                      'radioButtonOnPageLoadAnimation2']!);
                                } else if (_model.radioButtonValue1 == 'SPOT') {
                                  return FlutterFlowRadioButton(
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        'hh5szjvh' /* FIAT */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'omayvevk' /* ECO */,
                                      )
                                    ].toList(),
                                    onChanged: (val) async {
                                      setState(() {});
                                      HapticFeedback.lightImpact();
                                      _model.targetType =
                                          _model.radioButtonValue3;
                                      setState(() {});
                                      await widget.tragetTypeAction?.call(
                                        _model.targetType,
                                      );
                                    },
                                    controller:
                                        _model.radioButtonValueController3 ??=
                                            FormFieldController<String>(null),
                                    optionHeight: 32.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    selectedTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.horizontal,
                                    radioButtonColor:
                                        FlutterFlowTheme.of(context).primary,
                                    inactiveRadioButtonColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    toggleable: false,
                                    horizontalAlignment:
                                        WrapAlignment.spaceEvenly,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ).animateOnPageLoad(animationsMap[
                                      'radioButtonOnPageLoadAnimation3']!);
                                } else {
                                  return FlutterFlowRadioButton(
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        '82jy3jsx' /* FIAT */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'a0t022k0' /* SPOT */,
                                      )
                                    ].toList(),
                                    onChanged: (val) async {
                                      setState(() {});
                                      HapticFeedback.lightImpact();
                                      _model.targetType =
                                          _model.radioButtonValue4;
                                      setState(() {});
                                      await widget.tragetTypeAction?.call(
                                        _model.targetType,
                                      );
                                    },
                                    controller:
                                        _model.radioButtonValueController4 ??=
                                            FormFieldController<String>(null),
                                    optionHeight: 32.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    selectedTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.horizontal,
                                    radioButtonColor:
                                        FlutterFlowTheme.of(context).primary,
                                    inactiveRadioButtonColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    toggleable: false,
                                    horizontalAlignment:
                                        WrapAlignment.spaceEvenly,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ).animateOnPageLoad(animationsMap[
                                      'radioButtonOnPageLoadAnimation4']!);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(const SizedBox(height: 33.0)),
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!),
              ),
          ],
        ),
      ),
    );
  }
}
