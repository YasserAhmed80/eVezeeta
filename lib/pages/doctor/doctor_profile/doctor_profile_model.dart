import '/flutter_flow/flutter_flow_util.dart';
import '/pages/public_components/custom_navbar/custom_navbar_widget.dart';
import 'doctor_profile_widget.dart' show DoctorProfileWidget;
import 'package:flutter/material.dart';

class DoctorProfileModel extends FlutterFlowModel<DoctorProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customNavbarModel.dispose();
  }
}
