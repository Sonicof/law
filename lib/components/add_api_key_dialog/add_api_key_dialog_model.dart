import '/flutter_flow/flutter_flow_util.dart';
import 'add_api_key_dialog_widget.dart' show AddApiKeyDialogWidget;
import 'package:flutter/material.dart';

class AddApiKeyDialogModel extends FlutterFlowModel<AddApiKeyDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
