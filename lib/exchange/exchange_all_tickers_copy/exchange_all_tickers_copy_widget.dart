import '/components/all_t_i_c_k_e_r_s_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/nav_bar/nav_bar_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'exchange_all_tickers_copy_model.dart';
export 'exchange_all_tickers_copy_model.dart';

class ExchangeAllTickersCopyWidget extends StatefulWidget {
  const ExchangeAllTickersCopyWidget({super.key});

  @override
  State<ExchangeAllTickersCopyWidget> createState() =>
      _ExchangeAllTickersCopyWidgetState();
}

class _ExchangeAllTickersCopyWidgetState
    extends State<ExchangeAllTickersCopyWidget> {
  late ExchangeAllTickersCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExchangeAllTickersCopyModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: const AlignmentDirectional(0.0, 1.0),
          children: [
            wrapWithModel(
              model: _model.allTICKERSComponentModel,
              updateCallback: () => setState(() {}),
              child: const AllTICKERSComponentWidget(
                isAllTickers: true,
              ),
            ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => setState(() {}),
                child: const NavBarWidget(
                  activePage: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
