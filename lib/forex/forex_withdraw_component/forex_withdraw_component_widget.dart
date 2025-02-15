import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'forex_withdraw_component_model.dart';
export 'forex_withdraw_component_model.dart';

class ForexWithdrawComponentWidget extends StatefulWidget {
  const ForexWithdrawComponentWidget({
    super.key,
    required this.accounntID,
  });

  final String? accounntID;

  @override
  State<ForexWithdrawComponentWidget> createState() =>
      _ForexWithdrawComponentWidgetState();
}

class _ForexWithdrawComponentWidgetState
    extends State<ForexWithdrawComponentWidget> with TickerProviderStateMixin {
  late ForexWithdrawComponentModel _model;

  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForexWithdrawComponentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 37.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 450.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 450.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 450.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['containerOnPageLoadAnimation']!
          .controller
          .forward(from: 0.0);
    });
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
      padding: const EdgeInsets.all(25.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: () {
          if (_model.wallTypeSelected) {
            return 450.0;
          } else if (_model.currencytSelected) {
            return 550.0;
          } else {
            return 400.0;
          }
        }(),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.96, -0.9),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).grayLight,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          icon: Icon(
                            Icons.close_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation'] !=
                                null) {
                              setState(() => hasContainerTriggered = true);
                              SchedulerBinding.instance.addPostFrameCallback(
                                  (_) async => await animationsMap[
                                          'containerOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0));
                            }
                            Navigator.pop(context);
                          },
                        ).animateOnPageLoad(
                            animationsMap['iconButtonOnPageLoadAnimation']!),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'nwotmwow' /* Withdraw From:  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          TextSpan(
                            text: widget.accounntID!,
                            style: GoogleFonts.getFont(
                              'PT Sans',
                              fontSize: 12.0,
                            ),
                          )
                        ],
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterFlowDropDown<String>(
                          controller: _model.wallDDValueController ??=
                              FormFieldController<String>(null),
                          options: [
                            FFLocalizations.of(context).getText(
                              'ptt28fma' /* FIAT */,
                            ),
                            FFLocalizations.of(context).getText(
                              'p0aj38aj' /* SPOT */,
                            )
                          ],
                          onChanged: (val) async {
                            setState(() => _model.wallDDValue = val);
                            _model.apiWalletCurrency =
                                await WalletGroup.getWalletCurrenciesCall.call(
                              action: 'withdraw',
                              walletType: _model.wallDDValue,
                              accesstoken: FFAppState().accesstoken,
                              csrftoken: FFAppState().csrftoken,
                              sessionid: FFAppState().sessionId,
                            );

                            if ((_model.apiWalletCurrency?.succeeded ?? true)) {
                              _model.wallTypeSelected = true;
                              setState(() {});
                            }

                            setState(() {});
                          },
                          width: double.infinity,
                          height: 56.0,
                          maxHeight: MediaQuery.sizeOf(context).height * 0.4,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'oea0hvxg' /* Please select wallet Type... */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            'zh6b8s0g' /* Search for an wallet... */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                        if (_model.wallTypeSelected)
                          FlutterFlowDropDown<String>(
                            controller: _model.currencyDDDValueController ??=
                                FormFieldController<String>(
                              _model.currencyDDDValue ??= '',
                            ),
                            options: List<String>.from(
                                WalletGroup.getWalletCurrenciesCall.valueList(
                              (_model.apiWalletCurrency?.jsonBody ?? ''),
                            )!),
                            optionLabels:
                                WalletGroup.getWalletCurrenciesCall.labelList(
                              (_model.apiWalletCurrency?.jsonBody ?? ''),
                            )!,
                            onChanged: (val) async {
                              setState(() => _model.currencyDDDValue = val);
                              if (_model.wallDDValue == 'SPOT') {
                                _model.apiCurrencyDResult = await WalletGroup
                                    .getWalletSingleCurrencyCall
                                    .call(
                                  type: _model.wallDDValue,
                                  code: _model.currencyDDDValue,
                                  action: 'withdraw',
                                  accesstoken: FFAppState().accesstoken,
                                  csrftoken: FFAppState().csrftoken,
                                  sessionid: FFAppState().sessionId,
                                );

                                if ((_model.apiCurrencyDResult?.succeeded ??
                                    true)) {
                                  _model.currencytSelected = true;
                                  setState(() {});
                                }
                              }

                              setState(() {});
                            },
                            width: double.infinity,
                            height: 56.0,
                            maxHeight: MediaQuery.sizeOf(context).height * 0.4,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            searchTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'svle8fcc' /* Please select currency... */,
                            ),
                            searchHintText: FFLocalizations.of(context).getText(
                              'hy5ozv7h' /* Search for an wallet... */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        if (_model.currencytSelected)
                          FlutterFlowDropDown<String>(
                            controller: _model.chainDDValueController ??=
                                FormFieldController<String>(null),
                            options:
                                WalletGroup.getWalletSingleCurrencyCall.chain(
                              (_model.apiCurrencyDResult?.jsonBody ?? ''),
                            )!,
                            onChanged: (val) =>
                                setState(() => _model.chainDDValue = val),
                            width: double.infinity,
                            height: 56.0,
                            maxHeight: MediaQuery.sizeOf(context).height * 0.4,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            searchTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'zd3nqnbl' /* Please select Chain... */,
                            ),
                            searchHintText: FFLocalizations.of(context).getText(
                              'y7c13eew' /* Search for an wallet... */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              const Duration(milliseconds: 100),
                              () => setState(() {}),
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                't78sts36' /* Amount */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            keyboardType: TextInputType.number,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'jsdaofm8' /* Please be advised that all dep... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(const SizedBox(height: 20.0)),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.apiWalletResult =
                                await ForexGroup.forexwithdrawCall.call(
                              id: widget.accounntID,
                              chain: _model.chainDDValue,
                              amount: int.tryParse(_model.textController.text),
                              type: _model.wallDDValue,
                              currency: _model.currencyDDDValue,
                              accesstoken: FFAppState().accesstoken,
                              csrftoken: FFAppState().csrftoken,
                              sessionid: FFAppState().sessionId,
                            );

                            if ((_model.apiWalletResult?.succeeded ?? true)) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.apiWalletResult?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.apiWalletResult?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).errorRed,
                                ),
                              );
                            }

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'mhda4m1v' /* Withdraw */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).customColor8,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).errorRed,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['buttonOnPageLoadAnimation']!),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
          .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!)
          .animateOnActionTrigger(
              animationsMap['containerOnActionTriggerAnimation']!,
              hasBeenTriggered: hasContainerTriggered),
    );
  }
}
