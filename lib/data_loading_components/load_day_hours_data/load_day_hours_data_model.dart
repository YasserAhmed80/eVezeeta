import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'load_day_hours_data_widget.dart' show LoadDayHoursDataWidget;
import 'package:flutter/material.dart';

class LoadDayHoursDataModel extends FlutterFlowModel<LoadDayHoursDataWidget> {
  ///  Local state fields for this component.

  int? loopIndex = 0;

  int? loopMax;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in loadDayHoursData widget.
  List<DayRefRecord>? dayData;
  // Stores action output result for [Firestore Query - Query a collection] action in loadDayHoursData widget.
  List<HourRefRecord>? hourData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
