import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/custom_navbar/custom_navbar_widget.dart';
import 'doctor_dashboard_widget.dart' show DoctorDashboardWidget;
import 'package:flutter/material.dart';

class DoctorDashboardModel extends FlutterFlowModel<DoctorDashboardWidget> {
  ///  Local state fields for this page.

  DateTime? fromDate;

  DateTime? toDate;

  List<DtBookingHistoryStruct> bookingHistory = [];
  void addToBookingHistory(DtBookingHistoryStruct item) =>
      bookingHistory.add(item);
  void removeFromBookingHistory(DtBookingHistoryStruct item) =>
      bookingHistory.remove(item);
  void removeAtIndexFromBookingHistory(int index) =>
      bookingHistory.removeAt(index);
  void insertAtIndexInBookingHistory(int index, DtBookingHistoryStruct item) =>
      bookingHistory.insert(index, item);
  void updateBookingHistoryAtIndex(
          int index, Function(DtBookingHistoryStruct) updateFn) =>
      bookingHistory[index] = updateFn(bookingHistory[index]);

  int? loopIndex = 0;

  int? loopMax = 0;

  int? totalCount = 0;

  int? totalValue = 0;

  int? totCancelledCount = 0;

  int? totCancelledValue;

  int? totalAllCount;

  int? totlAllValue;

  double? cancelCountPerc = 0.0;

  double? cancelvaluePerc;

  String? sPeriod = 'd';

  List<DtDayAnalysisStruct> dayAnalysisList = [];
  void addToDayAnalysisList(DtDayAnalysisStruct item) =>
      dayAnalysisList.add(item);
  void removeFromDayAnalysisList(DtDayAnalysisStruct item) =>
      dayAnalysisList.remove(item);
  void removeAtIndexFromDayAnalysisList(int index) =>
      dayAnalysisList.removeAt(index);
  void insertAtIndexInDayAnalysisList(int index, DtDayAnalysisStruct item) =>
      dayAnalysisList.insert(index, item);
  void updateDayAnalysisListAtIndex(
          int index, Function(DtDayAnalysisStruct) updateFn) =>
      dayAnalysisList[index] = updateFn(dayAnalysisList[index]);

  List<DateTime> daysListTemp = [];
  void addToDaysListTemp(DateTime item) => daysListTemp.add(item);
  void removeFromDaysListTemp(DateTime item) => daysListTemp.remove(item);
  void removeAtIndexFromDaysListTemp(int index) => daysListTemp.removeAt(index);
  void insertAtIndexInDaysListTemp(int index, DateTime item) =>
      daysListTemp.insert(index, item);
  void updateDaysListTempAtIndex(int index, Function(DateTime) updateFn) =>
      daysListTemp[index] = updateFn(daysListTemp[index]);

  int? nCountTemp = 0;

  int? nValueTemp = 0;

  DateTime? currentDateTemp;

  ///  State fields for stateful widgets in this page.

  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    customNavbarModel.dispose();
  }

  /// Action blocks.
  Future getBookingHistory(BuildContext context) async {
    List<DocBookedTimeRecord>? returnedBookedData;

    // get Data from DB
    returnedBookedData = await queryDocBookedTimeRecordOnce(
      queryBuilder: (docBookedTimeRecord) => docBookedTimeRecord
          .where(
            'doc_ref',
            isEqualTo: widget!.docRef,
          )
          .where(
            'date',
            isGreaterThanOrEqualTo: fromDate,
          )
          .where(
            'date',
            isLessThanOrEqualTo: toDate,
          ),
    );
    loopIndex = 0;
    loopMax = valueOrDefault<int>(
      returnedBookedData.length,
      0,
    );
    bookingHistory = [];
    while (loopIndex! < loopMax!) {
      addToBookingHistory(DtBookingHistoryStruct(
        date: returnedBookedData[loopIndex!].date,
        statusCde: returnedBookedData[loopIndex!].statusCde,
        cusId: returnedBookedData[loopIndex!].cusRef?.id,
        price: returnedBookedData[loopIndex!].price,
        fee: returnedBookedData[loopIndex!].fee,
        time: returnedBookedData[loopIndex!].dayTime,
      ));
      loopIndex = loopIndex! + 1;
    }
  }

  Future calcTotals(BuildContext context) async {
    loopIndex = 0;
    loopMax = valueOrDefault<int>(
      bookingHistory.length,
      0,
    );
    totalCount = 0;
    totalValue = 0;
    totCancelledCount = 0;
    totCancelledValue = 0;
    while (loopIndex! < loopMax!) {
      if (bookingHistory[loopIndex!].statusCde == 3) {
        totalCount = totalCount! + 1;
        totalValue = totalValue! + bookingHistory[loopIndex!].price;
      } else {
        if (bookingHistory[loopIndex!].statusCde == 4) {
          totCancelledCount = totCancelledCount! + 1;
          totCancelledValue =
              totCancelledValue! + bookingHistory[loopIndex!].price;
        }
      }

      loopIndex = loopIndex! + 1;
    }
    totalAllCount = valueOrDefault<int>(
          totalCount,
          0,
        ) +
        valueOrDefault<int>(
          totCancelledCount,
          0,
        );
    totlAllValue = valueOrDefault<int>(
          totalValue,
          0,
        ) +
        valueOrDefault<int>(
          totCancelledValue,
          0,
        );
  }

  Future loadDataAction(BuildContext context) async {
    await getBookingHistory(context);
    await calcTotals(context);
    await getDayAnalysisData(context);
  }

  Future getDayAnalysisData(BuildContext context) async {
    daysListTemp = bookingHistory
        .map((e) => e.date)
        .withoutNulls
        .toList()
        .unique((e) => e)
        .sortedList(keyOf: (e) => e, desc: false)
        .toList()
        .cast<DateTime>();
    loopIndex = 0;
    loopMax = valueOrDefault<int>(
      daysListTemp.length,
      0,
    );
    dayAnalysisList = [];
    while (loopIndex! < loopMax!) {
      currentDateTemp = daysListTemp[loopIndex!];
      nCountTemp = valueOrDefault<int>(
        bookingHistory
            .where((e) => (e.date == currentDateTemp) && (e.statusCde == 3))
            .toList()
            .length,
        0,
      );
      addToDayAnalysisList(DtDayAnalysisStruct(
        date: currentDateTemp,
        count: nCountTemp,
      ));
      loopIndex = loopIndex! + 1;
    }
  }
}
