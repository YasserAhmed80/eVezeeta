import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_navbar/custom_navbar_widget.dart';
import '/pages/public_components/image_component/image_component_widget.dart';
import 'doctor_account_widget.dart' show DoctorAccountWidget;
import 'package:flutter/material.dart';

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
