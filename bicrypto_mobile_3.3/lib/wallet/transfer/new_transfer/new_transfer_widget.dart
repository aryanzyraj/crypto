import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wallet/transfer/new_transfer_component/new_transfer_component_widget.dart';
import 'package:flutter/material.dart';
import 'new_transfer_model.dart';
export 'new_transfer_model.dart';

class NewTransferWidget extends StatefulWidget {
  const NewTransferWidget({super.key});

  @override
  State<NewTransferWidget> createState() => _NewTransferWidgetState();
}

class _NewTransferWidgetState extends State<NewTransferWidget>
    with TickerProviderStateMixin {
  late NewTransferModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewTransferModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
              size: 25.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'kv4vv3q3' /* Transfer */,
            ),
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Lexend',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(0.0, 0),
                      child: FlutterFlowButtonTabBar(
                        useToggleButtonStyle: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelLarge.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                        unselectedLabelStyle: const TextStyle(),
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        unselectedBackgroundColor:
                            FlutterFlowTheme.of(context).alternate,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        unselectedBorderColor:
                            FlutterFlowTheme.of(context).alternate,
                        borderWidth: 4.0,
                        borderRadius: 8.0,
                        elevation: 0.0,
                        buttonMargin:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        padding: const EdgeInsets.all(4.0),
                        tabs: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Icon(
                                  FFIcons.kcreditCard1,
                                  size: 20.0,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'xj7p051l' /* Wallets */,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 6.0, 0.0),
                                child: Icon(
                                  FFIcons.kuserO,
                                  size: 20.0,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'zr4aduzn' /* Client */,
                                ),
                              ),
                            ],
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          wrapWithModel(
                            model: _model.newTransferComponentModel1,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: const NewTransferComponentWidget(
                              isWallets: true,
                            ),
                          ),
                          wrapWithModel(
                            model: _model.newTransferComponentModel2,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: const NewTransferComponentWidget(
                              isWallets: false,
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
        ),
      ),
    );
  }
}
