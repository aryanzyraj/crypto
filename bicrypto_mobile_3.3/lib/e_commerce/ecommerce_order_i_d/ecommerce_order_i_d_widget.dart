import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'ecommerce_order_i_d_model.dart';
export 'ecommerce_order_i_d_model.dart';

class EcommerceOrderIDWidget extends StatefulWidget {
  const EcommerceOrderIDWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<EcommerceOrderIDWidget> createState() => _EcommerceOrderIDWidgetState();
}

class _EcommerceOrderIDWidgetState extends State<EcommerceOrderIDWidget> {
  late EcommerceOrderIDModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EcommerceOrderIDModel());
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
      future: EcommerceGroup.orderIdCall.call(
        id: widget.id,
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitDualRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final ecommerceOrderIDOrderIdResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                EcommerceGroup.orderIdCall.productName(
                  ecommerceOrderIDOrderIdResponse.jsonBody,
                )!,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Lexend',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '64lur8m2' /* Order ID: */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          getJsonField(
                                    ecommerceOrderIDOrderIdResponse.jsonBody,
                                    r'''$.id''',
                                  ) !=
                                  null
                              ? getJsonField(
                                  ecommerceOrderIDOrderIdResponse.jsonBody,
                                  r'''$.id''',
                                ).toString()
                              : ' ',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto Mono',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                    if (EcommerceGroup.orderIdCall.shippingAddress(
                          ecommerceOrderIDOrderIdResponse.jsonBody,
                        ) !=
                        null)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 8.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'dsahqddm' /* Name */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        EcommerceGroup.orderIdCall.shipName(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    null &&
                                                EcommerceGroup.orderIdCall
                                                        .shipName(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    ''
                                            ? EcommerceGroup.orderIdCall
                                                .shipName(
                                                ecommerceOrderIDOrderIdResponse
                                                    .jsonBody,
                                              )!
                                            : ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'og9t58e7' /* Street */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        EcommerceGroup.orderIdCall.shipStreet(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    null &&
                                                EcommerceGroup.orderIdCall
                                                        .shipStreet(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    ''
                                            ? EcommerceGroup.orderIdCall
                                                .shipStreet(
                                                ecommerceOrderIDOrderIdResponse
                                                    .jsonBody,
                                              )!
                                            : ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'pmhtk7t8' /* City */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        EcommerceGroup.orderIdCall.shipCity(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    null &&
                                                EcommerceGroup.orderIdCall
                                                        .shipCity(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    ''
                                            ? EcommerceGroup.orderIdCall
                                                .shipCity(
                                                ecommerceOrderIDOrderIdResponse
                                                    .jsonBody,
                                              )!
                                            : ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'b7xsakos' /* State */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        EcommerceGroup.orderIdCall.shipState(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    null &&
                                                EcommerceGroup.orderIdCall
                                                        .shipState(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    ''
                                            ? EcommerceGroup.orderIdCall
                                                .shipState(
                                                ecommerceOrderIDOrderIdResponse
                                                    .jsonBody,
                                              )!
                                            : ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'boienz45' /* Postal Code */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        EcommerceGroup.orderIdCall
                                                        .shipPostalCode(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    null &&
                                                EcommerceGroup.orderIdCall
                                                        .shipPostalCode(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    ''
                                            ? EcommerceGroup.orderIdCall
                                                .shipPostalCode(
                                                ecommerceOrderIDOrderIdResponse
                                                    .jsonBody,
                                              )!
                                            : ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '9gn06bxs' /* Country */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        EcommerceGroup.orderIdCall.shipCountry(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    null &&
                                                EcommerceGroup.orderIdCall
                                                        .shipCountry(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    ''
                                            ? EcommerceGroup.orderIdCall
                                                .shipCountry(
                                                ecommerceOrderIDOrderIdResponse
                                                    .jsonBody,
                                              )!
                                            : ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '7pg466t1' /* Phone */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        EcommerceGroup.orderIdCall.shipPhone(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    null &&
                                                EcommerceGroup.orderIdCall
                                                        .shipPhone(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    ''
                                            ? EcommerceGroup.orderIdCall
                                                .shipPhone(
                                                ecommerceOrderIDOrderIdResponse
                                                    .jsonBody,
                                              )!
                                            : ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 6.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'hunuuczr' /* Email */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        EcommerceGroup.orderIdCall.shipEmail(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    null &&
                                                EcommerceGroup.orderIdCall
                                                        .shipEmail(
                                                      ecommerceOrderIDOrderIdResponse
                                                          .jsonBody,
                                                    ) !=
                                                    ''
                                            ? EcommerceGroup.orderIdCall
                                                .shipEmail(
                                                ecommerceOrderIDOrderIdResponse
                                                    .jsonBody,
                                              )!
                                            : ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 130.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: (String var1) {
                                return var1 == 'COMPLETED';
                              }(EcommerceGroup.orderIdCall.status(
                                ecommerceOrderIDOrderIdResponse.jsonBody,
                              )!)
                                  ? FlutterFlowTheme.of(context).tertiary
                                  : FlutterFlowTheme.of(context).secondary,
                              width: 1.0,
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Text(
                                EcommerceGroup.orderIdCall.status(
                                  ecommerceOrderIDOrderIdResponse.jsonBody,
                                )!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: (String var1) {
                                        return var1 == 'COMPLETED';
                                      }(EcommerceGroup.orderIdCall.status(
                                        ecommerceOrderIDOrderIdResponse
                                            .jsonBody,
                                      )!)
                                          ? FlutterFlowTheme.of(context)
                                              .tertiary
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '${EcommerceGroup.orderIdCall.productPrice(
                                ecommerceOrderIDOrderIdResponse.jsonBody,
                              )?.toString()} ${EcommerceGroup.orderIdCall.currency(
                            ecommerceOrderIDOrderIdResponse.jsonBody,
                          )}',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (EcommerceGroup.orderIdCall.key(
                                    ecommerceOrderIDOrderIdResponse.jsonBody,
                                  ) !=
                                  null &&
                              EcommerceGroup.orderIdCall.key(
                                    ecommerceOrderIDOrderIdResponse.jsonBody,
                                  ) !=
                                  '')
                            Expanded(
                              child: FlipCard(
                                fill: Fill.fillBack,
                                direction: FlipDirection.HORIZONTAL,
                                speed: 400,
                                front: Container(
                                  width: 100.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'y9hfmeba' /* Click Here  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.key,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ].divide(const SizedBox(width: 10.0)),
                                  ),
                                ),
                                back: Container(
                                  width: 100.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).info,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            EcommerceGroup.orderIdCall.key(
                                              ecommerceOrderIDOrderIdResponse
                                                  .jsonBody,
                                            )!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
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
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text: EcommerceGroup
                                                        .orderIdCall
                                                        .key(
                                              ecommerceOrderIDOrderIdResponse
                                                  .jsonBody,
                                            )!));
                                          },
                                          child: Icon(
                                            Icons.content_copy_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (EcommerceGroup.orderIdCall.fIlePath(
                                    ecommerceOrderIDOrderIdResponse.jsonBody,
                                  ) !=
                                  null &&
                              EcommerceGroup.orderIdCall.fIlePath(
                                    ecommerceOrderIDOrderIdResponse.jsonBody,
                                  ) !=
                                  '')
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.download_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await launchURL(
                                    EcommerceGroup.orderIdCall.fIlePath(
                                  ecommerceOrderIDOrderIdResponse.jsonBody,
                                )!);
                              },
                            ),
                        ].divide(const SizedBox(width: 10.0)),
                      ),
                    ),
                  ].divide(const SizedBox(height: 25.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
