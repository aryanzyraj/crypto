import '/backend/api_requests/api_calls.dart';
import '/components/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmer/ecommerce_shimmer/ecommerce_shimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flip_card/flip_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'e_commerce_index_model.dart';
export 'e_commerce_index_model.dart';

class ECommerceIndexWidget extends StatefulWidget {
  const ECommerceIndexWidget({super.key});

  @override
  State<ECommerceIndexWidget> createState() => _ECommerceIndexWidgetState();
}

class _ECommerceIndexWidgetState extends State<ECommerceIndexWidget>
    with TickerProviderStateMixin {
  late ECommerceIndexModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasGridViewTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ECommerceIndexModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.apiCategoriesResult =
              await EcommerceGroup.getCategoriesCall.call(
            accesstoken: FFAppState().accesstoken,
            csrftoken: FFAppState().csrftoken,
            sessionid: FFAppState().sessionId,
          );

          if ((_model.apiCategoriesResult?.succeeded ?? true)) {
            _model.name = valueOrDefault<String>(
              EcommerceGroup.getCategoriesCall
                  .categoryName(
                    (_model.apiCategoriesResult?.jsonBody ?? ''),
                  )
                  ?.take(1)
                  .toList()
                  .first,
              '1',
            );
            setState(() {});
          }
        }),
        Future(() async {
          FFAppState().isOrderBookOpen = false;
          FFAppState().isWebSocketOpen = false;
        }),
      ]);
    });

    animationsMap.addAll({
      'carouselOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: const Offset(0, 0.349),
            end: const Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 35.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'gridViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 750.0.ms,
            begin: const Offset(0.0, 35.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'gridViewOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 35.0),
            end: const Offset(0.0, 0.0),
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
      animationsMap['gridViewOnPageLoadAnimation']!
          .controller
          .forward(from: 0.0);
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '9wkj9s3d' /* Shop */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Lexend',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        HapticFeedback.lightImpact();

                        context.pushNamed('ecommerceWishlist');
                      },
                      child: FaIcon(
                        FontAwesomeIcons.heart,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 22.0,
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'ecommerceOrderHistory',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.topToBottom,
                          ),
                        },
                      );
                    },
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 22.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    child: VerticalDivider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).accent4,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        'BicryptoHomePage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    },
                    child: Icon(
                      Icons.chevron_left_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 28.0,
                    ),
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        if (EcommerceGroup.getCategoriesCall.categoryName(
                                  (_model.apiCategoriesResult?.jsonBody ?? ''),
                                ) !=
                                null &&
                            (EcommerceGroup.getCategoriesCall.categoryName(
                              (_model.apiCategoriesResult?.jsonBody ?? ''),
                            ))!
                                .isNotEmpty) {
                          return Builder(
                            builder: (context) {
                              final getCategories =
                                  EcommerceGroup.getCategoriesCall
                                          .dataResult(
                                            (_model.apiCategoriesResult
                                                    ?.jsonBody ??
                                                ''),
                                          )
                                          ?.map((e) => e)
                                          .toList()
                                          .toList() ??
                                      [];
                              if (getCategories.isEmpty) {
                                return EmptyStateSimpleWidget(
                                  icon: Icon(
                                    Icons.remove_shopping_cart_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 44.0,
                                  ),
                                  title: 'No Categories Exist',
                                  body: ' ',
                                );
                              }

                              return SizedBox(
                                width: double.infinity,
                                height: 180.0,
                                child: CarouselSlider.builder(
                                  itemCount: getCategories.length,
                                  itemBuilder:
                                      (context, getCategoriesIndex, _) {
                                    final getCategoriesItem =
                                        getCategories[getCategoriesIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.name = getJsonField(
                                          getCategoriesItem,
                                          r'''$.name''',
                                        ).toString();
                                        setState(() {});
                                        if (animationsMap[
                                                'gridViewOnActionTriggerAnimation'] !=
                                            null) {
                                          setState(() =>
                                              hasGridViewTriggered = true);
                                          SchedulerBinding.instance
                                              .addPostFrameCallback((_) async =>
                                                  animationsMap[
                                                          'gridViewOnActionTriggerAnimation']!
                                                      .controller
                                                      .forward(from: 0.0));
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 0),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 0),
                                              imageUrl:
                                                  '${FFAppConstants.Domain}${getJsonField(
                                                getCategoriesItem,
                                                r'''$.image''',
                                              ).toString()}',
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                              errorWidget: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -0.79, 0.78),
                                            child: Text(
                                              getJsonField(
                                                getCategoriesItem,
                                                r'''$.name''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textColor,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  carouselController:
                                      _model.carouselController ??=
                                          CarouselController(),
                                  options: CarouselOptions(
                                    initialPage: max(
                                        0, min(2, getCategories.length - 1)),
                                    viewportFraction: 0.7,
                                    disableCenter: true,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.25,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: false,
                                    onPageChanged: (index, _) =>
                                        _model.carouselCurrentIndex = index,
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'carouselOnPageLoadAnimation']!);
                            },
                          );
                        } else {
                          return Container(
                            width: 300.0,
                            height: 180.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!);
                        }
                      },
                    ),
                  ],
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: EcommerceGroup.getCategoryByNameCall.call(
                              accesstoken: FFAppState().accesstoken,
                              csrftoken: FFAppState().csrftoken,
                              sessionid: FFAppState().sessionId,
                              name: _model.name,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: EcommerceShimmerWidget(),
                                );
                              }
                              final containerGetCategoryByNameResponse =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final products =
                                        EcommerceGroup.getCategoryByNameCall
                                                .productResult(
                                                  containerGetCategoryByNameResponse
                                                      .jsonBody,
                                                )
                                                ?.map((e) => e)
                                                .toList()
                                                .toList() ??
                                            [];
                                    if (products.isEmpty) {
                                      return EmptyStateSimpleWidget(
                                        icon: Icon(
                                          Icons
                                              .production_quantity_limits_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 60.0,
                                        ),
                                        title: 'No Products',
                                        body: ' ',
                                      );
                                    }

                                    return GridView.builder(
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        5.0,
                                        0,
                                        5.0,
                                      ),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.0,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: products.length,
                                      itemBuilder: (context, productsIndex) {
                                        final productsItem =
                                            products[productsIndex];
                                        return Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                            ),
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  HapticFeedback.lightImpact();

                                                  context.pushNamed(
                                                    'ecommerceProductDetail',
                                                    queryParameters: {
                                                      'name': serializeParam(
                                                        getJsonField(
                                                          productsItem,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Stack(
                                                  children: [
                                                    FlipCard(
                                                      fill: Fill.fillBack,
                                                      direction: FlipDirection
                                                          .HORIZONTAL,
                                                      speed: 400,
                                                      front: Container(
                                                        width: double.infinity,
                                                        height: 130.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor2,
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    12.0),
                                                          ),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            0),
                                                                fadeOutDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            0),
                                                                imageUrl:
                                                                    '${FFAppConstants.Domain}${getJsonField(
                                                                  productsItem,
                                                                  r'''$.image''',
                                                                ).toString()}',
                                                                width: 300.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorWidget: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: 300.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      back: Container(
                                                        width: double.infinity,
                                                        height: 130.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customColor2,
                                                              const Color(0x5700968A)
                                                            ],
                                                            stops: const [0.0, 1.0],
                                                            begin:
                                                                const AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            end:
                                                                const AlignmentDirectional(
                                                                    0, 1.0),
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    12.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          productsItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          productsItem,
                                                                          r'''$.description''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              fontFamily: 'Lexend',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.87),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      '${getJsonField(
                                                                        productsItem,
                                                                        r'''$.price''',
                                                                      ).toString()} ${getJsonField(
                                                                        productsItem,
                                                                        r'''$.currency''',
                                                                      ).toString()}',
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
                                                                    SizedBox(
                                                                      height:
                                                                          20.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            2.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        functions
                                                                            .ecommerceReviews(getJsonField(
                                                                          productsItem,
                                                                          r'''$.ecommerceReviews''',
                                                                          true,
                                                                        )),
                                                                        '0',
                                                                      ),
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
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                FaIcon(
                                                                  FontAwesomeIcons
                                                                      .shoppingBasket,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 18.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                        .animateOnPageLoad(animationsMap[
                                            'gridViewOnPageLoadAnimation']!)
                                        .animateOnActionTrigger(
                                            animationsMap[
                                                'gridViewOnActionTriggerAnimation']!,
                                            hasBeenTriggered:
                                                hasGridViewTriggered);
                                  },
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation2']!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
