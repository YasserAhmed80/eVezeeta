import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_appstate_widget.dart' show TestAppstateWidget;
import 'package:flutter/material.dart';

class TestAppstateModel extends FlutterFlowModel<TestAppstateWidget> {
  ///  Local state fields for this page.

  int? loopIndex = 0;

  int? loopMax;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in testAppstate widget.
  List<CategoryRecord>? catDocss;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
