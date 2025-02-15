import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'emptyai_chat_list_model.dart';
export 'emptyai_chat_list_model.dart';

class EmptyaiChatListWidget extends StatefulWidget {
  const EmptyaiChatListWidget({super.key});

  @override
  State<EmptyaiChatListWidget> createState() => _EmptyaiChatListWidgetState();
}

class _EmptyaiChatListWidgetState extends State<EmptyaiChatListWidget> {
  late EmptyaiChatListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyaiChatListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.forum_outlined,
              color: FlutterFlowTheme.of(context).primary,
              size: 90.0,
            ),
            SelectionArea(
                child: AutoSizeText(
              FFLocalizations.of(context).getText(
                'ez1syiuj' /* NordicX Chat! */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Lexend',
                    letterSpacing: 0.0,
                    lineHeight: 1.5,
                  ),
            )),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 0.0),
              child: SelectionArea(
                  child: AutoSizeText(
                FFLocalizations.of(context).getText(
                  'w55q6ltu' /* Send a message to start a sess... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Poppins',
                      letterSpacing: 0.0,
                    ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
