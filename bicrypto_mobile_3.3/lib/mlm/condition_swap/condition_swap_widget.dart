import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'condition_swap_model.dart';
export 'condition_swap_model.dart';

class ConditionSwapWidget extends StatefulWidget {
  const ConditionSwapWidget({
    super.key,
    required this.swap,
    required this.conditionsC,
    bool? isList,
  }) : isList = isList ?? false;

  final bool? swap;
  final List<dynamic>? conditionsC;
  final bool isList;

  @override
  State<ConditionSwapWidget> createState() => _ConditionSwapWidgetState();
}

class _ConditionSwapWidgetState extends State<ConditionSwapWidget>
    with TickerProviderStateMixin {
  late ConditionSwapModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConditionSwapModel());

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.2, 0.2),
            end: const Offset(1.0, 1.0),
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
    return Builder(
      builder: (context) {
        if (!widget.isList) {
          return Builder(
            builder: (context) {
              if (widget.swap ?? false) {
                return Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: SizedBox(
                    width: 350.0,
                    height: 650.0,
                    child: Stack(
                      children: [
                        FlutterFlowSwipeableStack(
                          onSwipeFn: (index) {},
                          onLeftSwipe: (index) {},
                          onRightSwipe: (index) {},
                          onUpSwipe: (index) {},
                          onDownSwipe: (index) {},
                          itemBuilder: (context, index) {
                            return [
                              () => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/AF_AI.webp',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              () => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/AF_Welcome.webp',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              () => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/AF_TradeCommision.webp',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              () => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/AF_Staking.webp',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              () => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/AF_SHOP.webp',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              () => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/AF_P2P.webp',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              () => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/AF_MonthlyTrade.webp',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              () => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/AF_Investment.webp',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              () => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/AF_ICO.webp',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              () => ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/images/AF_Forex2.webp',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            ][index]();
                          },
                          itemCount: 10,
                          controller: _model.swipeableStackController,
                          loop: true,
                          cardDisplayCount: 3,
                          scale: 0.9,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['stackOnPageLoadAnimation']!),
                );
              } else {
                return Container(
                  width: 180.0,
                  height: 270.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Builder(
                        builder: (context) {
                          final list = widget.conditionsC!.toList();

                          return SizedBox(
                            width: double.infinity,
                            height: 140.0,
                            child: CarouselSlider.builder(
                              itemCount: list.length,
                              itemBuilder: (context, listIndex, _) {
                                final listItem = list[listIndex];
                                return Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        getJsonField(
                                          listItem,
                                          r'''$.title''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'PT Sans',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'vifcvaiu' /* Earn up to */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Text(
                                        '${getJsonField(
                                          listItem,
                                          r'''$.reward''',
                                        ).toString()} ${getJsonField(
                                          listItem,
                                          r'''$.rewardCurrency''',
                                        ).toString()}!',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontSize: 26.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        getJsonField(
                                          listItem,
                                          r'''$.description''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 9.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              carouselController: _model.carouselController ??=
                                  CarouselController(),
                              options: CarouselOptions(
                                initialPage: max(0, min(1, list.length - 1)),
                                viewportFraction: 1.0,
                                disableCenter: false,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.25,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayInterval:
                                    const Duration(milliseconds: (800 + 4000)),
                                autoPlayCurve: Curves.linear,
                                pauseAutoPlayInFiniteScroll: true,
                                onPageChanged: (index, _) =>
                                    _model.carouselCurrentIndex = index,
                              ),
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/rewardGIF.gif',
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.cover,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        } else {
          return Builder(
            builder: (context) {
              final listC = widget.conditionsC!.toList();

              return ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listC.length,
                separatorBuilder: (_, __) => const SizedBox(height: 1.0),
                itemBuilder: (context, listCIndex) {
                  final listCItem = listC[listCIndex];
                  return Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: FlutterFlowTheme.of(context).alternate,
                          offset: const Offset(
                            0.0,
                            1.0,
                          ),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getJsonField(
                              listCItem,
                              r'''$.title''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            getJsonField(
                              listCItem,
                              r'''$.description''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '0yt5njwg' /* Reward */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 6.0, 12.0, 6.0),
                                  child: Text(
                                    '${getJsonField(
                                      listCItem,
                                      r'''$.reward''',
                                    ).toString()} ${getJsonField(
                                      listCItem,
                                      r'''$.rewardCurrency''',
                                    ).toString()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
