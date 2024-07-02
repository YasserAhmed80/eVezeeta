import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/public_components/custom_navbar/custom_navbar_widget.dart';
import 'doctor_data_address_widget.dart' show DoctorDataAddressWidget;
import 'package:flutter/material.dart';

class DoctorDataAddressModel extends FlutterFlowModel<DoctorDataAddressWidget> {
  ///  Local state fields for this page.

  int? countryCode = 1;

  int? governateCode = -1;

  int? zoneCode = -1;

  int? areaCode = -1;

  String? addrDesc;

  String? tel1;

  String? tel2;

  LatLng? latLng;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for countryCode widget.
  int? countryCodeValue;
  FormFieldController<int>? countryCodeValueController;
  // State field(s) for govCode widget.
  int? govCodeValue;
  FormFieldController<int>? govCodeValueController;
  // State field(s) for ZoneCode widget.
  int? zoneCodeValue;
  FormFieldController<int>? zoneCodeValueController;
  // State field(s) for areaCode widget.
  int? areaCodeValue;
  FormFieldController<int>? areaCodeValueController;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode1;
  TextEditingController? descriptionTextController1;
  String? Function(BuildContext, String?)? descriptionTextController1Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode2;
  TextEditingController? descriptionTextController2;
  String? Function(BuildContext, String?)? descriptionTextController2Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode3;
  TextEditingController? descriptionTextController3;
  String? Function(BuildContext, String?)? descriptionTextController3Validator;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    descriptionFocusNode1?.dispose();
    descriptionTextController1?.dispose();

    descriptionFocusNode2?.dispose();
    descriptionTextController2?.dispose();

    descriptionFocusNode3?.dispose();
    descriptionTextController3?.dispose();

    customNavbarModel.dispose();
  }
}
