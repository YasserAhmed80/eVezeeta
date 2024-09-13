import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_navbar/custom_navbar_widget.dart';
import '/pages/public_components/day_schedule_component/day_schedule_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'doctor_data_schedule_widget.dart' show DoctorDataScheduleWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoctorDataScheduleModel
    extends FlutterFlowModel<DoctorDataScheduleWidget> {
  ///  Local state fields for this page.

  int? bookTypeCode = 1;

  int? price = 400;

  int? priceRevisit = 100;

  int? avgVisitPerHour = 1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for txtPrice widget.
  FocusNode? txtPriceFocusNode;
  TextEditingController? txtPriceTextController;
  String? Function(BuildContext, String?)? txtPriceTextControllerValidator;
  // State field(s) for txtPriceRevisit widget.
  FocusNode? txtPriceRevisitFocusNode;
  TextEditingController? txtPriceRevisitTextController;
  String? Function(BuildContext, String?)?
      txtPriceRevisitTextControllerValidator;
  // State field(s) for txtAvergeVisit widget.
  FocusNode? txtAvergeVisitFocusNode;
  TextEditingController? txtAvergeVisitTextController;
  String? Function(BuildContext, String?)?
      txtAvergeVisitTextControllerValidator;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    txtPriceFocusNode?.dispose();
    txtPriceTextController?.dispose();

    txtPriceRevisitFocusNode?.dispose();
    txtPriceRevisitTextController?.dispose();

    txtAvergeVisitFocusNode?.dispose();
    txtAvergeVisitTextController?.dispose();

    customNavbarModel.dispose();
  }
}
