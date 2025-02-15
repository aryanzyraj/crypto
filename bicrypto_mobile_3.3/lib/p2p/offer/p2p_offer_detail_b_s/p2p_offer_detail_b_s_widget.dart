import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/p2p/rate_component/rate_component_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'p2p_offer_detail_b_s_model.dart';
export 'p2p_offer_detail_b_s_model.dart';

class P2pOfferDetailBSWidget extends StatefulWidget {
  const P2pOfferDetailBSWidget({
    super.key,
    required this.id,
    required this.type,
    required this.currency,
  });

  final String? id;
  final String? type;
  final String? currency;

  @override
  State<P2pOfferDetailBSWidget> createState() => _P2pOfferDetailBSWidgetState();
}

class _P2pOfferDetailBSWidgetState extends State<P2pOfferDetailBSWidget>
    with TickerProviderStateMixin {
  late P2pOfferDetailBSModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P2pOfferDetailBSModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 120.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'dividerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 150.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 220.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 220.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 280.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 280.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 280.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 280.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 320.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 320.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 550.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 550.0.ms,
            duration: 200.0.ms,
            begin: const Offset(13.999999999999986, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
      child: FutureBuilder<ApiCallResponse>(
        future: PeerToPeerGroup.gETofferIDCall.call(
          id: widget.id,
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
          final checkoutBottomSheetGETofferIDResponse = snapshot.data!;

          return Container(
            width: double.infinity,
            height: 650.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  offset: const Offset(
                    0.0,
                    2.0,
                  ),
                  spreadRadius: 2.0,
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
              child: FutureBuilder<ApiCallResponse>(
                future: WalletGroup.getWalletDetailCall.call(
                  type: widget.type,
                  currency: widget.currency,
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
                  final columnGetWalletDetailResponse = snapshot.data!;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60.0,
                              height: 4.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondary,
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation2']!),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'buwg9jhw' /* Offer # */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            PeerToPeerGroup.gETofferIDCall.uuid(
                                          checkoutBottomSheetGETofferIDResponse
                                              .jsonBody,
                                        )!,
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .grayLight,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation1']!),
                      ),
                      Divider(
                        height: 24.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ).animateOnPageLoad(
                          animationsMap['dividerOnPageLoadAnimation']!),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Container(
                                        width: 55.0,
                                        height: 55.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          PeerToPeerGroup.gETofferIDCall
                                                          .userAvatar(
                                                        checkoutBottomSheetGETofferIDResponse
                                                            .jsonBody,
                                                      ) ==
                                                      null ||
                                                  PeerToPeerGroup.gETofferIDCall
                                                          .userAvatar(
                                                        checkoutBottomSheetGETofferIDResponse
                                                            .jsonBody,
                                                      ) ==
                                                      ''
                                              ? 'https://images.unsplash.com/photo-1511367461989-f85a21fda167?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxwcm9maWxlfGVufDB8fHx8MTcwNzM3MDkyMHww&ixlib=rb-4.0.3&q=80&w=400'
                                              : '${FFAppConstants.Domain}${PeerToPeerGroup.gETofferIDCall.userAvatar(
                                                  checkoutBottomSheetGETofferIDResponse
                                                      .jsonBody,
                                                )}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${PeerToPeerGroup.gETofferIDCall.firstName(
                                              checkoutBottomSheetGETofferIDResponse
                                                  .jsonBody,
                                            )} ${PeerToPeerGroup.gETofferIDCall.lastName(
                                              checkoutBottomSheetGETofferIDResponse
                                                  .jsonBody,
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          wrapWithModel(
                                            model: _model.rateComponentModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: RateComponentWidget(
                                              parameter1: PeerToPeerGroup
                                                  .gETofferIDCall
                                                  .listJasonReview(
                                                checkoutBottomSheetGETofferIDResponse
                                                    .jsonBody,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation2']!),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: Text(
                                          PeerToPeerGroup.gETofferIDCall
                                              .instructions(
                                            checkoutBottomSheetGETofferIDResponse
                                                .jsonBody,
                                          )!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation3']!),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7naluk9d' /* Offer Detail */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation4']!),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'c75a3c1y' /* Offer Currency:  */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: PeerToPeerGroup
                                                                .gETofferIDCall
                                                                .currency(
                                                              checkoutBottomSheetGETofferIDResponse
                                                                  .jsonBody,
                                                            )!,
                                                            style: const TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'gpahtx39' /* Available:  */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: PeerToPeerGroup
                                                                .gETofferIDCall
                                                                .availabeamount(
                                                                  checkoutBottomSheetGETofferIDResponse
                                                                      .jsonBody,
                                                                )!
                                                                .toString(),
                                                            style: const TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '5gvbe4v2' /*   */,
                                                            ),
                                                            style: const TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: PeerToPeerGroup
                                                                .gETofferIDCall
                                                                .currency(
                                                              checkoutBottomSheetGETofferIDResponse
                                                                  .jsonBody,
                                                            )!,
                                                            style: const TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    if (PeerToPeerGroup
                                                            .gETofferIDCall
                                                            .min(
                                                          checkoutBottomSheetGETofferIDResponse
                                                              .jsonBody,
                                                        ) !=
                                                        null)
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'cfg8w8zf' /* Minimum Amount:  */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: PeerToPeerGroup
                                                                  .gETofferIDCall
                                                                  .min(
                                                                    checkoutBottomSheetGETofferIDResponse
                                                                        .jsonBody,
                                                                  )!
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'iu8zka3x' /*   */,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: PeerToPeerGroup
                                                                  .gETofferIDCall
                                                                  .currency(
                                                                checkoutBottomSheetGETofferIDResponse
                                                                    .jsonBody,
                                                              )!,
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    if (PeerToPeerGroup
                                                            .gETofferIDCall
                                                            .max(
                                                          checkoutBottomSheetGETofferIDResponse
                                                              .jsonBody,
                                                        ) !=
                                                        null)
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'ul14zi29' /* Maximum Amount:  */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: PeerToPeerGroup
                                                                  .gETofferIDCall
                                                                  .max(
                                                                    checkoutBottomSheetGETofferIDResponse
                                                                        .jsonBody,
                                                                  )!
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'b7a9oqha' /*   */,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: PeerToPeerGroup
                                                                  .gETofferIDCall
                                                                  .currency(
                                                                checkoutBottomSheetGETofferIDResponse
                                                                    .jsonBody,
                                                              )!,
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '6yhj6snf' /* Price:  */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: PeerToPeerGroup
                                                                .gETofferIDCall
                                                                .price(
                                                                  checkoutBottomSheetGETofferIDResponse
                                                                      .jsonBody,
                                                                )!
                                                                .toString(),
                                                            style: const TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'mle5o6e8' /*   */,
                                                            ),
                                                            style: const TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: PeerToPeerGroup
                                                                .gETofferIDCall
                                                                .currency(
                                                              checkoutBottomSheetGETofferIDResponse
                                                                  .jsonBody,
                                                            )!,
                                                            style: const TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '0ta2uzht' /* Purchase Currency:  */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: PeerToPeerGroup
                                                                .gETofferIDCall
                                                                .purchaseCurrency(
                                                              checkoutBottomSheetGETofferIDResponse
                                                                  .jsonBody,
                                                            )!,
                                                            style: const TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 10.0)),
                                                ).animateOnPageLoad(animationsMap[
                                                    'columnOnPageLoadAnimation']!),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation3']!),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zihkvw4x' /* Balance:   */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${WalletGroup.getWalletDetailCall.balance(
                                                columnGetWalletDetailResponse
                                                    .jsonBody,
                                              )?.toString()} ${WalletGroup.getWalletDetailCall.currency(
                                            columnGetWalletDetailResponse
                                                .jsonBody,
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
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

                                                    context
                                                        .goNamed('Wallet_All');
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .solidPlusSquare,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'rowOnPageLoadAnimation5']!),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 10.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                const Duration(milliseconds: 100),
                                () => setState(() {}),
                              ),
                              autofocus: false,
                              textInputAction: TextInputAction.go,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'lehirb6i' /* Amount */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              keyboardType: TextInputType.number,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ).animateOnPageLoad(
                                animationsMap['textFieldOnPageLoadAnimation']!),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 24.0),
                            child: FFButtonWidget(
                              onPressed: (_model.textController.text == '')
                                  ? null
                                  : () async {
                                      _model.apiPOSTTradeResult =
                                          await PeerToPeerGroup.pOSTtradeCall
                                              .call(
                                        offerId: widget.id,
                                        amount: int.tryParse(
                                            _model.textController.text),
                                        accesstoken: FFAppState().accesstoken,
                                        csrftoken: FFAppState().csrftoken,
                                        sessionid: FFAppState().sessionId,
                                      );

                                      if ((_model
                                              .apiPOSTTradeResult?.succeeded ??
                                          true)) {
                                        context.pushNamed(
                                          'p2pChat',
                                          queryParameters: {
                                            'id': serializeParam(
                                              getJsonField(
                                                (_model.apiPOSTTradeResult
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.id''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.apiPOSTTradeResult
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .errorRed,
                                          ),
                                        );
                                      }

                                      setState(() {});
                                    },
                              text: FFLocalizations.of(context).getText(
                                'xtql6f2u' /* Purchase */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                disabledColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation']!),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!);
        },
      ),
    );
  }
}
