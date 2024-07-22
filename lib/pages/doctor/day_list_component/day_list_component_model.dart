import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'day_list_component_widget.dart' show DayListComponentWidget;
import 'package:flutter/material.dart';

class DayListComponentModel extends FlutterFlowModel<DayListComponentWidget> {
  ///  Local state fields for this component.

  List<int> docActiveDays = [];
  void addToDocActiveDays(int item) => docActiveDays.add(item);
  void removeFromDocActiveDays(int item) => docActiveDays.remove(item);
  void removeAtIndexFromDocActiveDays(int index) =>
      docActiveDays.removeAt(index);
  void insertAtIndexInDocActiveDays(int index, int item) =>
      docActiveDays.insert(index, item);
  void updateDocActiveDaysAtIndex(int index, Function(int) updateFn) =>
      docActiveDays[index] = updateFn(docActiveDays[index]);

  DateTime? selectedDate;

  List<int> selectedDayHours = [];
  void addToSelectedDayHours(int item) => selectedDayHours.add(item);
  void removeFromSelectedDayHours(int item) => selectedDayHours.remove(item);
  void removeAtIndexFromSelectedDayHours(int index) =>
      selectedDayHours.removeAt(index);
  void insertAtIndexInSelectedDayHours(int index, int item) =>
      selectedDayHours.insert(index, item);
  void updateSelectedDayHoursAtIndex(int index, Function(int) updateFn) =>
      selectedDayHours[index] = updateFn(selectedDayHours[index]);

  DtDaysListStruct? selectedDayBook;
  void updateSelectedDayBookStruct(Function(DtDaysListStruct) updateFn) {
    updateFn(selectedDayBook ??= DtDaysListStruct());
  }

  int? tttttt;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in DayListComponent widget.
  List<DocTimeRecord>? returnedDocTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
