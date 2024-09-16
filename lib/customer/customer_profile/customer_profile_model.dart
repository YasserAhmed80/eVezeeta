import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/addrress_component/addrress_component_widget.dart';
import '/public_components/code_component/code_component_widget.dart';
import '/public_components/image_component_circle/image_component_circle_widget.dart';
import '/public_components/loading_component/loading_component_widget.dart';
import '/public_components/phone_icon_component/phone_icon_component_widget.dart';
import 'customer_profile_widget.dart' show CustomerProfileWidget;
import 'package:flutter/material.dart';

class CustomerProfileModel extends FlutterFlowModel<CustomerProfileWidget> {
  ///  Local state fields for this page.

  CusRecord? cusDocument;

  bool isLoadingCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in customer_profile widget.
  CusRecord? returnedCustomer;
  // Model for image_component_circle component.
  late ImageComponentCircleModel imageComponentCircleModel;
  // Model for phone_icon_component component.
  late PhoneIconComponentModel phoneIconComponentModel;
  // Model for addrress_component component.
  late AddrressComponentModel addrressComponentModel;
  // Model for code_component component.
  late CodeComponentModel codeComponentModel;
  // Model for loading_component component.
  late LoadingComponentModel loadingComponentModel;

  @override
  void initState(BuildContext context) {
    imageComponentCircleModel =
        createModel(context, () => ImageComponentCircleModel());
    phoneIconComponentModel =
        createModel(context, () => PhoneIconComponentModel());
    addrressComponentModel =
        createModel(context, () => AddrressComponentModel());
    codeComponentModel = createModel(context, () => CodeComponentModel());
    loadingComponentModel = createModel(context, () => LoadingComponentModel());
  }

  @override
  void dispose() {
    imageComponentCircleModel.dispose();
    phoneIconComponentModel.dispose();
    addrressComponentModel.dispose();
    codeComponentModel.dispose();
    loadingComponentModel.dispose();
  }
}
