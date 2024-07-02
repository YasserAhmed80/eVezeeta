import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/public_components/custom_navbar/custom_navbar_widget.dart';
import 'doctor_data_main_widget.dart' show DoctorDataMainWidget;
import 'package:flutter/material.dart';

class DoctorDataMainModel extends FlutterFlowModel<DoctorDataMainWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4fdfux20' /* Please enter the patients full... */,
      );
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode1;
  TextEditingController? descriptionTextController1;
  String? Function(BuildContext, String?)? descriptionTextController1Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode2;
  TextEditingController? descriptionTextController2;
  String? Function(BuildContext, String?)? descriptionTextController2Validator;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    descriptionFocusNode1?.dispose();
    descriptionTextController1?.dispose();

    descriptionFocusNode2?.dispose();
    descriptionTextController2?.dispose();

    customNavbarModel.dispose();
  }
}
