import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'doctor_billing_widget.dart' show DoctorBillingWidget;
import 'package:flutter/material.dart';

class DoctorBillingModel extends FlutterFlowModel<DoctorBillingWidget> {
  ///  Local state fields for this page.

  DateTime? fromDate;

  DateTime? toDate;

  int? subscriptionFee = 0;

  int? totFees = 0;

  int? totBookingCount = 0;

  int? feePerBook = 0;

  int? totCost = 0;

  int? remainingDays = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in doctor_billing widget.
  List<DocBookedTimeRecord>? returnedBookedData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
