import '/data_loading_components/load_cities_coponent/load_cities_coponent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cus_main_data_widget.dart' show CusMainDataWidget;
import 'package:flutter/material.dart';

class CusMainDataModel extends FlutterFlowModel<CusMainDataWidget> {
  ///  Local state fields for this page.

  String cusNmae = 'c';

  String tel = '0';

  int? genderKey = 0;

  int? countryKey = 1;

  int? govKey = 0;

  int? zoneKey = 0;

  int? areaKey = 0;

  String addressDesc = ' ';

  DateTime? cusDOB;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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

    return null;
  }

  // State field(s) for txtMobile widget.
  FocusNode? txtMobileFocusNode;
  TextEditingController? txtMobileTextController;
  String? Function(BuildContext, String?)? txtMobileTextControllerValidator;
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
  // Model for loadCitiesCoponent component.
  late LoadCitiesCoponentModel loadCitiesCoponentModel;

  @override
  void initState(BuildContext context) {
    txtFullNameFieldTextControllerValidator =
        _txtFullNameFieldTextControllerValidator;
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

    loadCitiesCoponentModel.dispose();
  }
}
