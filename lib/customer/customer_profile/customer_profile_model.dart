import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_navbar/custom_navbar_widget.dart';
import '/pages/public_components/addrress_component/addrress_component_widget.dart';
import '/pages/public_components/image_component/image_component_widget.dart';
import 'customer_profile_widget.dart' show CustomerProfileWidget;
import 'package:flutter/material.dart';

class CustomerProfileModel extends FlutterFlowModel<CustomerProfileWidget> {
  ///  Local state fields for this page.

  CusRecord? cusDocument;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in customer_profile widget.
  CusRecord? returnedCustomer;
  // Model for image_component component.
  late ImageComponentModel imageComponentModel;
  // Model for addrress_component component.
  late AddrressComponentModel addrressComponentModel;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    imageComponentModel = createModel(context, () => ImageComponentModel());
    addrressComponentModel =
        createModel(context, () => AddrressComponentModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    imageComponentModel.dispose();
    addrressComponentModel.dispose();
    customNavbarModel.dispose();
  }
}
