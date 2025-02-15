import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'kycmini_passport_model.dart';
export 'kycmini_passport_model.dart';

class KycminiPassportWidget extends StatefulWidget {
  const KycminiPassportWidget({
    super.key,
    required this.passportfrontAction,
    required this.passportSelfieAction,
  });

  final Future Function(String front)? passportfrontAction;
  final Future Function(String selfie)? passportSelfieAction;

  @override
  State<KycminiPassportWidget> createState() => _KycminiPassportWidgetState();
}

class _KycminiPassportWidgetState extends State<KycminiPassportWidget>
    with TickerProviderStateMixin {
  late KycminiPassportModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KycminiPassportModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(-10.0, -10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(-10.0, -10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(-10.0, -10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(-10.0, -10.0),
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

    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).accent4,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Builder(
                  builder: (context) {
                    if (_model.photofrontNotuploaded) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).width * 0.2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayDark,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading1 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile1 =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  _model.apiUploadFPassportResult =
                                      await UploadCall.call(
                                    accesstoken: FFAppState().accesstoken,
                                    csrftoken: FFAppState().csrftoken,
                                    sessionid: FFAppState().sessionId,
                                    jsonJson: functions.uploadImage(
                                        'kyc/documentPassport',
                                        _model.uploadedLocalFile1,
                                        262,
                                        350),
                                  );

                                  if ((_model.apiUploadFPassportResult
                                          ?.succeeded ??
                                      true)) {
                                    await widget.passportfrontAction?.call(
                                      getJsonField(
                                        (_model.apiUploadFPassportResult
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.url''',
                                      ).toString(),
                                    );
                                    _model.photofrontNotuploaded =
                                        !_model.photofrontNotuploaded;
                                    setState(() {});
                                  }

                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 40.0,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'xzl7lla1' /* Front */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ].divide(const SizedBox(height: 5.0)),
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation1']!);
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).width * 0.2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayDark,
                              ),
                            ),
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.memory(
                                _model.uploadedLocalFile1.bytes ??
                                    Uint8List.fromList([]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.isDataUploading1 = false;
                                _model.uploadedLocalFile1 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                              });
                            },
                            child: Icon(
                              Icons.delete_forever,
                              color: FlutterFlowTheme.of(context).errorRed,
                              size: 24.0,
                            ),
                          ),
                        ].divide(const SizedBox(height: 5.0)),
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation2']!);
                    }
                  },
                ),
                Builder(
                  builder: (context) {
                    if (_model.photoSelfiwNotuploaded) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).width * 0.2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayDark,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading2 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading2 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile2 =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  _model.apiUploadSPassportResult =
                                      await UploadCall.call(
                                    accesstoken: FFAppState().accesstoken,
                                    csrftoken: FFAppState().csrftoken,
                                    sessionid: FFAppState().sessionId,
                                    jsonJson: functions.uploadImage(
                                        'kyc/documentPassport',
                                        _model.uploadedLocalFile2,
                                        720,
                                        720),
                                  );

                                  if ((_model.apiUploadSPassportResult
                                          ?.succeeded ??
                                      true)) {
                                    await widget.passportSelfieAction?.call(
                                      getJsonField(
                                        (_model.apiUploadSPassportResult
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.url''',
                                      ).toString(),
                                    );
                                    _model.photoSelfiwNotuploaded =
                                        !_model.photoSelfiwNotuploaded;
                                    setState(() {});
                                  }

                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 40.0,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'fhkwr5a6' /* Selfie */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ].divide(const SizedBox(height: 5.0)),
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation3']!);
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).width * 0.2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayDark,
                              ),
                            ),
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.memory(
                                _model.uploadedLocalFile2.bytes ??
                                    Uint8List.fromList([]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.isDataUploading2 = false;
                                _model.uploadedLocalFile2 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                              });
                            },
                            child: Icon(
                              Icons.delete_forever,
                              color: FlutterFlowTheme.of(context).errorRed,
                              size: 24.0,
                            ),
                          ),
                        ].divide(const SizedBox(height: 5.0)),
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation4']!);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
