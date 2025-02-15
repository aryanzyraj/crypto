import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'kycmini_driver_model.dart';
export 'kycmini_driver_model.dart';

class KycminiDriverWidget extends StatefulWidget {
  const KycminiDriverWidget({
    super.key,
    required this.driverfrontAction,
    required this.driverSelfieAcction,
  });

  final Future Function(String front)? driverfrontAction;
  final Future Function(String selfie)? driverSelfieAcction;

  @override
  State<KycminiDriverWidget> createState() => _KycminiDriverWidgetState();
}

class _KycminiDriverWidgetState extends State<KycminiDriverWidget>
    with TickerProviderStateMixin {
  late KycminiDriverModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KycminiDriverModel());

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

                                  _model.apiUploadFDriver =
                                      await UploadCall.call(
                                    accesstoken: FFAppState().accesstoken,
                                    csrftoken: FFAppState().csrftoken,
                                    sessionid: FFAppState().sessionId,
                                    jsonJson: functions.uploadImage(
                                        'kyc/documentDriversLicense',
                                        _model.uploadedLocalFile1,
                                        262,
                                        350),
                                  );

                                  if ((_model.apiUploadFDriver?.succeeded ??
                                      true)) {
                                    await widget.driverfrontAction?.call(
                                      getJsonField(
                                        (_model.apiUploadFDriver?.jsonBody ??
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
                              'eq7n7gd8' /* Front */,
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
                    if (_model.photoSelfieNotuploaded) {
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

                                  _model.apiUploadSDriver =
                                      await UploadCall.call(
                                    accesstoken: FFAppState().accesstoken,
                                    csrftoken: FFAppState().csrftoken,
                                    sessionid: FFAppState().sessionId,
                                    jsonJson: functions.uploadImage(
                                        'kyc/documentDriversLicense',
                                        _model.uploadedLocalFile2,
                                        720,
                                        720),
                                  );

                                  if ((_model.apiUploadSDriver?.succeeded ??
                                      true)) {
                                    await widget.driverSelfieAcction?.call(
                                      getJsonField(
                                        (_model.apiUploadSDriver?.jsonBody ??
                                            ''),
                                        r'''$.url''',
                                      ).toString(),
                                    );
                                    _model.photoSelfieNotuploaded =
                                        !_model.photoSelfieNotuploaded;
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
                              'ksjvoxzb' /* Selfie */,
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
