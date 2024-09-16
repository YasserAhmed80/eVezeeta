import '/backend/backend.dart';
import '/components/reviw_status_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/code_component/code_component_widget.dart';
import '/public_components/custom_navbar/custom_navbar_widget.dart';
import '/public_components/dark_mode_component/dark_mode_component_widget.dart';
import '/public_components/image_component_circle/image_component_circle_widget.dart';
import '/public_components/loading_component/loading_component_widget.dart';
import 'doctor_account_widget.dart' show DoctorAccountWidget;
import 'package:flutter/material.dart';

class DoctorAccountModel extends FlutterFlowModel<DoctorAccountWidget> {
  ///  Local state fields for this page.

  DocRecord? docDocument;

  int? docStatusCode = 0;

  bool isLoadingCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in doctor_account widget.
  DocRecord? returnnedDoc;
  // Model for image_component_circle component.
  late ImageComponentCircleModel imageComponentCircleModel;
  // Model for code_component component.
  late CodeComponentModel codeComponentModel;
  // Model for reviw_status_component component.
  late ReviwStatusComponentModel reviwStatusComponentModel;
  // Model for darkMode_Component component.
  late DarkModeComponentModel darkModeComponentModel;
  // Model for loading_component component.
  late LoadingComponentModel loadingComponentModel;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    imageComponentCircleModel =
        createModel(context, () => ImageComponentCircleModel());
    codeComponentModel = createModel(context, () => CodeComponentModel());
    reviwStatusComponentModel =
        createModel(context, () => ReviwStatusComponentModel());
    darkModeComponentModel =
        createModel(context, () => DarkModeComponentModel());
    loadingComponentModel = createModel(context, () => LoadingComponentModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    imageComponentCircleModel.dispose();
    codeComponentModel.dispose();
    reviwStatusComponentModel.dispose();
    darkModeComponentModel.dispose();
    loadingComponentModel.dispose();
    customNavbarModel.dispose();
  }
}
