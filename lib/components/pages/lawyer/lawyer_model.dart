import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lawyer_widget.dart' show LawyerWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class LawyerModel extends FlutterFlowModel<LawyerWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Lawyer widget.
  LawyerRecord? lawyerRead;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
