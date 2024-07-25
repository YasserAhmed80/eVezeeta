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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in doctor_booking_center widget.
  List<DocBookedTimeRecord>? returnedBookedDays;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<DocBookedTimeRecord>? returnedBookedHours;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
