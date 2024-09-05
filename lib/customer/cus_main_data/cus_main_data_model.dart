import '/backend/backend.dart';
import '/data_loading_components/load_cities_coponent/load_cities_coponent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/upload_photo/upload_photo_widget.dart';
import 'cus_main_data_widget.dart' show CusMainDataWidget;
import 'package:flutter/material.dart';

class CusMainDataModel extends FlutterFlowModel<CusMainDataWidget> {
  ///  Local state fields for this page.

  String cusNmae = 'c';

  String tel = '0';

  int? countryKey = 1;

  int? govKey = -1;

  int? zoneKey = -1;

  int? areaKey = -1;

  String addressDesc = ' ';

  DateTime? cusDOB;

  bool isValidGenger = true;

  bool isValidDOB = true;

  int? genderKey = -1;

  bool isValidGovKey = true;

  bool isValidZoneKey = true;

  bool isValideAreaKey = true;

  bool isDataSaved = false;

  String cusID = '00';

  String cusImage = '-';

  CusRecord? cusDocument;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in cus_main_data widget.
  CusRecord? returnedReadCustomer;
  // State field(s) for txtFullNameField widget.
  FocusNode? txtFullNameFieldFocusNode;
  TextEditingController? txtFullNameFieldTextController;
  String? Function(BuildContext, String?)?
      txtFullNameFieldTextControllerValidator;
  String? _txtFullNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't43wvfwa' /* من فضلك ادخل اسمك كامل */,
      );
    }

    if (val.length > 100) {
      return FFLocalizations.of(context).getText(
        'jhaafpy5' /* اسم طويل جدا */,
      );
    }

    return null;
  }

  // State field(s) for txtMobile widget.
  FocusNode? txtMobileFocusNode;
  TextEditingController? txtMobileTextController;
  String? Function(BuildContext, String?)? txtMobileTextControllerValidator;
  String? _txtMobileTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lx91dy02' /* من فضلك ادخل اسمك الموبيل */,
      );
    }

    if (val.length < 11) {
      return FFLocalizations.of(context).getText(
        's4yi5wep' /* رقم الموبيل خطأ */,
      );
    }
    if (val.length > 15) {
      return FFLocalizations.of(context).getText(
        'khsvk2kd' /* رقم الموبيل خطأ */,
      );
    }

    return null;
  }

  // State field(s) for optGender widget.
  FormFieldController<List<String>>? optGenderValueController;
  String? get optGenderValue => optGenderValueController?.value?.firstOrNull;
  set optGenderValue(String? val) =>
      optGenderValueController?.value = val != null ? [val] : [];
  // State field(s) for cboCountryCode widget.
  int? cboCountryCodeValue;
  FormFieldController<int>? cboCountryCodeValueController;
  // State field(s) for cboGovCode widget.
  int? cboGovCodeValue;
  FormFieldController<int>? cboGovCodeValueController;
  // State field(s) for cboZoneCode widget.
  int? cboZoneCodeValue;
  FormFieldController<int>? cboZoneCodeValueController;
  // State field(s) for cboAreaCode widget.
  int? cboAreaCodeValue;
  FormFieldController<int>? cboAreaCodeValueController;
  // State field(s) for txtAddressDesc widget.
  FocusNode? txtAddressDescFocusNode;
  TextEditingController? txtAddressDescTextController;
  String? Function(BuildContext, String?)?
      txtAddressDescTextControllerValidator;
  String? _txtAddressDescTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tc3t5q5u' /* Field is required */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'evxfe1nk' /* يجب ادخال عنوان كامل */,
      );
    }
    if (val.length > 150) {
      return FFLocalizations.of(context).getText(
        '8q5iqyfl' /* العنوان طويل جدا */,
      );
    }

    return null;
  }

  // Model for upload_photo component.
  late UploadPhotoModel uploadPhotoModel;
  // Model for loadCitiesCoponent component.
  late LoadCitiesCoponentModel loadCitiesCoponentModel;
  // Stores action output result for [Action Block - validateData] action in Button widget.
  bool? isValidData;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formIsValid;
  // Stores action output result for [Action Block - CreateOrUpdateAction] action in Button widget.
  DocumentReference? savedRef;

  @override
  void initState(BuildContext context) {
    txtFullNameFieldTextControllerValidator =
        _txtFullNameFieldTextControllerValidator;
    txtMobileTextControllerValidator = _txtMobileTextControllerValidator;
    txtAddressDescTextControllerValidator =
        _txtAddressDescTextControllerValidator;
    uploadPhotoModel = createModel(context, () => UploadPhotoModel());
    loadCitiesCoponentModel =
        createModel(context, () => LoadCitiesCoponentModel());
  }

  @override
  void dispose() {
    txtFullNameFieldFocusNode?.dispose();
    txtFullNameFieldTextController?.dispose();

    txtMobileFocusNode?.dispose();
    txtMobileTextController?.dispose();

    txtAddressDescFocusNode?.dispose();
    txtAddressDescTextController?.dispose();

    uploadPhotoModel.dispose();
    loadCitiesCoponentModel.dispose();
  }

  /// Action blocks.
  Future<bool?> validateData(BuildContext context) async {
    isValidDOB = true;
    isValidGenger = true;
    isValidGovKey = true;
    isValidZoneKey = true;
    isValideAreaKey = true;
    if (areaKey == -1) {
      isValideAreaKey = false;
    }
    if (zoneKey == -1) {
      isValidZoneKey = false;
    }
    if (govKey == -1) {
      isValidGovKey = false;
    }
    if (genderKey == -1) {
      isValidGenger = false;
    }
    if (cusDOB == null) {
      isValidDOB = false;
    }
    if ((isValidGenger == false) ||
        (isValidDOB == false) ||
        (isValidGovKey == false) ||
        (isValidZoneKey == false) ||
        (isValideAreaKey == false)) {
      return false;
    }

    return true;
  }

  Future<DocumentReference?> createOrUpdateAction(BuildContext context) async {
    CusRecord? createdRecord;

    if (widget!.cusRef != null) {
      // update data

      await widget!.cusRef!.update(createCusRecordData(
        name: valueOrDefault<String>(
          txtFullNameFieldTextController.text,
          'n',
        ),
        tel: valueOrDefault<String>(
          txtMobileTextController.text,
          'n',
        ),
        dob: cusDOB,
        sex: genderKey,
        govCde: govKey,
        zoneCde: zoneKey,
        conCde: countryKey,
        areaCde: areaKey,
        addr: txtAddressDescTextController.text,
      ));
      return widget!.cusRef;
    } else {
      var cusRecordReference = CusRecord.collection.doc();
      await cusRecordReference.set(createCusRecordData(
        name: txtFullNameFieldTextController.text,
        tel: txtMobileTextController.text,
        dob: cusDOB,
        sex: genderKey,
        govCde: govKey,
        zoneCde: zoneKey,
        conCde: countryKey,
        areaCde: areaKey,
        addr: txtAddressDescTextController.text,
      ));
      createdRecord = CusRecord.getDocumentFromData(
          createCusRecordData(
            name: txtFullNameFieldTextController.text,
            tel: txtMobileTextController.text,
            dob: cusDOB,
            sex: genderKey,
            govCde: govKey,
            zoneCde: zoneKey,
            conCde: countryKey,
            areaCde: areaKey,
            addr: txtAddressDescTextController.text,
          ),
          cusRecordReference);
      return createdRecord.reference;
    }
  }
}
