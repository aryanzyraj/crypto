import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'test_copy_model.dart';
export 'test_copy_model.dart';

class TestCopyWidget extends StatefulWidget {
  const TestCopyWidget({super.key});

  @override
  State<TestCopyWidget> createState() => _TestCopyWidgetState();
}

class _TestCopyWidgetState extends State<TestCopyWidget> {
  late TestCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isOrderBookOpen = true;
      setState(() {});
      await actions.market(
        context,
      );
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'l7nzmqm3' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Lexend',
                  color: Colors.white,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      final fff = FFAppState().filterTicker.toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: fff.length,
                        itemBuilder: (context, fffIndex) {
                          final fffItem = fff[fffIndex];
                          return Text(
                            getJsonField(
                              fffItem,
                              r'''$.last''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  final asks = FFAppState().tradeAsks.toList().take(7).toList();

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(asks.length, (asksIndex) {
                      final asksItem = asks[asksIndex];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Opacity(
                                  opacity: 0.5,
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      width: getJsonField(
                                        asksItem,
                                        r'''$.width''',
                                      ),
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor12,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      getJsonField(
                                        asksItem,
                                        r'''$.price''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .errorRed,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      getJsonField(
                                        asksItem,
                                        r'''$.amount''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  );
                },
              ),
              Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_aZTdD5.json',
                width: 150.0,
                height: 130.0,
                fit: BoxFit.cover,
                animate: true,
              ),
              Lottie.asset(
                'assets/lottie_animations/Logo_v4.json',
                width: 150.0,
                height: 130.0,
                fit: BoxFit.cover,
                animate: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
