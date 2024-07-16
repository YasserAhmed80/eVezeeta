import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'day_schedule_component_widget.dart' show DayScheduleComponentWidget;
import 'package:flutter/material.dart';

class DayScheduleComponentModel
    extends FlutterFlowModel<DayScheduleComponentWidget> {
  ///  Local state fields for this component.

  List<int> selectedHours = [];
  void addToSelectedHours(int item) => selectedHours.add(item);
  void removeFromSelectedHours(int item) => selectedHours.remove(item);
  void removeAtIndexFromSelectedHours(int index) =>
      selectedHours.removeAt(index);
  void insertAtIndexInSelectedHours(int index, int item) =>
      selectedHours.insert(index, item);
  void updateSelectedHoursAtIndex(int index, Function(int) updateFn) =>
      selectedHours[index] = updateFn(selectedHours[index]);

  DocumentReference? currentDay;

  bool isActiveDay = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in DayScheduleComponent widget.
  DocTimeRecord? savedDayRef;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  DocTimeRecord? createdDay;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
