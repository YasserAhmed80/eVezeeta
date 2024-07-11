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
  // State field(s) for addressDesc widget.
  FocusNode? addressDescFocusNode;
  TextEditingController? addressDescTextController;
  String? Function(BuildContext, String?)? addressDescTextControllerValidator;
  String? _addressDescTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6z4kdjmt' /* من فضلك ادخل عنوان الشارع و ال... */,
      );
    }

    return null;
  }

  // State field(s) for tel1 widget.
  FocusNode? tel1FocusNode;
  TextEditingController? tel1TextController;
  String? Function(BuildContext, String?)? tel1TextControllerValidator;
  String? _tel1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'swbyk6o7' /* من فضلك ادخل تليفون 1 */,
      );
    }

    if (val.length < 11) {
      return 'Requires at least 11 characters.';
    }
    if (val.length > 11) {
      return 'Maximum 11 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for tel2 widget.
  FocusNode? tel2FocusNode;
  TextEditingController? tel2TextController;
  String? Function(BuildContext, String?)? tel2TextControllerValidator;
  String? _tel2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wg1mjq5j' /* من فضلك ادخل تليفون 2  */,
      );
    }

    return null;
  }

  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    addressDescTextControllerValidator = _addressDescTextControllerValidator;
    tel1TextControllerValidator = _tel1TextControllerValidator;
    tel2TextControllerValidator = _tel2TextControllerValidator;
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    addressDescFocusNode?.dispose();
    addressDescTextController?.dispose();

    tel1FocusNode?.dispose();
    tel1TextController?.dispose();

    tel2FocusNode?.dispose();
    tel2TextController?.dispose();

    customNavbarModel.dispose();
  }
}
