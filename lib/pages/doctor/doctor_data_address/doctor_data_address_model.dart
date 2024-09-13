import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'doctor_data_address_widget.dart' show DoctorDataAddressWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  bool isValidData = true;

  bool isValidGonernate = true;

  bool isValidZone = true;

  bool isValidArea = true;

  ///  State fields for stateful widgets in this page.

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

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'z00u4mvd' /* عنوان قصير جدا */,
      );
    }
    if (val.length > 500) {
      return FFLocalizations.of(context).getText(
        'yz6lqgv9' /* عنوان طويل جدا */,
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
      return FFLocalizations.of(context).getText(
        'ebgspkuj' /* رقم تليفون خطا */,
      );
    }
    if (val.length > 11) {
      return FFLocalizations.of(context).getText(
        'dvwg4rz2' /* رقم تليفون خطا */,
      );
    }

    return null;
  }

  // State field(s) for tel2 widget.
  FocusNode? tel2FocusNode;
  TextEditingController? tel2TextController;
  String? Function(BuildContext, String?)? tel2TextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidation;
  // Stores action output result for [Action Block - validateDataAction] action in Button widget.
  bool? validateData;

  @override
  void initState(BuildContext context) {
    addressDescTextControllerValidator = _addressDescTextControllerValidator;
    tel1TextControllerValidator = _tel1TextControllerValidator;
  }

  @override
  void dispose() {
    addressDescFocusNode?.dispose();
    addressDescTextController?.dispose();

    tel1FocusNode?.dispose();
    tel1TextController?.dispose();

    tel2FocusNode?.dispose();
    tel2TextController?.dispose();
  }

  /// Action blocks.
  Future<bool?> validateDataAction(BuildContext context) async {
    isValidData = true;
    if (governateCode == -1) {
      isValidData = false;
      isValidGonernate = true;
    }
    if (zoneCodeValue == -1) {
      isValidData = false;
      isValidZone = false;
    }
    if (areaCode == -1) {
      isValidData = false;
      isValidArea = false;
    }
    return isValidData;
  }
}
