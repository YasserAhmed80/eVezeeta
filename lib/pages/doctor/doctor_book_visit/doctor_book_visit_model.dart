import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
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

  DtHourStruct? userSelectedHourItem;
  void updateUserSelectedHourItemStruct(Function(DtHourStruct) updateFn) {
    updateFn(userSelectedHourItem ??= DtHourStruct());
  }

  List<int> bookedHoursList = [];
  void addToBookedHoursList(int item) => bookedHoursList.add(item);
  void removeFromBookedHoursList(int item) => bookedHoursList.remove(item);
  void removeAtIndexFromBookedHoursList(int index) =>
      bookedHoursList.removeAt(index);
  void insertAtIndexInBookedHoursList(int index, int item) =>
      bookedHoursList.insert(index, item);
  void updateBookedHoursListAtIndex(int index, Function(int) updateFn) =>
      bookedHoursList[index] = updateFn(bookedHoursList[index]);

  int? countPerHour;

  int? doctorAvergePerHour = 1;

  int? hourMinutes = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DayListComponent component.
  late DayListComponentModel dayListComponentModel;
  // Model for DayBookingComponent component.
  late DayBookingComponentModel dayBookingComponentModel;

  @override
  void initState(BuildContext context) {
    dayListComponentModel = createModel(context, () => DayListComponentModel());
    dayBookingComponentModel =
        createModel(context, () => DayBookingComponentModel());
  }

  @override
  void dispose() {
    dayListComponentModel.dispose();
    dayBookingComponentModel.dispose();
  }

  /// Action blocks.
  Future updateHourStatus(BuildContext context) async {
    loopIndex1 = 0;
    loopMax1 = FFAppState().refHour.length;
    while (loopIndex1! < loopMax1!) {
      currentHourItem = FFAppState().refHour[loopIndex1!];
      currentHourStatus = EnumBookHourStatus.inActive;
      if (functions.checkItemInList(
              currentHourItem?.hourKey, selectedDayHours.toList()) ==
          true) {
        currentHourStatus = EnumBookHourStatus.Active;
      }
      // get booked hours
      countPerHour = valueOrDefault<int>(
        bookedHoursList
            .where((e) =>
                e ==
                valueOrDefault<int>(
                  currentHourItem?.hourKey,
                  0,
                ))
            .toList()
            .length,
        0,
      );
      if (countPerHour! > 0) {
        currentHourStatus = EnumBookHourStatus.Booked;
        if (countPerHour! < doctorAvergePerHour!) {
          currentHourStatus = EnumBookHourStatus.PartiallyBooked;
        }
      }
      FFAppState().updateRefHourAtIndex(
        loopIndex1!,
        (e) => e
          ..statusCde = currentHourStatus
          ..bookCount = valueOrDefault<int>(
            countPerHour,
            0,
          ),
      );
      loopIndex1 = loopIndex1! + 1;
      currentHourStatus = EnumBookHourStatus.inActive;
      countPerHour = 0;
    }
  }
}
