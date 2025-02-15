import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ticker_row_model.dart';
export 'ticker_row_model.dart';

class TickerRowWidget extends StatefulWidget {
  const TickerRowWidget({
    super.key,
    required this.item,
  });

  final dynamic item;

  @override
  State<TickerRowWidget> createState() => _TickerRowWidgetState();
}

class _TickerRowWidgetState extends State<TickerRowWidget> {
  late TickerRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TickerRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        HapticFeedback.lightImpact();
        FFAppState().symbol = getJsonField(
          widget.item,
          r'''$.symbol''',
        ).toString();
        setState(() {});

        context.pushNamed(
          'exchangeChart',
          queryParameters: {
            'symbol': serializeParam(
              getJsonField(
                widget.item,
                r'''$.symbol''',
              ).toString(),
              ParamType.String,
            ),
          }.withoutNulls,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 4,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getJsonField(
                        widget.item,
                        r'''$.symbol''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      (String var1) {
                        return '${(double.parse(var1) / 1000000)
                                .toStringAsFixed(1)}M';
                      }(getJsonField(
                        widget.item,
                        r'''$.quoteVolume''',
                      ).toString()),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 11.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      getJsonField(
                        widget.item,
                        r'''$.last''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 11.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      '\$${getJsonField(
                        widget.item,
                        r'''$.last''',
                      ).toString()}',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 70.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          () {
                            if ((String var1) {
                              return var1 == "up";
                            }(getJsonField(
                              widget.item,
                              r'''$.direction''',
                            ).toString())) {
                              return FlutterFlowTheme.of(context).exchangeGreen;
                            } else if ((String var1) {
                              return var1 == "down";
                            }(getJsonField(
                              widget.item,
                              r'''$.direction''',
                            ).toString())) {
                              return FlutterFlowTheme.of(context).errorRed;
                            } else {
                              return FlutterFlowTheme.of(context).alternate;
                            }
                          }(),
                          FlutterFlowTheme.of(context).exchangeGreen,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Text(
                          '${getJsonField(
                            widget.item,
                            r'''$.change''',
                          ).toString()} %',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
