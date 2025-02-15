import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'kyc_driver_license_component_model.dart';
export 'kyc_driver_license_component_model.dart';

class KycDriverLicenseComponentWidget extends StatefulWidget {
  const KycDriverLicenseComponentWidget({super.key});

  @override
  State<KycDriverLicenseComponentWidget> createState() =>
      _KycDriverLicenseComponentWidgetState();
}

class _KycDriverLicenseComponentWidgetState
    extends State<KycDriverLicenseComponentWidget> {
  late KycDriverLicenseComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KycDriverLicenseComponentModel());
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
                    'i3ptm510' /* Driver License */,
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
                  onPressed: () {
                    print('IconButton pressed ...');
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
                            'xog68klo' /* To avoid delays with verificat... */,
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
                        '7fy807za' /* Chosen credential must not be ... */,
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
                          '3742ng35' /* Document should be in good con... */,
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
                          'fx4dwpu0' /* There is no light glare or ref... */,
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
                          'zla3ikxo' /* Front Side */,
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
                          'assets/images/21.png',
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
                          'n22j1r80' /* Selfie */,
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
          ].divide(const SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
