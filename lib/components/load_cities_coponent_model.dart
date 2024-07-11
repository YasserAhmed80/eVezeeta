import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'load_cities_coponent_widget.dart' show LoadCitiesCoponentWidget;
import 'package:flutter/material.dart';

class LoadCitiesCoponentModel
    extends FlutterFlowModel<LoadCitiesCoponentWidget> {
  ///  Local state fields for this component.

  int? loopIndex = 0;

  int? loopMax;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in loadCitiesCoponent widget.
  List<GovernateRecord>? governateDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in loadCitiesCoponent widget.
  List<GovernZoneRecord>? zoneDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in loadCitiesCoponent widget.
  List<ZoneAreaRecord>? areaDocs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
