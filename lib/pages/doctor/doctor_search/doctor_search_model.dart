import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'doctor_search_widget.dart' show DoctorSearchWidget;
import 'package:flutter/material.dart';

class DoctorSearchModel extends FlutterFlowModel<DoctorSearchWidget> {
  ///  Local state fields for this page.

  int? selectedGov;

  int? selectedZone;

  int? selectedArea;

  String selectedGovDesc = 'الكل';

  String selectedZoneDesc = 'الكل';

  String selectedAreaDesc = 'الكل';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
