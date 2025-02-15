import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/components/toast/toast_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'a_i_trade_model.dart';
export 'a_i_trade_model.dart';

class AITradeWidget extends StatefulWidget {
  const AITradeWidget({
    super.key,
    required this.balance,
    required this.currency,
    required this.pair,
  });

  final double? balance;
  final String? currency;
  final String? pair;

  @override
  State<AITradeWidget> createState() => _AITradeWidgetState();
}

class _AITradeWidgetState extends State<AITradeWidget>
    with TickerProviderStateMixin {
  late AITradeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AITradeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiPLANS = await AIInvestmentGroup.getPalnsCall.call(
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      );

      if ((_model.apiPLANS?.succeeded ?? true)) {
        _model.connected = true;
        setState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-35.0, -10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'dropDownOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-35.0, -10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'dropDownOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-35.0, -10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-35.0, -10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-35.0, -10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 14.999999999999986),
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
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: FlutterFlowTheme.of(context).darkBackground,
                  offset: const Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Builder(
              builder: (context) {
                if (_model.connected) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'q5tvr26w' /* AI Investment */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                        FlutterFlowDropDown<String>(
                          controller: _model.planDDValueController ??=
                              FormFieldController<String>(
                            _model.planDDValue ??= '',
                          ),
                          options: List<String>.from(
                              AIInvestmentGroup.getPalnsCall.idList(
                            (_model.apiPLANS?.jsonBody ?? ''),
                          )!),
                          optionLabels:
                              AIInvestmentGroup.getPalnsCall.titleList(
                            (_model.apiPLANS?.jsonBody ?? ''),
                          )!,
                          onChanged: (val) =>
                              setState(() => _model.planDDValue = val),
                          width: double.infinity,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'ko2n0wa1' /* Select a plan */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ).animateOnPageLoad(
                            animationsMap['dropDownOnPageLoadAnimation1']!),
                        FlutterFlowDropDown<String>(
                          controller: _model.duartionDDValueController ??=
                              FormFieldController<String>(
                            _model.duartionDDValue ??= '',
                          ),
                          options: List<String>.from(_model.planDDValue !=
                                      null &&
                                  _model.planDDValue != ''
                              ? functions
                                  .aiInvestmentDuration(
                                      _model.planDDValue,
                                      AIInvestmentGroup.getPalnsCall
                                          .list(
                                            (_model.apiPLANS?.jsonBody ?? ''),
                                          )
                                          ?.toList())!
                                  .map((e) => getJsonField(
                                        e,
                                        r'''$.id''',
                                      ))
                                  .toList()
                                  .map((e) => e.toString())
                                  .toList()
                              : AIInvestmentGroup.getPalnsCall.idList(
                                  (_model.apiPLANS?.jsonBody ?? ''),
                                )!),
                          optionLabels: _model.planDDValue != null &&
                                  _model.planDDValue != ''
                              ? functions
                                  .aiInvestmentDuration(
                                      _model.planDDValue,
                                      AIInvestmentGroup.getPalnsCall
                                          .list(
                                            (_model.apiPLANS?.jsonBody ?? ''),
                                          )
                                          ?.toList())!
                                  .map((e) => getJsonField(
                                        e,
                                        r'''$.Name''',
                                      ))
                                  .toList()
                                  .map((e) => e.toString())
                                  .toList()
                              : AIInvestmentGroup.getPalnsCall.idList(
                                  (_model.apiPLANS?.jsonBody ?? ''),
                                )!,
                          onChanged: (val) =>
                              setState(() => _model.duartionDDValue = val),
                          width: double.infinity,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'zt4f5aqc' /* Select a duration */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          disabled: _model.planDDValue == null ||
                              _model.planDDValue == '',
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ).animateOnPageLoad(
                            animationsMap['dropDownOnPageLoadAnimation2']!),
                        TextFormField(
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
                              'rr2vnabv' /* Amount */,
                            ),
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'od0slpjf' /* Amount */,
                            ),
                            hintStyle:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Lexend',
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
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 20.0, 0.0, 20.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ).animateOnPageLoad(
                            animationsMap['textFieldOnPageLoadAnimation']!),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'rbob21j0' /* Avail Balance */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              widget.balance!.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation']!),
                        Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: ((_model.planDDValue == null ||
                                        _model.planDDValue == '') ||
                                    (_model.duartionDDValue == null ||
                                        _model.duartionDDValue == '') ||
                                    (_model.textController.text == ''))
                                ? null
                                : () async {
                                    HapticFeedback.lightImpact();
                                    _model.apiAiInvest = await AIInvestmentGroup
                                        .postPlanCall
                                        .call(
                                      currency: widget.currency,
                                      pair: widget.pair,
                                      planId: _model.planDDValue,
                                      durationId: _model.duartionDDValue,
                                      amount: double.tryParse(
                                          _model.textController.text),
                                      type: 'SPOT',
                                      accesstoken: FFAppState().accesstoken,
                                      csrftoken: FFAppState().csrftoken,
                                      sessionid: FFAppState().sessionId,
                                    );

                                    if ((_model.apiAiInvest?.succeeded ??
                                        true)) {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, -1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: ToastWidget(
                                                success: true,
                                                message: getJsonField(
                                                  (_model.apiAiInvest
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, -1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: ToastWidget(
                                                success: false,
                                                message: getJsonField(
                                                  (_model.apiAiInvest
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }

                                    setState(() {
                                      _model.planDDValueController?.reset();
                                      _model.duartionDDValueController?.reset();
                                    });
                                    setState(() {
                                      _model.textController?.clear();
                                    });

                                    setState(() {});
                                  },
                            text: FFLocalizations.of(context).getText(
                              'jjds0u4u' /* Invest */,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .darkBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              disabledColor:
                                  FlutterFlowTheme.of(context).alternate,
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation']!),
                        ),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  );
                } else {
                  return Container(
                    height: 350.0,
                    decoration: const BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.loadingModel,
                      updateCallback: () => setState(() {}),
                      child: const LoadingWidget(
                        dimension: 120,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
