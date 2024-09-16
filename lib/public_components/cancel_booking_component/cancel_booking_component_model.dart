import '/flutter_flow/flutter_flow_util.dart';
import 'cancel_booking_component_widget.dart' show CancelBookingComponentWidget;
import 'package:flutter/material.dart';

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
