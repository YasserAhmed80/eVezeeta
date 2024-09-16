import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/dark_mode_component/dark_mode_component_widget.dart';
import 'admin_side_nav_component_widget.dart' show AdminSideNavComponentWidget;
import 'package:flutter/material.dart';

class AdminSideNavComponentModel
    extends FlutterFlowModel<AdminSideNavComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for darkMode_Component component.
  late DarkModeComponentModel darkModeComponentModel;

  @override
  void initState(BuildContext context) {
    darkModeComponentModel =
        createModel(context, () => DarkModeComponentModel());
  }

  @override
  void dispose() {
    darkModeComponentModel.dispose();
  }
}
