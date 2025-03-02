import '/backend/api_requests/api_calls.dart';
import '/components/top_header/top_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gemini_chat_page_widget.dart' show GeminiChatPageWidget;
import 'package:flutter/material.dart';

class GeminiChatPageModel extends FlutterFlowModel<GeminiChatPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopHeader component.
  late TopHeaderModel topHeaderModel;
  // State field(s) for chat_listview_scrollable widget.
  ScrollController? chatListviewScrollable;
  // State field(s) for PromptTextField widget.
  FocusNode? promptTextFieldFocusNode;
  TextEditingController? promptTextFieldTextController;
  String? Function(BuildContext, String?)?
      promptTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (Gemini Flash API)] action in PromptTextField widget.
  ApiCallResponse? flashResponse;
  // Stores action output result for [Backend Call - API (Gemini Pro)] action in PromptTextField widget.
  ApiCallResponse? proResponse;
  // Stores action output result for [Gemini - Generate Text] action in PromptTextField widget.
  String? geminiNativeResponse;

  @override
  void initState(BuildContext context) {
    topHeaderModel = createModel(context, () => TopHeaderModel());
    chatListviewScrollable = ScrollController();
  }

  @override
  void dispose() {
    topHeaderModel.dispose();
    chatListviewScrollable?.dispose();
    promptTextFieldFocusNode?.dispose();
    promptTextFieldTextController?.dispose();
  }
}
