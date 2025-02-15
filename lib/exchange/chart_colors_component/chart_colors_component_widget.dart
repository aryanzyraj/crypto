import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:provider/provider.dart';
import 'chart_colors_component_model.dart';
export 'chart_colors_component_model.dart';

class ChartColorsComponentWidget extends StatefulWidget {
  const ChartColorsComponentWidget({
    super.key,
    required this.symbol,
  });

  final String? symbol;

  @override
  State<ChartColorsComponentWidget> createState() =>
      _ChartColorsComponentWidgetState();
}

class _ChartColorsComponentWidgetState extends State<ChartColorsComponentWidget>
    with TickerProviderStateMixin {
  late ChartColorsComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChartColorsComponentModel());

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1000.0.ms,
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
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      alignment: const AlignmentDirectional(0.0, 1.0),
      children: [
        Material(
          color: Colors.transparent,
          elevation: 2.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOutQuint,
            width: double.infinity,
            height: valueOrDefault<double>(
              _model.hight.toDouble(),
              320.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    width: 50.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '31jef6lq' /* Chart Setting */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).secondaryText,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          _model.hight = 0;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'jg2wx2pm' /* Chart Mode */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: FlutterFlowChoiceChips(
                                  options: [
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      '1mewxtrv' /* Original */,
                                    )),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      '5hurnqhq' /* TradingView */,
                                    ))
                                  ],
                                  onChanged: (val) async {
                                    setState(() => _model.choiceChipsValue =
                                        val?.firstOrNull);
                                    if (_model.choiceChipsValue == 'Original') {
                                      FFAppState().isTradeView = false;
                                      setState(() {});
                                    } else {
                                      FFAppState().isTradeView = true;
                                      setState(() {});
                                    }

                                    _model.hight = 0;
                                    setState(() {});
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    iconSize: 18.0,
                                    elevation: 4.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 18.0,
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  chipSpacing: 12.0,
                                  rowSpacing: 12.0,
                                  multiselect: false,
                                  initialized: _model.choiceChipsValue != null,
                                  alignment: WrapAlignment.end,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                    [
                                      FFAppState().isTradeView
                                          ? 'TradingView'
                                          : 'Original'
                                    ],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '7sc8lb9p' /* up Candle */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.circle_sharp,
                                    color: FFAppState().upCandle,
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final colorPicked1Color =
                                    await showFFColorPicker(
                                  context,
                                  currentColor: _model.colorPicked1 ??=
                                      FlutterFlowTheme.of(context).tertiary,
                                  showRecentColors: true,
                                  allowOpacity: true,
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  secondaryTextColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  primaryButtonBackgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  primaryButtonTextColor: Colors.white,
                                  primaryButtonBorderColor: Colors.transparent,
                                  displayAsBottomSheet: isMobileWidth(context),
                                );

                                if (colorPicked1Color != null) {
                                  safeSetState(() =>
                                      _model.colorPicked1 = colorPicked1Color);
                                }

                                FFAppState().upCandle = _model.colorPicked1!;
                                setState(() {});
                                _model.hight = 0;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.color_lens_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'na1i03ki' /* down Candle */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.circle,
                                    color: FFAppState().downCandle,
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final colorPicked2Color =
                                    await showFFColorPicker(
                                  context,
                                  currentColor: _model.colorPicked2 ??=
                                      FlutterFlowTheme.of(context).primary,
                                  showRecentColors: true,
                                  allowOpacity: true,
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  secondaryTextColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  primaryButtonBackgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  primaryButtonTextColor: Colors.white,
                                  primaryButtonBorderColor: Colors.transparent,
                                  displayAsBottomSheet: isMobileWidth(context),
                                );

                                if (colorPicked2Color != null) {
                                  safeSetState(() =>
                                      _model.colorPicked2 = colorPicked2Color);
                                }

                                FFAppState().downCandle = _model.colorPicked2!;
                                setState(() {});
                                _model.hight = 0;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.color_lens_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          elevation: 2.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Container(
            height: 90.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        HapticFeedback.lightImpact();
                        if (animationsMap['iconOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['iconOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0);
                        }
                        _model.hight = 320;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.settings_outlined,
                            color: _model.hight == 0
                                ? FlutterFlowTheme.of(context).secondaryText
                                : FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ).animateOnActionTrigger(
                            animationsMap['iconOnActionTriggerAnimation']!,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: FFButtonWidget(
                        onPressed: () async {
                          HapticFeedback.lightImpact();

                          context.goNamed(
                            'exchangeTrade',
                            queryParameters: {
                              'pair': serializeParam(
                                widget.symbol,
                                ParamType.String,
                              ),
                              'comeFromMarket': serializeParam(
                                true,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.scale,
                                alignment: Alignment.bottomCenter,
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          '5wx2zo2b' /* BUY */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).exchangeGreen,
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
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: FFButtonWidget(
                        onPressed: () async {
                          HapticFeedback.lightImpact();

                          context.goNamed(
                            'exchangeTrade',
                            queryParameters: {
                              'comeFromMarket': serializeParam(
                                true,
                                ParamType.bool,
                              ),
                              'pair': serializeParam(
                                widget.symbol,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.scale,
                                alignment: Alignment.bottomCenter,
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          '30zm84k5' /* SELL */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).errorRed,
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
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
