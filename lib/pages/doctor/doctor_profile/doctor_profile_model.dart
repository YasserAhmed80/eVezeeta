import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_navbar/custom_navbar_widget.dart';
import 'doctor_profile_widget.dart' show DoctorProfileWidget;
import 'package:flutter/material.dart';

class DoctorProfileModel extends FlutterFlowModel<DoctorProfileWidget> {
  ///  Local state fields for this page.

  DocRecord? docDocument;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in doctor_profile widget.
  DocRecord? returnnedDoc;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    customNavbarModel.dispose();
  }
}
