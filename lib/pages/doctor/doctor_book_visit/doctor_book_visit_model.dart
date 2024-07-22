import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/data_loading_components/load_day_list_component/load_day_list_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/doctor/day_booking_component/day_booking_component_widget.dart';
import '/pages/doctor/day_list_component/day_list_component_widget.dart';
import 'doctor_book_visit_widget.dart' show DoctorBookVisitWidget;
import 'package:flutter/material.dart';

class DoctorBookVisitModel extends FlutterFlowModel<DoctorBookVisitWidget> {
  ///  Local state fields for this page.

  DateTime? currentDate;

  int? loopIndex = 0;

  int? loopMax = 30;

  DateTime? selectedDay;

  List<int> selectedDayHours = [];
  void addToSelectedDayHours(int item) => selectedDayHours.add(item);
  void removeFromSelectedDayHours(int item) => selectedDayHours.remove(item);
  void removeAtIndexFromSelectedDayHours(int index) =>
      selectedDayHours.removeAt(index);
  void insertAtIndexInSelectedDayHours(int index, int item) =>
      selectedDayHours.insert(index, item);
  void updateSelectedDayHoursAtIndex(int index, Function(int) updateFn) =>
      selectedDayHours[index] = updateFn(selectedDayHours[index]);

  DtDaysListStruct? selectedDaybook;
  void updateSelectedDaybookStruct(Function(DtDaysListStruct) updateFn) {
    updateFn(selectedDaybook ??= DtDaysListStruct());
  }

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DayListComponent component.
  late DayListComponentModel dayListComponentModel;
  // Model for DayBookingComponent component.
  late DayBookingComponentModel dayBookingComponentModel;
  // Model for loadDayListComponent component.
  late LoadDayListComponentModel loadDayListComponentModel;

  @override
  void initState(BuildContext context) {
    dayListComponentModel = createModel(context, () => DayListComponentModel());
    dayBookingComponentModel =
        createModel(context, () => DayBookingComponentModel());
    loadDayListComponentModel =
        createModel(context, () => LoadDayListComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dayListComponentModel.dispose();
    dayBookingComponentModel.dispose();
    loadDayListComponentModel.dispose();
  }
}
