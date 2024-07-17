import '/backend/backend.dart';
import '/components/switch_title_component_widget.dart';
import '/data_loading_components/load_categories_component/load_categories_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'doctor_data_main_widget.dart' show DoctorDataMainWidget;
import 'package:flutter/material.dart';

class DoctorDataMainModel extends FlutterFlowModel<DoctorDataMainWidget> {
  ///  Local state fields for this page.

  String? docName;

  int? docType = -1;

  int? docCategory = -1;

  List<int> docSubCategory = [];
  void addToDocSubCategory(int item) => docSubCategory.add(item);
  void removeFromDocSubCategory(int item) => docSubCategory.remove(item);
  void removeAtIndexFromDocSubCategory(int index) =>
      docSubCategory.removeAt(index);
  void insertAtIndexInDocSubCategory(int index, int item) =>
      docSubCategory.insert(index, item);
  void updateDocSubCategoryAtIndex(int index, Function(int) updateFn) =>
      docSubCategory[index] = updateFn(docSubCategory[index]);

  int? docTitleCde = -1;

  String? docTitleDesc;

  String? docAbout;

  bool isTypeSelected = true;

  bool isTitleSelected = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for fullNameField widget.
  FocusNode? fullNameFieldFocusNode;
  TextEditingController? fullNameFieldTextController;
  String? Function(BuildContext, String?)? fullNameFieldTextControllerValidator;
  String? _fullNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wpiz9b8i' /* من فضلك ادخل اسمك كامل */,
      );
    }

    return null;
  }

  // State field(s) for docTypeChoice widget.
  FormFieldController<List<String>>? docTypeChoiceValueController;
  String? get docTypeChoiceValue =>
      docTypeChoiceValueController?.value?.firstOrNull;
  set docTypeChoiceValue(String? val) =>
      docTypeChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for docTitleChoice widget.
  FormFieldController<List<String>>? docTitleChoiceValueController;
  String? get docTitleChoiceValue =>
      docTitleChoiceValueController?.value?.firstOrNull;
  set docTitleChoiceValue(String? val) =>
      docTitleChoiceValueController?.value = val != null ? [val] : [];
  // State field(s) for docTitleField widget.
  FocusNode? docTitleFieldFocusNode;
  TextEditingController? docTitleFieldTextController;
  String? Function(BuildContext, String?)? docTitleFieldTextControllerValidator;
  String? _docTitleFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6wm72l75' /* من فضلم ادخل لقبك المهني */,
      );
    }

    return null;
  }

  // State field(s) for aboutField widget.
  FocusNode? aboutFieldFocusNode;
  TextEditingController? aboutFieldTextController;
  String? Function(BuildContext, String?)? aboutFieldTextControllerValidator;
  String? _aboutFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4570g8p3' /* من فضلك اكتب بعض المعلومات عنك */,
      );
    }

    return null;
  }

  // State field(s) for docCategory widget.
  int? docCategoryValue;
  FormFieldController<int>? docCategoryValueController;
  // Models for switchTitleComponent dynamic component.
  late FlutterFlowDynamicModels<SwitchTitleComponentModel>
      switchTitleComponentModels;
  // Model for loadCategoriesComponent component.
  late LoadCategoriesComponentModel loadCategoriesComponentModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DocRecord? docReference;

  @override
  void initState(BuildContext context) {
    fullNameFieldTextControllerValidator =
        _fullNameFieldTextControllerValidator;
    docTitleFieldTextControllerValidator =
        _docTitleFieldTextControllerValidator;
    aboutFieldTextControllerValidator = _aboutFieldTextControllerValidator;
    switchTitleComponentModels =
        FlutterFlowDynamicModels(() => SwitchTitleComponentModel());
    loadCategoriesComponentModel =
        createModel(context, () => LoadCategoriesComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFieldFocusNode?.dispose();
    fullNameFieldTextController?.dispose();

    docTitleFieldFocusNode?.dispose();
    docTitleFieldTextController?.dispose();

    aboutFieldFocusNode?.dispose();
    aboutFieldTextController?.dispose();

    switchTitleComponentModels.dispose();
    loadCategoriesComponentModel.dispose();
  }
}
