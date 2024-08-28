import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'doctor_payment_widget.dart' show DoctorPaymentWidget;
import 'package:flutter/material.dart';

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

  final unfocusNode = FocusNode();
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
