import '/chat_g_p_t_component/writing_indicator/writing_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ai_chat_component_widget.dart' show AiChatComponentWidget;
import 'package:flutter/material.dart';

class AiChatComponentModel extends FlutterFlowModel<AiChatComponentWidget> {
  ///  Local state fields for this component.

  dynamic chatHistory;

  bool aiResponding = false;

  String inputContent = '';

  List<String> gemenichat = [];
  void addToGemenichat(String item) => gemenichat.add(item);
  void removeFromGemenichat(String item) => gemenichat.remove(item);
  void removeAtIndexFromGemenichat(int index) => gemenichat.removeAt(index);
  void insertAtIndexInGemenichat(int index, String item) =>
      gemenichat.insert(index, item);
  void updateGemenichatAtIndex(int index, Function(String) updateFn) =>
      gemenichat[index] = updateFn(gemenichat[index]);

  ///  State fields for stateful widgets in this component.

  // Model for writingIndicator component.
  late WritingIndicatorModel writingIndicatorModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    writingIndicatorModel = createModel(context, () => WritingIndicatorModel());
  }

  @override
  void dispose() {
    writingIndicatorModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
