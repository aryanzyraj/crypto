import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/components/toast/toast_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wallet/deposit/wallet_e_c_o_deposit/wallet_e_c_o_deposit_widget.dart';
import '/wallet/withdraw/wallet_e_c_o_withdraw/wallet_e_c_o_withdraw_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'wallet_select_payment_e_c_o_model.dart';
export 'wallet_select_payment_e_c_o_model.dart';

class WalletSelectPaymentECOWidget extends StatefulWidget {
  const WalletSelectPaymentECOWidget({
    super.key,
    required this.type,
    required this.code,
    required this.action,
  });

  final String? type;
  final String? code;
  final String? action;

  @override
  State<WalletSelectPaymentECOWidget> createState() =>
      _WalletSelectPaymentECOWidgetState();
}

class _WalletSelectPaymentECOWidgetState
    extends State<WalletSelectPaymentECOWidget> with TickerProviderStateMixin {
  late WalletSelectPaymentECOModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletSelectPaymentECOModel());

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
      'listViewOnPageLoadAnimation': AnimationInfo(
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
        future: WalletGroup.getWalletSingleCurrencyCall.call(
          type: widget.type,
          code: widget.code,
          action: widget.action,
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
          final containerGetWalletSingleCurrencyResponse = snapshot.data!;

          return Container(
            width: double.infinity,
            height: 480.0,
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
                          '0wg1cd7k' /* Select a Network */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation1']!),
                      Text(
                        FFLocalizations.of(context).getText(
                          'npqmssly' /* Pick one of the following curr... */,
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
                  Expanded(
                    child: Container(
                      height: WalletGroup.getWalletSingleCurrencyCall
                                  .methods(
                                    containerGetWalletSingleCurrencyResponse
                                        .jsonBody,
                                  )
                                  ?.length ==
                              1
                          ? 100.0
                          : 300.0,
                      constraints: const BoxConstraints(
                        maxHeight: 300.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final methodes = functions
                                    .walletEcoMapChains(
                                        containerGetWalletSingleCurrencyResponse
                                            .jsonBody)
                                    .toList();
                                if (methodes.isEmpty) {
                                  return const EmptyStateSimpleWidget(
                                    icon: Icon(
                                      Icons.payment_outlined,
                                    ),
                                    title: 'No Payment Methods',
                                    body: ' ',
                                  );
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: methodes.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 8.0),
                                  itemBuilder: (context, methodesIndex) {
                                    final methodesItem =
                                        methodes[methodesIndex];
                                    return Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          if (widget.action == 'deposit') {
                                            return Builder(
                                              builder: (context) => Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    _model.apiecoSystemDeposit =
                                                        await ECOSystemGroup
                                                            .getDepositAddressCall
                                                            .call(
                                                      currency: getJsonField(
                                                        methodesItem,
                                                        r'''$.chain''',
                                                      ).toString(),
                                                      accesstoken: FFAppState()
                                                          .accesstoken,
                                                      csrftoken: FFAppState()
                                                          .csrftoken,
                                                      sessionid: FFAppState()
                                                          .sessionId,
                                                      contractType:
                                                          getJsonField(
                                                        methodesItem,
                                                        r'''$.contractType''',
                                                      ).toString(),
                                                      chain: getJsonField(
                                                        methodesItem,
                                                        r'''$.chain''',
                                                      ).toString(),
                                                    );

                                                    if ((_model
                                                            .apiecoSystemDeposit
                                                            ?.succeeded ??
                                                        true)) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
                                                              child:
                                                                  WalletECODepositWidget(
                                                                type: widget
                                                                    .type!,
                                                                code: widget
                                                                    .code!,
                                                                address: functions.walletEcoMapAddress(
                                                                    ECOSystemGroup
                                                                        .getDepositAddressCall
                                                                        .adrress(
                                                                  (_model.apiecoSystemDeposit
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!),
                                                                currency: ECOSystemGroup
                                                                    .getDepositAddressCall
                                                                    .currency(
                                                                  (_model.apiecoSystemDeposit
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: const AlignmentDirectional(
                                                                    0.0, -1.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
                                                              child:
                                                                  ToastWidget(
                                                                success: false,
                                                                message:
                                                                    getJsonField(
                                                                  (_model.apiecoSystemDeposit
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

                                                    setState(() {});
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              '${FFAppConstants.Domain}${getJsonField(
                                                                methodesItem,
                                                                r'''$.icon''',
                                                              ).toString()}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        methodesItem,
                                                                        r'''$.chain''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Min :  ${getJsonField(
                                                                            methodesItem,
                                                                            r'''$.limits.deposit.min''',
                                                                          ) != null ? getJsonField(
                                                                          methodesItem,
                                                                          r'''$.limits.deposit.min''',
                                                                        ).toString() : '0'}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      'Max : ${getJsonField(
                                                                            methodesItem,
                                                                            r'''$.limits.deposit.max''',
                                                                          ) != null ? getJsonField(
                                                                          methodesItem,
                                                                          r'''$.limits.deposit.max''',
                                                                        ).toString() : 'Unlimited'}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color: (String var1) {
                                                                              return var1 == "gateways";
                                                                            }(getJsonField(
                                                                              methodesItem,
                                                                              r'''$.type''',
                                                                            ).toString())
                                                                                ? FlutterFlowTheme.of(context).secondary
                                                                                : FlutterFlowTheme.of(context).exchangeGreen,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Builder(
                                              builder: (context) => Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                WalletECOWithdrawWidget(
                                                              currency:
                                                                  widget.code!,
                                                              item:
                                                                  methodesItem,
                                                              type:
                                                                  getJsonField(
                                                                methodesItem,
                                                                r'''$.chain''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 45.0,
                                                            height: 45.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              '${FFAppConstants.Domain}${getJsonField(
                                                                methodesItem,
                                                                r'''$.icon''',
                                                              ).toString()}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        methodesItem,
                                                                        r'''$.chain''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Min :  ${getJsonField(
                                                                            methodesItem,
                                                                            r'''$.limits.deposit.min''',
                                                                          ) != null ? getJsonField(
                                                                          methodesItem,
                                                                          r'''$.limits.deposit.min''',
                                                                        ).toString() : '0'}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      'Max : ${getJsonField(
                                                                            methodesItem,
                                                                            r'''$.limits.deposit.max''',
                                                                          ) != null ? getJsonField(
                                                                          methodesItem,
                                                                          r'''$.limits.deposit.max''',
                                                                        ).toString() : 'Unlimited'}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color: (String var1) {
                                                                              return var1 == "gateways";
                                                                            }(getJsonField(
                                                                              methodesItem,
                                                                              r'''$.type''',
                                                                            ).toString())
                                                                                ? FlutterFlowTheme.of(context).secondary
                                                                                : FlutterFlowTheme.of(context).exchangeGreen,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ).animateOnPageLoad(animationsMap[
                                    'listViewOnPageLoadAnimation']!);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 33.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
