import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/addrress_component/addrress_component_widget.dart';
import '/public_components/code_component/code_component_widget.dart';
import '/public_components/custom_navbar/custom_navbar_widget.dart';
import '/public_components/dark_mode_component/dark_mode_component_widget.dart';
import '/public_components/image_component_circle/image_component_circle_widget.dart';
import '/public_components/loading_component/loading_component_widget.dart';
import 'customer_account_widget.dart' show CustomerAccountWidget;
import 'package:flutter/material.dart';

class CustomerAccountModel extends FlutterFlowModel<CustomerAccountWidget> {
  ///  Local state fields for this page.

  CusRecord? cusDocument;

  bool isLoadingCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in customer_account widget.
  CusRecord? returnedCustomer;
  // Model for image_component_circle component.
  late ImageComponentCircleModel imageComponentCircleModel;
  // Model for addrress_component component.
  late AddrressComponentModel addrressComponentModel;
  // Model for code_component component.
  late CodeComponentModel codeComponentModel;
  // Model for darkMode_Component_1.
  late DarkModeComponentModel darkModeComponent1Model;
  // Model for loading_component component.
  late LoadingComponentModel loadingComponentModel;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    imageComponentCircleModel =
        createModel(context, () => ImageComponentCircleModel());
    addrressComponentModel =
        createModel(context, () => AddrressComponentModel());
    codeComponentModel = createModel(context, () => CodeComponentModel());
    darkModeComponent1Model =
        createModel(context, () => DarkModeComponentModel());
    loadingComponentModel = createModel(context, () => LoadingComponentModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    imageComponentCircleModel.dispose();
    addrressComponentModel.dispose();
    codeComponentModel.dispose();
    darkModeComponent1Model.dispose();
    loadingComponentModel.dispose();
    customNavbarModel.dispose();
  }
}
