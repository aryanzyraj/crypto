import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'p2p_creat_p_m_model.dart';
export 'p2p_creat_p_m_model.dart';

class P2pCreatPMWidget extends StatefulWidget {
  const P2pCreatPMWidget({super.key});

  @override
  State<P2pCreatPMWidget> createState() => _P2pCreatPMWidgetState();
}

class _P2pCreatPMWidgetState extends State<P2pCreatPMWidget>
    with TickerProviderStateMixin {
  late P2pCreatPMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => P2pCreatPMModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.switchValue = false;
    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: const Offset(21.0, 18.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 250.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 200.0.ms,
            begin: const Offset(21.0, 18.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, -20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 110.0),
            end: const Offset(0.0, 0.0),
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

    return FutureBuilder<ApiCallResponse>(
      future: PeerToPeerGroup.manageStructureCall.call(
        accesstoken: FFAppState().accesstoken,
        csrftoken: FFAppState().csrftoken,
        sessionid: FFAppState().sessionId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final p2pCreatPMManageStructureResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '1y4cxdro' /* P2P Payment Method */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Lexend',
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'cv4ja88e' /* Name */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ]
                            .divide(const SizedBox(height: 16.0))
                            .addToStart(const SizedBox(height: 12.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownWalletValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'me2vo8nv' /* FIAT */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'kfy02n19' /* SPOT */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'k1phdubm' /* ECO */,
                                              )
                                            ],
                                            onChanged: (val) async {
                                              setState(() => _model
                                                  .dropDownWalletValue = val);
                                              _model.isCurrencySelected = false;
                                              _model.currencies = functions
                                                  .p2pManageStructure(
                                                      p2pCreatPMManageStructureResponse
                                                          .jsonBody,
                                                      _model
                                                          .dropDownWalletValue!)
                                                  .toList()
                                                  .cast<String>();
                                              setState(() {});
                                            },
                                            width: 300.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '0c6ij0pz' /* Wallet Type */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'hp7uzfq8' /* Select a wallet type to receiv... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayLight,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 5.0)),
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation1']!),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownCurrencyValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: _model.currencies,
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .dropDownCurrencyValue =
                                                      val);
                                                  _model.isCurrencySelected =
                                                      true;
                                                  setState(() {});
                                                },
                                                width: 300.0,
                                                height: 50.0,
                                                maxHeight:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.4,
                                                searchHintTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'mbzuqvr6' /*  Currency */,
                                                ),
                                                searchHintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'zz6bttzp' /* Search ... */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                disabled: _model
                                                            .dropDownWalletValue ==
                                                        null ||
                                                    _model.dropDownWalletValue ==
                                                        '',
                                                isOverButton: true,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ig8g8662' /* Select a currency of the walle... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayLight,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(height: 5.0)),
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation2']!),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if ((_model.dropDownWalletValue != null &&
                                          _model.dropDownWalletValue != '') &&
                                      (_model.dropDownCurrencyValue != null &&
                                          _model.dropDownCurrencyValue != '') &&
                                      _model.isCurrencySelected)
                                    Builder(
                                      builder: (context) {
                                        if (_model.dropDownWalletValue ==
                                            'ECO') {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .dropDownchainValueController ??=
                                                      FormFieldController<
                                                          String>(null),
                                                  options: [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'byxvdenh' /* Option 1 */,
                                                    )
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                              .dropDownchainValue =
                                                          val),
                                                  width: 300.0,
                                                  height: 50.0,
                                                  maxHeight:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.4,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ic8mq8sp' /* Chain */,
                                                  ),
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderWidth: 2.0,
                                                  borderRadius: 8.0,
                                                  margin: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 4.0, 16.0, 4.0),
                                                  hidesUnderline: true,
                                                  isOverButton: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ),
                                            ],
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation3']!);
                                        } else {
                                          return const Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [],
                                                ),
                                              ),
                                            ],
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation4']!);
                                        }
                                      },
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'vvd64ai2' /* Instructions... */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 24.0, 16.0, 12.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                        maxLines: 16,
                        minLines: 2,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
                      Builder(
                        builder: (context) {
                          if (_model.isimageUploaded) {
                            return Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.memory(
                                    _model.uploadedLocalFile.bytes ??
                                        Uint8List.fromList([]),
                                    width: double.infinity,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidImage,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 58.0,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              maxWidth: 262.00,
                              maxHeight: 350.00,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                  selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }

                            _model.apiUploadImageResult = await UploadCall.call(
                              accesstoken: FFAppState().accesstoken,
                              csrftoken: FFAppState().csrftoken,
                              sessionid: FFAppState().sessionId,
                              jsonJson: functions.uploadImage(
                                  'p2pPaymentMethods/image',
                                  _model.uploadedLocalFile,
                                  262,
                                  350),
                            );

                            if ((_model.apiUploadImageResult?.succeeded ??
                                true)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.apiUploadImageResult?.jsonBody ??
                                          ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 1000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).customColor1,
                                ),
                              );
                              _model.isimageUploaded = true;
                              _model.imageurl = getJsonField(
                                (_model.apiUploadImageResult?.jsonBody ?? ''),
                                r'''$.url''',
                              ).toString();
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.apiUploadImageResult?.jsonBody ??
                                          ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 1000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).customColor1,
                                ),
                              );
                            }

                            setState(() {});
                          },
                          child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              maxWidth: 500.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.add_a_photo_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'afm46zl2' /* Upload Image */,
                                      ),
                                      textAlign: TextAlign.center,
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
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'w836m9cz' /* Status */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Switch.adaptive(
                                value: _model.switchValue!,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.switchValue = newValue);
                                  if (newValue) {
                                    _model.status = 'true';
                                  } else {
                                    _model.status = 'false';
                                  }
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.apiPOSTpmResult = await PeerToPeerGroup
                                .pOSTcreatePaymentMethodeCall
                                .call(
                              name: _model.textController1.text,
                              currency: _model.dropDownCurrencyValue,
                              image: _model.imageurl,
                              instructions: _model.textController2.text,
                              accesstoken: FFAppState().accesstoken,
                              csrftoken: FFAppState().csrftoken,
                              sessionid: FFAppState().sessionId,
                              chain: _model.dropDownchainValue,
                              status: _model.status,
                              walletType: _model.dropDownWalletValue,
                            );

                            if ((_model.apiPOSTpmResult?.succeeded ?? true)) {
                              context.safePop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.apiPOSTpmResult?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).customColor1,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.apiPOSTpmResult?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).customColor8,
                                ),
                              );
                            }

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'cihnahb9' /* Create */,
                          ),
                          icon: const Icon(
                            Icons.payment,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 54.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 4.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
