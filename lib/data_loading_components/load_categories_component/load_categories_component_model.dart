import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'load_categories_component_widget.dart'
    show LoadCategoriesComponentWidget;
import 'package:flutter/material.dart';

class LoadCategoriesComponentModel
    extends FlutterFlowModel<LoadCategoriesComponentWidget> {
  ///  Local state fields for this component.

  int? loopIndex = 0;

  int? loopMax;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in loadCategoriesComponent widget.
  List<CategoryRecord>? catDocss;
  // Stores action output result for [Firestore Query - Query a collection] action in loadCategoriesComponent widget.
  List<CategorySubRecord>? subCatDocss;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
