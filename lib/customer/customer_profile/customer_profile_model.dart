import '/components/image_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/public_components/addrress_component/addrress_component_widget.dart';
import 'customer_profile_widget.dart' show CustomerProfileWidget;
import 'package:flutter/material.dart';

class CustomerProfileModel extends FlutterFlowModel<CustomerProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for image_component component.
  late ImageComponentModel imageComponentModel;
  // Model for addrress_component component.
  late AddrressComponentModel addrressComponentModel;

  @override
  void initState(BuildContext context) {
    imageComponentModel = createModel(context, () => ImageComponentModel());
    addrressComponentModel =
        createModel(context, () => AddrressComponentModel());
  }

  @override
  void dispose() {
    imageComponentModel.dispose();
    addrressComponentModel.dispose();
  }
}
