import '/components/addrress_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_profile_widget.dart' show CustomerProfileWidget;
import 'package:flutter/material.dart';

class CustomerProfileModel extends FlutterFlowModel<CustomerProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for addrress_component component.
  late AddrressComponentModel addrressComponentModel;

  @override
  void initState(BuildContext context) {
    addrressComponentModel =
        createModel(context, () => AddrressComponentModel());
  }

  @override
  void dispose() {
    addrressComponentModel.dispose();
  }
}
