import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'emptysearch_model.dart';
export 'emptysearch_model.dart';

class EmptysearchWidget extends StatefulWidget {
  const EmptysearchWidget({
    super.key,
    required this.dimantion,
  });

  final int? dimantion;

  @override
  State<EmptysearchWidget> createState() => _EmptysearchWidgetState();
}

class _EmptysearchWidgetState extends State<EmptysearchWidget> {
  late EmptysearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptysearchModel());
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/emptyListA.png',
          width: widget.dimantion?.toDouble(),
          height: widget.dimantion?.toDouble(),
          fit: BoxFit.contain,
          alignment: const Alignment(0.0, 0.0),
        ),
      ),
    );
  }
}
