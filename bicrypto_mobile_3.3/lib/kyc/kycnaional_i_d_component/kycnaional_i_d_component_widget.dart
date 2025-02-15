import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'kycnaional_i_d_component_model.dart';
export 'kycnaional_i_d_component_model.dart';

class KycnaionalIDComponentWidget extends StatefulWidget {
  const KycnaionalIDComponentWidget({
    super.key,
    required this.nationalIDaction,
  });

  final Future Function(String? nidfront)? nationalIDaction;

  @override
  State<KycnaionalIDComponentWidget> createState() =>
      _KycnaionalIDComponentWidgetState();
}

class _KycnaionalIDComponentWidgetState
    extends State<KycnaionalIDComponentWidget> {
  late KycnaionalIDComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KycnaionalIDComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'hh9buxlz' /* National ID */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).grayLight,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.close_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'xtcvgovt' /* To avoid delays with verificat... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.check,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '4yko0guu' /* Chosen credential must not be ... */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Lexend',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.check,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    Flexible(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '5xpuut2j' /* Document should be in good con... */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Lexend',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.check,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    Flexible(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ddgexpn1' /* There is no light glare or ref... */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Lexend',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
              ].divide(const SizedBox(height: 5.0)),
            ),
            StyledDivider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).grayLight,
              lineStyle: DividerLineStyle.dashed,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '1ckkh2ek' /* Front Side */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.fileImage,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).errorRed,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.close_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 200.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).grayLight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/vnimc_1.png',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 10.0)),
            ),
            StyledDivider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).grayLight,
              lineStyle: DividerLineStyle.dashed,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'jprb1ojd' /* Back Side */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.fileImage,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).errorRed,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.close_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 200.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).grayLight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/12.png',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 10.0)),
            ),
            StyledDivider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).grayLight,
              lineStyle: DividerLineStyle.dashed,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'nq6zyukj' /* Selfie */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.fileImage,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).errorRed,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.close_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 200.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).grayLight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/13.png',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 10.0)),
            ),
          ].divide(const SizedBox(height: 5.0)),
        ),
      ),
    );
  }
}
