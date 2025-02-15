import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'forex_meta_trader_model.dart';
export 'forex_meta_trader_model.dart';

class ForexMetaTraderWidget extends StatefulWidget {
  const ForexMetaTraderWidget({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<ForexMetaTraderWidget> createState() => _ForexMetaTraderWidgetState();
}

class _ForexMetaTraderWidgetState extends State<ForexMetaTraderWidget> {
  late ForexMetaTraderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForexMetaTraderModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).textColor,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).textColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'qeovcl3g' /* MetaTrader */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Lexend',
                      color: FlutterFlowTheme.of(context).darkBackground,
                      letterSpacing: 0.0,
                    ),
              ),
              FlutterFlowIconButton(
                borderColor: const Color(0x0000968A),
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: const Color(0x00EEEEEE),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: FlutterFlowTheme.of(context).darkBackground,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowWebView(
                  content: widget.url!,
                  bypass: false,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  verticalScroll: true,
                  horizontalScroll: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
