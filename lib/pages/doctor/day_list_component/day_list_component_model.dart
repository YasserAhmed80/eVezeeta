import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'day_list_component_widget.dart' show DayListComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  DateTime? currentDate;

  int? loopIndex = 0;

  int? loopMax = 0;

  List<DtDaysListStruct> refDayList = [];
  void addToRefDayList(DtDaysListStruct item) => refDayList.add(item);
  void removeFromRefDayList(DtDaysListStruct item) => refDayList.remove(item);
  void removeAtIndexFromRefDayList(int index) => refDayList.removeAt(index);
  void insertAtIndexInRefDayList(int index, DtDaysListStruct item) =>
      refDayList.insert(index, item);
  void updateRefDayListAtIndex(
          int index, Function(DtDaysListStruct) updateFn) =>
      refDayList[index] = updateFn(refDayList[index]);

  DtDayStruct? dayItem;
  void updateDayItemStruct(Function(DtDayStruct) updateFn) {
    updateFn(dayItem ??= DtDayStruct());
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

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in DayListComponent widget.
  List<DocTimeRecord>? returnedDocTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future getDaysList(BuildContext context) async {
    currentDate = functions.dateOnly(getCurrentTimestamp);
    refDayList = [];
    loopIndex = 0;
    loopMax = 30;
    while (loopIndex! < loopMax!) {
      dayItem =
          functions.getDayCode(currentDate!, FFAppState().refDay.toList());
      addToRefDayList(DtDaysListStruct(
        dayValue: currentDate,
        dayItem: dayItem,
        isActive:
            functions.checkItemInList(dayItem?.dayKey, docActiveDays.toList()),
      ));
      loopIndex = loopIndex! + 1;
      currentDate = functions.dateAdd(currentDate);
    }
  }

  Future getHrsFromDbAction(BuildContext context) async {
    DocTimeRecord? returnedHoursData;
    List<DocBookedTimeRecord>? returnedBookedHours;

    // get Day Hourss
    returnedHoursData = await queryDocTimeRecordOnce(
      queryBuilder: (docTimeRecord) => docTimeRecord
          .where(
            'doc_ref',
            isEqualTo: widget!.docDocument?.reference,
          )
          .where(
            'day_id',
            isEqualTo: selectedDayBook?.dayItem?.dayKey,
          ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    // updated day hours list
    selectedDayHours = returnedHoursData!.hrsId.toList().cast<int>();
    // get booked hours for this day
    returnedBookedHours = await queryDocBookedTimeRecordOnce(
      queryBuilder: (docBookedTimeRecord) => docBookedTimeRecord
          .where(
            'doc_ref',
            isEqualTo: widget!.docDocument?.reference,
          )
          .where(
            'date',
            isEqualTo: selectedDayBook?.dayValue,
          )
          .whereIn(
              'status_cde',
              FFAppState()
                  .refBookStatus
                  .where((e) => e.code != 3)
                  .toList()
                  .map((e) => e.code)
                  .toList()),
    );
    // update booked hours list
    bookedHoursList =
        returnedBookedHours!.map((e) => e.hour).toList().toList().cast<int>();
  }
}
