import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future getBookingHistory(BuildContext context) async {
    List<DocBookedTimeRecord>? returnedBookedData;

    // get Data from DB
    returnedBookedData = await queryDocBookedTimeRecordOnce(
      queryBuilder: (docBookedTimeRecord) => docBookedTimeRecord
          .where(
            'doc_id',
            isEqualTo: valueOrDefault<String>(
              widget!.docDocument?.reference.id,
              '111',
            ),
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
        cusId: returnedBookedData[loopIndex!].cusId,
        price: returnedBookedData[loopIndex!].price,
        fee: returnedBookedData[loopIndex!].fee,
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
  }
}
