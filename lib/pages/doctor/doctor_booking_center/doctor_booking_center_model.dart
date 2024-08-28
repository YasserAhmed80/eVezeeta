import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'doctor_booking_center_widget.dart' show DoctorBookingCenterWidget;
import 'package:flutter/material.dart';

class DoctorBookingCenterModel
    extends FlutterFlowModel<DoctorBookingCenterWidget> {
  ///  Local state fields for this page.

  List<DateTime> bookedDays = [];
  void addToBookedDays(DateTime item) => bookedDays.add(item);
  void removeFromBookedDays(DateTime item) => bookedDays.remove(item);
  void removeAtIndexFromBookedDays(int index) => bookedDays.removeAt(index);
  void insertAtIndexInBookedDays(int index, DateTime item) =>
      bookedDays.insert(index, item);
  void updateBookedDaysAtIndex(int index, Function(DateTime) updateFn) =>
      bookedDays[index] = updateFn(bookedDays[index]);

  DateTime? selectedDay;

  List<DtBookedItemStruct> bookedList = [];
  void addToBookedList(DtBookedItemStruct item) => bookedList.add(item);
  void removeFromBookedList(DtBookedItemStruct item) => bookedList.remove(item);
  void removeAtIndexFromBookedList(int index) => bookedList.removeAt(index);
  void insertAtIndexInBookedList(int index, DtBookedItemStruct item) =>
      bookedList.insert(index, item);
  void updateBookedListAtIndex(
          int index, Function(DtBookedItemStruct) updateFn) =>
      bookedList[index] = updateFn(bookedList[index]);

  int? loopIndex = 0;

  int? loopMax = 0;

  int? filteredStatusCde = 1;

  List<DtBookedItemStruct> filteredBookedList = [];
  void addToFilteredBookedList(DtBookedItemStruct item) =>
      filteredBookedList.add(item);
  void removeFromFilteredBookedList(DtBookedItemStruct item) =>
      filteredBookedList.remove(item);
  void removeAtIndexFromFilteredBookedList(int index) =>
      filteredBookedList.removeAt(index);
  void insertAtIndexInFilteredBookedList(int index, DtBookedItemStruct item) =>
      filteredBookedList.insert(index, item);
  void updateFilteredBookedListAtIndex(
          int index, Function(DtBookedItemStruct) updateFn) =>
      filteredBookedList[index] = updateFn(filteredBookedList[index]);

  bool? allDays = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future getBookedList(BuildContext context) async {
    List<DocBookedTimeRecord>? returnedBookedItems;

    // get all booked days
    returnedBookedItems = await queryDocBookedTimeRecordOnce(
      queryBuilder: (docBookedTimeRecord) => docBookedTimeRecord.where(
        'doc_id',
        isEqualTo: widget!.docDocument?.reference.id,
      ),
    );
    // get distinct days
    bookedDays = returnedBookedItems
        .map((e) => e.date)
        .withoutNulls
        .toList()
        .sortedList(keyOf: (e) => e, desc: false)
        .unique((e) => e)
        .toList()
        .cast<DateTime>();
    loopIndex = 0;
    loopMax = valueOrDefault<int>(
      returnedBookedItems.length,
      0,
    );
    bookedList = [];
    while (loopIndex! < loopMax!) {
      addToBookedList(DtBookedItemStruct(
        cusId: valueOrDefault<String>(
          returnedBookedItems[loopIndex!].cusId,
          '0',
        ),
        docId: valueOrDefault<String>(
          returnedBookedItems[loopIndex!].docId,
          '0',
        ),
        date: returnedBookedItems[loopIndex!].date,
        time: returnedBookedItems[loopIndex!].dayTime,
        statusCde: valueOrDefault<int>(
          returnedBookedItems[loopIndex!].statusCde,
          0,
        ),
        cusName: 'yasser',
        cusTel: '01022222222220',
        itemRef: returnedBookedItems[loopIndex!].reference,
      ));
      loopIndex = loopIndex! + 1;
    }
  }

  Future getFilteredBookedList(BuildContext context) async {
    filteredBookedList = bookedList
        .where((e) =>
            ((e.date == selectedDay) || (allDays == true)) &&
            ((e.statusCde == filteredStatusCde) || (filteredStatusCde == 0)))
        .toList()
        .sortedList(keyOf: (e) => e.time!, desc: false)
        .toList()
        .cast<DtBookedItemStruct>();
  }
}
