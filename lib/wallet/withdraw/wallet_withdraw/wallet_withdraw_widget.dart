import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/wallet/deposit/wallet_select_funding_currency/wallet_select_funding_currency_widget.dart';
import '/wallet/deposit/wallet_select_payment_e_c_o/wallet_select_payment_e_c_o_widget.dart';
import '/wallet/deposit/wallet_select_payment_fiat/wallet_select_payment_fiat_widget.dart';
import '/wallet/deposit/wallet_select_payment_spot/wallet_select_payment_spot_widget.dart';
import '/wallet/deposit/wallet_select_wallet_type/wallet_select_wallet_type_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'wallet_withdraw_model.dart';
export 'wallet_withdraw_model.dart';

class WalletWithdrawWidget extends StatefulWidget {
  const WalletWithdrawWidget({super.key});

  @override
  State<WalletWithdrawWidget> createState() => _WalletWithdrawWidgetState();
}

class _WalletWithdrawWidgetState extends State<WalletWithdrawWidget>
    with TickerProviderStateMixin {
  late WalletWithdrawModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletWithdrawModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-71.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 550.0,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        wrapWithModel(
                          model: _model.walletSelectWalletTypeModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: WalletSelectWalletTypeWidget(
                            walletTypeAction: (walletType) async {
                              _model.walletType = walletType;
                              setState(() {});
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.walletSelectFundingCurrencyModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: WalletSelectFundingCurrencyWidget(
                            walletType: _model.walletType!,
                            action: 'withdraw',
                            currencyAction: (currency) async {
                              _model.currency = currency;
                              setState(() {});
                            },
                          ),
                        ),
                        Stack(
                          children: [
                            if (_model.walletType == 'FIAT')
                              wrapWithModel(
                                model: _model.walletSelectPaymentFiatModel,
                                updateCallback: () => setState(() {}),
                                child: WalletSelectPaymentFiatWidget(
                                  type: _model.walletType!,
                                  code: _model.currency!,
                                  action: 'withdraw',
                                ),
                              ),
                            if (_model.walletType == 'SPOT')
                              wrapWithModel(
                                model: _model.walletSelectPaymentSpotModel,
                                updateCallback: () => setState(() {}),
                                child: WalletSelectPaymentSpotWidget(
                                  type: _model.walletType!,
                                  code: _model.currency!,
                                  action: 'withdraw',
                                ),
                              ),
                            if (_model.walletType == 'ECO')
                              wrapWithModel(
                                model: _model.walletSelectPaymentECOModel,
                                updateCallback: () => setState(() {}),
                                child: WalletSelectPaymentECOWidget(
                                  type: _model.walletType!,
                                  code: _model.currency!,
                                  action: 'withdraw',
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                      child: smooth_page_indicator.SmoothPageIndicator(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        count: 3,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) async {
                          await _model.pageViewController!.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          setState(() {});
                        },
                        effect: smooth_page_indicator.ExpandingDotsEffect(
                          expansionFactor: 3.0,
                          spacing: 8.0,
                          radius: 16.0,
                          dotWidth: 16.0,
                          dotHeight: 8.0,
                          dotColor: FlutterFlowTheme.of(context).accent1,
                          activeDotColor: FlutterFlowTheme.of(context).primary,
                          paintStyle: PaintingStyle.stroke,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    HapticFeedback.lightImpact();
                    context.safePop();
                  },
                  text: FFLocalizations.of(context).getText(
                    'lk09t858' /* Back */,
                  ),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 50.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                if (_model.pageViewCurrentIndex < 2)
                  FFButtonWidget(
                    onPressed:
                        (_model.walletType == null || _model.walletType == '')
                            ? null
                            : () async {
                                HapticFeedback.lightImpact();
                                await _model.pageViewController?.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                    text: FFLocalizations.of(context).getText(
                      'wtxx9t2l' /* Continue */,
                    ),
                    icon: const Icon(
                      Icons.arrow_forward_outlined,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                      disabledColor: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
              ],
            ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
          ].divide(const SizedBox(height: 33.0)),
        ),
      ),
    );
  }
}
