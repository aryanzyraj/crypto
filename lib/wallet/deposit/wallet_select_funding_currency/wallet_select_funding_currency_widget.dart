import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'wallet_select_funding_currency_model.dart';
export 'wallet_select_funding_currency_model.dart';

class WalletSelectFundingCurrencyWidget extends StatefulWidget {
  const WalletSelectFundingCurrencyWidget({
    super.key,
    required this.currencyAction,
    required this.walletType,
    required this.action,
  });

  final Future Function(String? currency)? currencyAction;
  final String? walletType;
  final String? action;

  @override
  State<WalletSelectFundingCurrencyWidget> createState() =>
      _WalletSelectFundingCurrencyWidgetState();
}

class _WalletSelectFundingCurrencyWidgetState
    extends State<WalletSelectFundingCurrencyWidget>
    with TickerProviderStateMixin {
  late WalletSelectFundingCurrencyModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletSelectFundingCurrencyModel());

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
      'dropDownOnPageLoadAnimation': AnimationInfo(
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
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: FutureBuilder<ApiCallResponse>(
        future: WalletGroup.getWalletCurrenciesCall.call(
          action: widget.action,
          walletType: widget.walletType,
          accesstoken: FFAppState().accesstoken,
          csrftoken: FFAppState().csrftoken,
          sessionid: FFAppState().sessionId,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitDualRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            );
          }
          final containerGetWalletCurrenciesResponse = snapshot.data!;

          return Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxHeight: 250.0,
            ),
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
                          '6wx7kj2p' /* Select a Funding Currency */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation1']!),
                      Text(
                        FFLocalizations.of(context).getText(
                          'ox3z8be1' /* Pick one of the following curr... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation2']!),
                    ],
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??= '',
                    ),
                    options: List<String>.from(
                        WalletGroup.getWalletCurrenciesCall.valueList(
                      containerGetWalletCurrenciesResponse.jsonBody,
                    )!),
                    optionLabels: WalletGroup.getWalletCurrenciesCall.labelList(
                      containerGetWalletCurrenciesResponse.jsonBody,
                    )!,
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue = val);
                      _model.currency = _model.dropDownValue;
                      setState(() {});
                      await widget.currencyAction?.call(
                        _model.currency,
                      );
                    },
                    width: 300.0,
                    height: 56.0,
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
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'w5ls1z63' /* Please select... */,
                    ),
                    searchHintText: FFLocalizations.of(context).getText(
                      '3y2tbb08' /* Search for a currency... */,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: true,
                    isMultiSelect: false,
                  ).animateOnPageLoad(
                      animationsMap['dropDownOnPageLoadAnimation']!),
                ].divide(const SizedBox(height: 33.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
