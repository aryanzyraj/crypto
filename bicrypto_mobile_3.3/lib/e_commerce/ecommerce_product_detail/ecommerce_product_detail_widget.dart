import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/e_commerce/ecommerce_reviews/ecommerce_reviews_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'ecommerce_product_detail_model.dart';
export 'ecommerce_product_detail_model.dart';

class EcommerceProductDetailWidget extends StatefulWidget {
  const EcommerceProductDetailWidget({
    super.key,
    required this.name,
  });

  final String? name;

  @override
  State<EcommerceProductDetailWidget> createState() =>
      _EcommerceProductDetailWidgetState();
}

class _EcommerceProductDetailWidgetState
    extends State<EcommerceProductDetailWidget> with TickerProviderStateMixin {
  late EcommerceProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasConditionalBuilderTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EcommerceProductDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiWishlistResult = await EcommerceGroup.wishlistCall.call(
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      );

      if ((_model.apiWishlistResult?.succeeded ?? true)) {
        if (functions.ecommerceWishlist(
            widget.name!,
            EcommerceGroup.wishlistCall
                .productResult(
                  (_model.apiWishlistResult?.jsonBody ?? ''),
                )!
                .toList())) {
          _model.wishlistBtn = true;
          setState(() {});
        }
      }
    });

    animationsMap.addAll({
      'conditionalBuilderOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(1.2, 1.2),
            end: const Offset(1.0, 1.0),
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: EcommerceGroup.producctByNameCall.call(
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
        name: widget.name,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const LoadingWidget(
              dimension: 150,
            ),
          );
        }
        final ecommerceProductDetailProducctByNameResponse = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 400.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (EcommerceGroup.producctByNameCall.image(
                                            ecommerceProductDetailProducctByNameResponse
                                                .jsonBody,
                                          ) !=
                                          null &&
                                      EcommerceGroup.producctByNameCall.image(
                                            ecommerceProductDetailProducctByNameResponse
                                                .jsonBody,
                                          ) !=
                                          '') {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    const Duration(milliseconds: 500),
                                                imageUrl:
                                                    '${FFAppConstants.Domain}${EcommerceGroup.producctByNameCall.image(
                                                  ecommerceProductDetailProducctByNameResponse
                                                      .jsonBody,
                                                )}',
                                                fit: BoxFit.contain,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              allowRotation: false,
                                              tag:
                                                  '${FFAppConstants.Domain}${EcommerceGroup.producctByNameCall.image(
                                                ecommerceProductDetailProducctByNameResponse
                                                    .jsonBody,
                                              )}',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag:
                                            '${FFAppConstants.Domain}${EcommerceGroup.producctByNameCall.image(
                                          ecommerceProductDetailProducctByNameResponse
                                              .jsonBody,
                                        )}',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl:
                                                '${FFAppConstants.Domain}${EcommerceGroup.producctByNameCall.image(
                                              ecommerceProductDetailProducctByNameResponse
                                                  .jsonBody,
                                            )}',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                            errorWidget:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    const Duration(milliseconds: 500),
                                                imageUrl:
                                                    'https://images.unsplash.com/photo-1626544827763-d516dce335e2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxkZWdpdGFsJTIwcHJvZHVjdHxlbnwwfHx8fDE3MDg3MTQ4Mjh8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                fit: BoxFit.contain,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              allowRotation: false,
                                              tag: 'productShoe',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: 'productShoe',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl:
                                                'https://images.unsplash.com/photo-1626544827763-d516dce335e2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxkZWdpdGFsJTIwcHJvZHVjdHxlbnwwfHx8fDE3MDg3MTQ4Mjh8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                            errorWidget:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 32.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            elevation: 5.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              buttonSize: 46.0,
                                              icon: const Icon(
                                                Icons.arrow_back_rounded,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              onPressed: () async {
                                                HapticFeedback.lightImpact();
                                                context.pop();
                                              },
                                            ),
                                          ),
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            elevation: 5.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                if (!_model.wishlistBtn) {
                                                  return FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    buttonSize: 46.0,
                                                    icon: const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.white,
                                                      size: 25.0,
                                                    ),
                                                    onPressed: () async {
                                                      _model.apiAddTWResult =
                                                          await EcommerceGroup
                                                              .addToWishlistCall
                                                              .call(
                                                        productId: EcommerceGroup
                                                            .producctByNameCall
                                                            .productID(
                                                          ecommerceProductDetailProducctByNameResponse
                                                              .jsonBody,
                                                        ),
                                                        accesstoken:
                                                            FFAppState()
                                                                .accesstoken,
                                                        csrftoken: FFAppState()
                                                            .csrftoken,
                                                        sessionid: FFAppState()
                                                            .sessionId,
                                                      );

                                                      if ((_model.apiAddTWResult
                                                              ?.succeeded ??
                                                          true)) {
                                                        if (animationsMap[
                                                                'conditionalBuilderOnActionTriggerAnimation'] !=
                                                            null) {
                                                          setState(() =>
                                                              hasConditionalBuilderTriggered =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'conditionalBuilderOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                        _model.wishlistBtn =
                                                            !_model.wishlistBtn;
                                                        setState(() {});
                                                      }

                                                      setState(() {});
                                                    },
                                                  );
                                                } else {
                                                  return FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    buttonSize: 46.0,
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 25.0,
                                                    ),
                                                    onPressed: () async {
                                                      HapticFeedback
                                                          .lightImpact();
                                                      _model.apiDeleteFWResult =
                                                          await EcommerceGroup
                                                              .deleteFromWishlistCall
                                                              .call(
                                                        accesstoken:
                                                            FFAppState()
                                                                .accesstoken,
                                                        csrftoken: FFAppState()
                                                            .csrftoken,
                                                        sessionid: FFAppState()
                                                            .sessionId,
                                                        productId: EcommerceGroup
                                                            .producctByNameCall
                                                            .productID(
                                                          ecommerceProductDetailProducctByNameResponse
                                                              .jsonBody,
                                                        ),
                                                      );

                                                      if ((_model
                                                              .apiDeleteFWResult
                                                              ?.succeeded ??
                                                          true)) {
                                                        if (animationsMap[
                                                                'conditionalBuilderOnActionTriggerAnimation'] !=
                                                            null) {
                                                          setState(() =>
                                                              hasConditionalBuilderTriggered =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'conditionalBuilderOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                        _model.wishlistBtn =
                                                            !_model.wishlistBtn;
                                                        setState(() {});
                                                      }

                                                      setState(() {});
                                                    },
                                                  );
                                                }
                                              },
                                            ).animateOnActionTrigger(
                                                animationsMap[
                                                    'conditionalBuilderOnActionTriggerAnimation']!,
                                                hasBeenTriggered:
                                                    hasConditionalBuilderTriggered),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 20.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      EcommerceGroup.producctByNameCall.name(
                                        ecommerceProductDetailProducctByNameResponse
                                            .jsonBody,
                                      )!,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                              child: VerticalDivider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent4,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-0.84, 0.97),
                                  child: Text(
                                    '${EcommerceGroup.producctByNameCall.price(
                                          ecommerceProductDetailProducctByNameResponse
                                              .jsonBody,
                                        )?.toString()} ${EcommerceGroup.producctByNameCall.currency(
                                      ecommerceProductDetailProducctByNameResponse
                                          .jsonBody,
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Quantity : ${EcommerceGroup.producctByNameCall.quantity(
                                    ecommerceProductDetailProducctByNameResponse
                                        .jsonBody,
                                  )?.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 8.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RatingBarIndicator(
                              itemBuilder: (context, index) => const Icon(
                                Icons.star_rounded,
                                color: Color(0xFFFFA130),
                              ),
                              direction: Axis.horizontal,
                              rating: functions
                                  .ratingCF(EcommerceGroup.producctByNameCall
                                      .rating(
                                        ecommerceProductDetailProducctByNameResponse
                                            .jsonBody,
                                      )
                                      ?.toList()),
                              unratedColor: const Color(0xFF95A1AC),
                              itemCount: 5,
                              itemSize: 24.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  '${valueOrDefault<String>(
                                    functions.ecommerceReviews(
                                        EcommerceGroup.producctByNameCall
                                            .reviews(
                                              ecommerceProductDetailProducctByNameResponse
                                                  .jsonBody,
                                            )
                                            ?.toList()),
                                    '5/5',
                                  )} Reviews',
                                  '5/5 Reviews',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'zl9qwmsn' /* DESCRIPTION */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                EcommerceGroup.producctByNameCall.description(
                                  ecommerceProductDetailProducctByNameResponse
                                      .jsonBody,
                                )!,
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x55000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 52.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          HapticFeedback.lightImpact();
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: EcommerceReviewsWidget(
                                    reviews: EcommerceGroup.producctByNameCall
                                        .reviews(
                                      ecommerceProductDetailProducctByNameResponse
                                          .jsonBody,
                                    )!,
                                    id: EcommerceGroup.producctByNameCall
                                        .productID(
                                      ecommerceProductDetailProducctByNameResponse
                                          .jsonBody,
                                    )!,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: FFLocalizations.of(context).getText(
                          'nosptu04' /* Reviews */,
                        ),
                        icon: Icon(
                          Icons.star,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          width: 160.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0x00FFFFFF),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 2.0,
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if ((EcommerceGroup.producctByNameCall.quantity(
                                ecommerceProductDetailProducctByNameResponse
                                    .jsonBody,
                              )!) >
                              0) {
                            return FFButtonWidget(
                              onPressed: () async {
                                HapticFeedback.lightImpact();

                                context.pushNamed(
                                  'eccommercePaymentPage',
                                  queryParameters: {
                                    'product': serializeParam(
                                      ecommerceProductDetailProducctByNameResponse
                                          .jsonBody,
                                      ParamType.JSON,
                                    ),
                                    'typePhysical': serializeParam(
                                      EcommerceGroup.producctByNameCall.type(
                                                ecommerceProductDetailProducctByNameResponse
                                                    .jsonBody,
                                              ) ==
                                              'DOWNLOADABLE'
                                          ? false
                                          : true,
                                      ParamType.bool,
                                    ),
                                    'walletType': serializeParam(
                                      EcommerceGroup.producctByNameCall
                                          .walletType(
                                        ecommerceProductDetailProducctByNameResponse
                                            .jsonBody,
                                      ),
                                      ParamType.String,
                                    ),
                                    'currency': serializeParam(
                                      EcommerceGroup.producctByNameCall
                                          .currency(
                                        ecommerceProductDetailProducctByNameResponse
                                            .jsonBody,
                                      ),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                '7ezogidr' /* Add to Cart */,
                              ),
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: 160.0,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                            );
                          } else {
                            return FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'kmsqr225' /* Out Of Stock */,
                              ),
                              icon: const Icon(
                                Icons.error_outline,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: 160.0,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).grayLight,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  width: 2.0,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
