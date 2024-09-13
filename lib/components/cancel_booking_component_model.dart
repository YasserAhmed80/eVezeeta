import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cancel_booking_component_widget.dart' show CancelBookingComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CancelBookingComponentModel
    extends FlutterFlowModel<CancelBookingComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtCancelReason widget.
  FocusNode? txtCancelReasonFocusNode;
  TextEditingController? txtCancelReasonTextController;
  String? Function(BuildContext, String?)?
      txtCancelReasonTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtCancelReasonFocusNode?.dispose();
    txtCancelReasonTextController?.dispose();
  }
}
