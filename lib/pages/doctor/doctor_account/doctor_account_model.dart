import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_navbar/custom_navbar_widget.dart';
import '/pages/public_components/image_component/image_component_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'doctor_account_widget.dart' show DoctorAccountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoctorAccountModel extends FlutterFlowModel<DoctorAccountWidget> {
  ///  Local state fields for this page.

  DocRecord? docDocument;

  int? docStatusCode = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in doctor_account widget.
  DocRecord? returnnedDoc;
  // Model for image_component component.
  late ImageComponentModel imageComponentModel;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    imageComponentModel = createModel(context, () => ImageComponentModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    imageComponentModel.dispose();
    customNavbarModel.dispose();
  }
}
