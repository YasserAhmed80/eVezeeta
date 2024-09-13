import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'doctor_payment_widget.dart' show DoctorPaymentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoctorPaymentModel extends FlutterFlowModel<DoctorPaymentWidget> {
  ///  Local state fields for this page.

  int? totAmount = 0;

  int? paymentMethod = 1;

  bool hasCapounDiscount = false;

  int? priceAmount = 100;

  int? feeAmount = 0;

  DateTime? fromDate;

  DateTime? toDate;

  int? discountAmount = 0;

  int? totAfterDiscount = 0;

  String? capoun = '';

  String? payReference = '0';

  int? feePerBook;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in doctor_payment widget.
  SubscriptionFeesRecord? returnedSubFees;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
