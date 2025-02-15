import '/backend/api_requests/api_calls.dart';
import '/components/toast/toast_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'new_transfer_component_model.dart';
export 'new_transfer_component_model.dart';

class NewTransferComponentWidget extends StatefulWidget {
  const NewTransferComponentWidget({
    super.key,
    bool? isWallets,
  }) : isWallets = isWallets ?? true;

  final bool isWallets;

  @override
  State<NewTransferComponentWidget> createState() =>
      _NewTransferComponentWidgetState();
}

class _NewTransferComponentWidgetState
    extends State<NewTransferComponentWidget> {
  late NewTransferComponentModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewTransferComponentModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.clientIdTextController ??= TextEditingController();
    _model.clientIdFocusNode ??= FocusNode();

    _model.amountTextController ??= TextEditingController();
    _model.amountFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 22.0, 12.0, 22.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!widget.isWallets)
                  TextFormField(
                    controller: _model.clientIdTextController,
                    focusNode: _model.clientIdFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.clientIdTextController',
                      const Duration(milliseconds: 100),
                      () => setState(() {}),
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.go,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'k905fp2o' /* Client ID */,
                      ),
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        'wratgmsd' /* Entre Client ID */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
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
                    validator: _model.clientIdTextControllerValidator
                        .asValidator(context),
                  ),
                FlutterFlowDropDown<String>(
                  controller: _model.walletDDValueController ??=
                      FormFieldController<String>(
                    _model.walletDDValue ??= '',
                  ),
                  options:
                      List<String>.from(['FIAT', 'SPOT', 'ECO', 'FUTURES']),
                  optionLabels: [
                    FFLocalizations.of(context).getText(
                      'gocj61x4' /* Fiat */,
                    ),
                    FFLocalizations.of(context).getText(
                      'merl9hog' /* Spot */,
                    ),
                    FFLocalizations.of(context).getText(
                      'zv7x65pn' /* Funding */,
                    ),
                    FFLocalizations.of(context).getText(
                      '61jgk0s0' /* Futures */,
                    )
                  ],
                  onChanged: (val) async {
                    setState(() => _model.walletDDValue = val);
                    await Future.wait([
                      Future(() async {
                        _model.apiWalletCurrencyFetched = false;
                        _model.apiWalletCurrency =
                            await WalletGroup.getWalletCurrenciesCall.call(
                          action: 'transfer',
                          walletType: _model.walletDDValue,
                          targetWalletType: _model.walletDDValue,
                          accesstoken: FFAppState().accesstoken,
                          csrftoken: FFAppState().csrftoken,
                          sessionid: FFAppState().sessionId,
                        );

                        if ((_model.apiWalletCurrency?.succeeded ?? true)) {
                          _model.apiWalletCurrencyFetched = true;
                          setState(() {});
                        }
                      }),
                      Future(() async {
                        setState(() {
                          _model.targetDDValueController?.reset();
                          _model.currencyDDValueController?.reset();
                          _model.targetcurrencyDDValueController?.reset();
                        });
                      }),
                    ]);

                    setState(() {});
                  },
                  width: double.infinity,
                  height: 56.0,
                  textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'p5afla9y' /* Select a Wallet Type */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
                FlutterFlowDropDown<String>(
                  controller: _model.targetDDValueController ??=
                      FormFieldController<String>(
                    _model.targetDDValue ??= '',
                  ),
                  options: List<String>.from(
                      _model.walletDDValue != null && _model.walletDDValue != ''
                          ? ((String var1) {
                              return (var1.toUpperCase() == 'SPOT'
                                      ? ['FIAT', 'ECO']
                                      : (var1.toUpperCase() == 'FIAT'
                                          ? ['SPOT', 'ECO']
                                          : (var1.toUpperCase() == 'ECO'
                                              ? ['FIAT', 'SPOT', 'FUTURES']
                                              : (var1.toUpperCase() == 'FUTURES'
                                                  ? ['ECO']
                                                  : []))))
                                  .cast<String>();
                            }(_model.walletDDValue!))
                          : _model.emptyList),
                  optionLabels:
                      _model.walletDDValue != null && _model.walletDDValue != ''
                          ? ((String var1) {
                              return (var1.toUpperCase() == 'SPOT'
                                      ? ['Fiat', 'Funding']
                                      : (var1.toUpperCase() == 'FIAT'
                                          ? ['Spot', 'Funding']
                                          : (var1.toUpperCase() == 'ECO'
                                              ? ['Fiat', 'Spot', 'Futures']
                                              : (var1.toUpperCase() == 'FUTURES'
                                                  ? ['Funding']
                                                  : []))))
                                  .cast<String>();
                            }(_model.walletDDValue!))
                          : _model.emptyList,
                  onChanged: (val) async {
                    setState(() => _model.targetDDValue = val);
                    _model.apiWalletCurrencyFetched = false;
                    _model.apiWalletCurrencyTarget =
                        await WalletGroup.getWalletCurrenciesCall.call(
                      action: 'transfer',
                      walletType: _model.walletDDValue,
                      targetWalletType: _model.targetDDValue,
                      accesstoken: FFAppState().accesstoken,
                      csrftoken: FFAppState().csrftoken,
                      sessionid: FFAppState().sessionId,
                    );

                    if ((_model.apiWalletCurrencyTarget?.succeeded ?? true)) {
                      _model.apiWalletCurrencyFetched = true;
                      setState(() {});
                    }

                    setState(() {});
                  },
                  width: double.infinity,
                  height: 56.0,
                  textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'xad92om6' /* Target Wallet Type */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  disabled: _model.walletDDValue == null ||
                      _model.walletDDValue == '',
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
                FlutterFlowDropDown<String>(
                  controller: _model.currencyDDValueController ??=
                      FormFieldController<String>(
                    _model.currencyDDValue ??= '',
                  ),
                  options: List<String>.from(() {
                    if (_model.apiWalletCurrencyFetched && !widget.isWallets) {
                      return WalletGroup.getWalletCurrenciesCall.frmValue(
                        (_model.apiWalletCurrency?.jsonBody ?? ''),
                      )!;
                    } else if (_model.apiWalletCurrencyFetched &&
                        widget.isWallets &&
                        (_model.targetDDValue != null &&
                            _model.targetDDValue != '')) {
                      return WalletGroup.getWalletCurrenciesCall.frmValue(
                        (_model.apiWalletCurrencyTarget?.jsonBody ?? ''),
                      )!;
                    } else {
                      return _model.emptyList;
                    }
                  }()),
                  optionLabels: () {
                    if (_model.apiWalletCurrencyFetched && !widget.isWallets) {
                      return WalletGroup.getWalletCurrenciesCall.fromLabel(
                        (_model.apiWalletCurrency?.jsonBody ?? ''),
                      )!;
                    } else if (_model.apiWalletCurrencyFetched &&
                        widget.isWallets &&
                        (_model.targetDDValue != null &&
                            _model.targetDDValue != '')) {
                      return WalletGroup.getWalletCurrenciesCall.fromLabel(
                        (_model.apiWalletCurrencyTarget?.jsonBody ?? ''),
                      )!;
                    } else {
                      return _model.emptyList;
                    }
                  }(),
                  onChanged: (val) =>
                      setState(() => _model.currencyDDValue = val),
                  width: double.infinity,
                  height: 56.0,
                  textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    '825a9w4b' /* Source Currency */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  disabled: !_model.apiWalletCurrencyFetched,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
                if (widget.isWallets)
                  FlutterFlowDropDown<String>(
                    controller: _model.targetcurrencyDDValueController ??=
                        FormFieldController<String>(
                      _model.targetcurrencyDDValue ??= '',
                    ),
                    options: List<String>.from(() {
                      if (_model.apiWalletCurrencyFetched &&
                          !widget.isWallets) {
                        return WalletGroup.getWalletCurrenciesCall.toValue(
                          (_model.apiWalletCurrency?.jsonBody ?? ''),
                        )!;
                      } else if (_model.apiWalletCurrencyFetched &&
                          widget.isWallets &&
                          (_model.targetDDValue != null &&
                              _model.targetDDValue != '')) {
                        return WalletGroup.getWalletCurrenciesCall.toValue(
                          (_model.apiWalletCurrencyTarget?.jsonBody ?? ''),
                        )!;
                      } else {
                        return _model.emptyList;
                      }
                    }()),
                    optionLabels: () {
                      if (_model.apiWalletCurrencyFetched &&
                          !widget.isWallets) {
                        return WalletGroup.getWalletCurrenciesCall.toLabel(
                          (_model.apiWalletCurrency?.jsonBody ?? ''),
                        )!;
                      } else if (_model.apiWalletCurrencyFetched &&
                          widget.isWallets &&
                          (_model.targetDDValue != null &&
                              _model.targetDDValue != '')) {
                        return WalletGroup.getWalletCurrenciesCall.toLabel(
                          (_model.apiWalletCurrencyTarget?.jsonBody ?? ''),
                        )!;
                      } else {
                        return _model.emptyList;
                      }
                    }(),
                    onChanged: (val) =>
                        setState(() => _model.targetcurrencyDDValue = val),
                    width: double.infinity,
                    height: 56.0,
                    textStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      '6zw4y2al' /* Target Currency */,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    disabled: !_model.apiWalletCurrencyFetched,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _model.amountTextController,
                      focusNode: _model.amountFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.amountTextController',
                        const Duration(milliseconds: 100),
                        () => setState(() {}),
                      ),
                      autofocus: false,
                      textInputAction: TextInputAction.go,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'my3roxmv' /* Amount */,
                        ),
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          '3eeaagbb' /* Entre Amount */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                      validator: _model.amountTextControllerValidator
                          .asValidator(context),
                    ),
                  ].divide(const SizedBox(height: 3.0)),
                ),
              ].divide(const SizedBox(height: 22.0)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 45.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Expanded(
                  child: Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        HapticFeedback.lightImpact();
                        if (widget.isWallets) {
                          _model.apiTransferWallet =
                              await WalletGroup.walletTransferCall.call(
                            fromType: _model.walletDDValue,
                            toType: _model.targetDDValue,
                            amount:
                                int.tryParse(_model.amountTextController.text),
                            accesstoken: FFAppState().accesstoken,
                            csrftoken: FFAppState().csrftoken,
                            sessionid: FFAppState().sessionId,
                            transferType: 'wallet',
                            fromCurrency: _model.currencyDDValue,
                            toCurrency: _model.targetcurrencyDDValue,
                          );

                          if ((_model.apiTransferWallet?.succeeded ?? true)) {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: ToastWidget(
                                      success: true,
                                      message: getJsonField(
                                        (_model.apiTransferWallet?.jsonBody ??
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
                                  alignment: const AlignmentDirectional(0.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: ToastWidget(
                                      success: false,
                                      message: getJsonField(
                                        (_model.apiTransferWallet?.jsonBody ??
                                            ''),
                                        r'''$.message''',
                                      ).toString(),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        } else {
                          _model.apiTransferClient =
                              await WalletGroup.walletTransferCall.call(
                            fromType: _model.walletDDValue,
                            toType: _model.walletDDValue,
                            amount:
                                int.tryParse(_model.amountTextController.text),
                            accesstoken: FFAppState().accesstoken,
                            csrftoken: FFAppState().csrftoken,
                            sessionid: FFAppState().sessionId,
                            currency: _model.currencyDDValue,
                            transferType: 'client',
                            clientId: _model.clientIdTextController.text,
                          );

                          if ((_model.apiTransferClient?.succeeded ?? true)) {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: ToastWidget(
                                      success: true,
                                      message: getJsonField(
                                        (_model.apiTransferClient?.jsonBody ??
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
                                  alignment: const AlignmentDirectional(0.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: ToastWidget(
                                      success: false,
                                      message: getJsonField(
                                        (_model.apiTransferClient?.jsonBody ??
                                            ''),
                                        r'''$.message''',
                                      ).toString(),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'jzby4ylx' /* Transfer */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Lexend',
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                              letterSpacing: 0.0,
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
