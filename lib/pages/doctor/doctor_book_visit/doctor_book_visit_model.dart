import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/data_loading_components/load_day_list_component/load_day_list_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/doctor/day_booking_component/day_booking_component_widget.dart';
import '/pages/doctor/day_list_component/day_list_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'doctor_book_visit_widget.dart' show DoctorBookVisitWidget;
import 'package:flutter/material.dart';

class DoctorBookVisitModel extends FlutterFlowModel<DoctorBookVisitWidget> {
  ///  Local state fields for this page.

  DateTime? currentDate;

  int? loopIndex1 = 0;

  int? loopMax1 = 20;

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

  DtHourStruct? currentHourItem;
  void updateCurrentHourItemStruct(Function(DtHourStruct) updateFn) {
    updateFn(currentHourItem ??= DtHourStruct());
  }

  EnumBookHourStatus? currentHourStatus = EnumBookHourStatus.inActive;

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

  /// Action blocks.
  Future updateHourStatus(BuildContext context) async {
    loopIndex1 = 0;
    loopMax1 = FFAppState().refHour.length;
    while (loopIndex1! < loopMax1!) {
      currentHourItem = FFAppState().refHour[loopIndex1!];
      if (functions.checkItemInList(
              currentHourItem?.hourKey, selectedDayHours.toList()) ==
          true) {
        currentHourStatus = EnumBookHourStatus.Active;
      }
      FFAppState().updateRefHourAtIndex(
        loopIndex1!,
        (e) => e..statusCde = currentHourStatus,
      );
      loopIndex1 = loopIndex1! + 1;
      currentHourStatus = EnumBookHourStatus.inActive;
    }
  }
}
