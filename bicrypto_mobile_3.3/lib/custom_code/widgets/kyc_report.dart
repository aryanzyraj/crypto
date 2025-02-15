// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class KycReport extends StatefulWidget {
  const KycReport({
    Key? key,
    this.width,
    this.height,
    required this.report,
    required this.containerColor,
    required this.textColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String report;
  final Color containerColor;
  final Color textColor;

  @override
  State<KycReport> createState() => _KycReportState();
}

class _KycReportState extends State<KycReport>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = AnimationController(
      duration: const Duration(seconds: 55),
      vsync: this,
    )..repeat();

    _controller.addListener(() {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = maxScroll * _controller.value;
        _scrollController.jumpTo(currentScroll);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildTextWithIcon() {
    return Row(
      children: [
        Icon(
          Icons.error, // Changed to filled error icon
          color: widget.textColor,
          size: 20,
        ),
        SizedBox(width: 3), // 3px space between icon and text
        Text(
          widget.report,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.containerColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            _buildTextWithIcon(),
            SizedBox(width: 50), // Space between repetitions
            _buildTextWithIcon(),
          ],
        ),
      ),
    );
  }
}
