import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'doctor_billing_widget.dart' show DoctorBillingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  // Stores action output result for [Firestore Query - Query a collection] action in doctor_billing widget.
  List<DocBookedTimeRecord>? returnedBookedData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
