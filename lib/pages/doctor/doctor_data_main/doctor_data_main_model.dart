import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/public_components/empty_list_component/empty_list_component_widget.dart';
import '/pages/public_components/switch_title_component/switch_title_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'doctor_data_main_widget.dart' show DoctorDataMainWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  bool isNewDoctor = false;

  DocRecord? curDoctor;

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
  // State field(s) for txtDocTitleField widget.
  FocusNode? txtDocTitleFieldFocusNode;
  TextEditingController? txtDocTitleFieldTextController;
  String? Function(BuildContext, String?)?
      txtDocTitleFieldTextControllerValidator;
  String? _txtDocTitleFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6wm72l75' /* من فضلم ادخل لقبك المهني */,
      );
    }

    return null;
  }

  // State field(s) for txtAboutField widget.
  FocusNode? txtAboutFieldFocusNode;
  TextEditingController? txtAboutFieldTextController;
  String? Function(BuildContext, String?)? txtAboutFieldTextControllerValidator;
  String? _txtAboutFieldTextControllerValidator(
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
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DocRecord? createdDoc;

  @override
  void initState(BuildContext context) {
    txtFullNameFieldTextControllerValidator =
        _txtFullNameFieldTextControllerValidator;
    txtDocTitleFieldTextControllerValidator =
        _txtDocTitleFieldTextControllerValidator;
    txtAboutFieldTextControllerValidator =
        _txtAboutFieldTextControllerValidator;
    switchTitleComponentModels =
        FlutterFlowDynamicModels(() => SwitchTitleComponentModel());
  }

  @override
  void dispose() {
    txtFullNameFieldFocusNode?.dispose();
    txtFullNameFieldTextController?.dispose();

    txtDocTitleFieldFocusNode?.dispose();
    txtDocTitleFieldTextController?.dispose();

    txtAboutFieldFocusNode?.dispose();
    txtAboutFieldTextController?.dispose();

    switchTitleComponentModels.dispose();
  }
}
