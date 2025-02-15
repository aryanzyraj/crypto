import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/all_t_i_c_k_e_r_s_component_copy_widget.dart';
import '/components/k_y_c_warning_slider/k_y_c_warning_slider_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/all_addons/all_addons_widget.dart';
import '/home/home_slide_tickers/home_slide_tickers_widget.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import '/home/qrcontent/qrcontent_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:badges/badges.dart' as badges;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'bicrypto_home_page_model.dart';
export 'bicrypto_home_page_model.dart';

class BicryptoHomePageWidget extends StatefulWidget {
  const BicryptoHomePageWidget({super.key});

  @override
  State<BicryptoHomePageWidget> createState() => _BicryptoHomePageWidgetState();
}

class _BicryptoHomePageWidgetState extends State<BicryptoHomePageWidget>
    with TickerProviderStateMixin {
  late BicryptoHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BicryptoHomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.apiGETProfileResul =
              await AuthinticationGroup.getProfileCall.call(
            accesstoken: FFAppState().accesstoken,
            csrftoken: FFAppState().csrftoken,
            sessionid: FFAppState().sessionId,
          );

          if ((_model.apiGETProfileResul?.succeeded ?? true)) {
            FFAppState().userID = AuthinticationGroup.getProfileCall.id(
              (_model.apiGETProfileResul?.jsonBody ?? ''),
            )!;
            FFAppState().kycStatus =
                AuthinticationGroup.getProfileCall.kycStatus(
                              (_model.apiGETProfileResul?.jsonBody ?? ''),
                            ) !=
                            null &&
                        AuthinticationGroup.getProfileCall.kycStatus(
                              (_model.apiGETProfileResul?.jsonBody ?? ''),
                            ) !=
                            ''
                    ? AuthinticationGroup.getProfileCall.kycStatus(
                        (_model.apiGETProfileResul?.jsonBody ?? ''),
                      )!
                    : ' ';
            unawaited(
              () async {
                await actions.userAuth(
                  FFAppState().userID,
                );
              }(),
            );
          } else {
            _model.apiLogout = await AuthinticationGroup.logoutCall.call(
              accesstoken: FFAppState().accesstoken,
              csrftoken: FFAppState().csrftoken,
              sessionid: FFAppState().sessionId,
            );

            if ((_model.apiLogout?.succeeded ?? true)) {
              GoRouter.of(context).prepareAuthEvent();
              await authManager.signOut();
              GoRouter.of(context).clearRedirectLocation();
            }

            context.goNamedAuth(
              'loginPage',
              context.mounted,
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            return;
          }
        }),
        Future(() async {
          _model.apiSliders = await BlogGroup.slidersCall.call(
            accesstoken: FFAppState().accesstoken,
            csrftoken: FFAppState().csrftoken,
            sessionid: FFAppState().sessionId,
          );
        }),
      ]);
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 6000.0.ms,
            duration: 300.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.2, 1.2),
          ),
          ShakeEffect(
            curve: Curves.easeIn,
            delay: 6300.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: const Offset(0.0, 0.0),
            rotation: 0.087,
          ),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 7300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.2, 1.2),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 2000.0.ms,
            duration: 2000.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0,
          ),
        ],
      ),
      'kYCWarningSliderOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 5000.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 5000.0.ms,
            duration: 600.0.ms,
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              SingleChildScrollView(
                controller: _model.scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StickyHeader(
                      overlapHeaders: true,
                      header: Stack(
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(
                                milliseconds:
                                    150), // Smooth transition for 500ms
                            opacity:
                                _model.scrollValue, // Dynamically set opacity
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 55.0, 12.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    HapticFeedback.lightImpact();

                                    context.goNamed(
                                      'MY_profilePage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey:
                                            const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                        ),
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? 'assets/images/solar--user-rounded-bold.svg'
                                          : 'assets/images/solar--user-rounded-bold_(1).svg',
                                      width: 25.0,
                                      height: 25.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.goNamed('exchangeAllTickers');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.search,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 22.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9fku79s6' /* Search pairs... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      HapticFeedback.lightImpact();
                                      _model.scannerResult =
                                          await FlutterBarcodeScanner
                                              .scanBarcode(
                                        '#C62828', // scanning line color
                                        FFLocalizations.of(context).getText(
                                          'l3ccjv57' /* Cancel */,
                                        ), // cancel button text
                                        true, // whether to show the flash icon
                                        ScanMode.QR,
                                      );

                                      if (_model.scannerResult != '') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(
                                                          0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          dialogContext)
                                                      .unfocus(),
                                                  child: QrcontentWidget(
                                                    code: _model.scannerResult,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }

                                      setState(() {});
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? 'assets/images/solar--qr-code-bold.svg'
                                            : 'assets/images/solar--qr-code-bold_(1).svg',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    HapticFeedback.lightImpact();

                                    context.goNamed(
                                      'support_TicketList',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey:
                                            const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                        ),
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? 'assets/images/solar--headphones-round-bold.svg'
                                          : 'assets/images/solar--headphones-round-bold_(1).svg',
                                      width: 25.0,
                                      height: 25.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.lightImpact();

                                            context.pushNamed('notifications');
                                          },
                                          child: badges.Badge(
                                            badgeContent: Text(
                                              FFAppState()
                                                      .notifications
                                                      .isNotEmpty
                                                  ? FFAppState()
                                                      .notifications
                                                      .length
                                                      .toString()
                                                  : '0',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            showBadge: true,
                                            shape: badges.BadgeShape.circle,
                                            badgeColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            elevation: 4.0,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(5.0, 5.0, 5.0, 5.0),
                                            position:
                                                badges.BadgePosition.topEnd(),
                                            animationType:
                                                badges.BadgeAnimationType.scale,
                                            toAnimate: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SvgPicture.asset(
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? 'assets/images/solar--bell-bold.svg'
                                                    : 'assets/images/solar--bell-bold_(1).svg',
                                                width: 25.0,
                                                height: 25.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(const SizedBox(width: 6.0)),
                                ),
                              ].divide(const SizedBox(width: 12.0)),
                            ),
                          ),
                        ],
                      ),
                      content: Stack(
                        children: [
                          Builder(
                            builder: (context) {
                              final sliders = BlogGroup.slidersCall
                                      .sliders(
                                        (_model.apiSliders?.jsonBody ?? ''),
                                      )
                                      ?.toList() ??
                                  [];
                              if (sliders.isEmpty) {
                                return Image.network(
                                  'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8Zm9yZXh8ZW58MHx8fHwxNzIwNzk2OTY5fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                );
                              }

                              return SizedBox(
                                width: double.infinity,
                                height: 220.0,
                                child: Stack(
                                  children: [
                                    PageView.builder(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: max(0,
                                                  min(0, sliders.length - 1))),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: sliders.length,
                                      itemBuilder: (context, slidersIndex) {
                                        final slidersItem =
                                            sliders[slidersIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (getJsonField(
                                                  slidersItem,
                                                  r'''$.link''',
                                                ) !=
                                                null) {
                                              context.pushNamed(
                                                'urlLunch',
                                                queryParameters: {
                                                  'url': serializeParam(
                                                    getJsonField(
                                                      slidersItem,
                                                      r'''$.link''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              getJsonField(
                                                        slidersItem,
                                                        r'''$.image''',
                                                      ) !=
                                                      null
                                                  ? '${FFAppConstants.Domain}${getJsonField(
                                                      slidersItem,
                                                      r'''$.image''',
                                                    ).toString()}'
                                                  : 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8Zm9yZXh8ZW58MHx8fHwxNzIwNzk2OTY5fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(1.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16.0, 0.0, 16.0, 16.0),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: max(
                                                      0,
                                                      min(0,
                                                          sliders.length - 1))),
                                          count: sliders.length,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) async {
                                            await _model.pageViewController!
                                                .animateToPage(
                                              i,
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                            setState(() {});
                                          },
                                          effect:
                                              smooth_page_indicator.SlideEffect(
                                            spacing: 0.0,
                                            radius: 0.0,
                                            dotWidth: 16.0,
                                            dotHeight: 6.0,
                                            dotColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 210.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              6.0, 0.0, 6.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.campaign_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ).animateOnPageLoad(animationsMap[
                                              'iconOnPageLoadAnimation']!),
                                          Expanded(
                                            child: Builder(
                                              builder: (context) {
                                                if (FFAppState()
                                                    .announcements
                                                    .isNotEmpty) {
                                                  return Builder(
                                                    builder: (context) {
                                                      final announcement =
                                                          FFAppState()
                                                              .announcements
                                                              .toList();

                                                      return SizedBox(
                                                        width: double.infinity,
                                                        height: 30.0,
                                                        child: CarouselSlider
                                                            .builder(
                                                          itemCount:
                                                              announcement
                                                                  .length,
                                                          itemBuilder: (context,
                                                              announcementIndex,
                                                              _) {
                                                            final announcementItem =
                                                                announcement[
                                                                    announcementIndex];
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      announcementItem,
                                                                      r'''$.message''',
                                                                    ).toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          carouselController: _model
                                                                  .carouselController ??=
                                                              CarouselController(),
                                                          options:
                                                              CarouselOptions(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    1,
                                                                    announcement
                                                                            .length -
                                                                        1)),
                                                            viewportFraction:
                                                                1.0,
                                                            disableCenter: true,
                                                            enlargeCenterPage:
                                                                true,
                                                            enlargeFactor: 0.25,
                                                            enableInfiniteScroll:
                                                                true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            autoPlay: true,
                                                            autoPlayAnimationDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        800),
                                                            autoPlayInterval:
                                                                const Duration(
                                                                    milliseconds:
                                                                        (800 +
                                                                            2000)),
                                                            autoPlayCurve:
                                                                Curves.linear,
                                                            pauseAutoPlayInFiniteScroll:
                                                                true,
                                                            onPageChanged: (index,
                                                                    _) =>
                                                                _model.carouselCurrentIndex =
                                                                    index,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0.0, 3.0, 0.0, 0.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation']!),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'announcement',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .leftToRight,
                                                  ),
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.menu_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 180.0,
                                        decoration: const BoxDecoration(),
                                        child: wrapWithModel(
                                          model: _model.allAddonsModel,
                                          updateCallback: () => setState(() {}),
                                          child: const AllAddonsWidget(),
                                        ),
                                      ),
                                    ),
                                    FutureBuilder<ApiCallResponse>(
                                      future: FFAppState().allMarket(
                                        requestFn: () => ExchangeGroup
                                            .getAllMarketsCall
                                            .call(
                                          accesstoken: FFAppState().accesstoken,
                                          csrftoken: FFAppState().csrftoken,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return const SizedBox(
                                            width: double.infinity,
                                            height: 420.0,
                                            child: LoadingWidget(
                                              dimension: 80,
                                            ),
                                          );
                                        }
                                        final columnGetAllMarketsResponse =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 4.0, 0.0, 0.0),
                                              child: wrapWithModel(
                                                model: _model
                                                    .homeSlideTickersModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child:
                                                    const HomeSlideTickersWidget(),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 0.0, 100.0),
                                              child: Container(
                                                height: 400.0,
                                                decoration:
                                                    const BoxDecoration(),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .allTICKERSComponentCopyModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      const AllTICKERSComponentCopyWidget(
                                                    isAllTickers: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => setState(() {}),
                  child: const NavBarWidget(
                    activePage: 1,
                  ),
                ),
              ),
              if (FFAppConstants.KYCStatus &&
                  (AuthinticationGroup.getProfileCall.kycStatus(
                            (_model.apiGETProfileResul?.jsonBody ?? ''),
                          ) ==
                          null ||
                      AuthinticationGroup.getProfileCall.kycStatus(
                            (_model.apiGETProfileResul?.jsonBody ?? ''),
                          ) ==
                          ''))
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 74.0),
                  child: wrapWithModel(
                    model: _model.kYCWarningSliderModel,
                    updateCallback: () => setState(() {}),
                    child: const KYCWarningSliderWidget(),
                  ).animateOnPageLoad(
                      animationsMap['kYCWarningSliderOnPageLoadAnimation']!),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
