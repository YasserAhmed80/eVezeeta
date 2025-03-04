import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'notification_component_widget.dart' show NotificationComponentWidget;
import 'package:flutter/material.dart';

class NotificationComponentModel
    extends FlutterFlowModel<NotificationComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for txtNote widget.
  FocusNode? txtNoteFocusNode;
  TextEditingController? txtNoteTextController;
  String? Function(BuildContext, String?)? txtNoteTextControllerValidator;
  String? _txtNoteTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xcyvq3e6' /* Field is required */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'fdz6j6j7' /* اقل من 10 حروف */,
      );
    }
    if (val.length > 200) {
      return FFLocalizations.of(context).getText(
        'bzt90599' /* اكثر من 200 حرف */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? isValideForm;

  @override
  void initState(BuildContext context) {
    txtNoteTextControllerValidator = _txtNoteTextControllerValidator;
  }

  @override
  void dispose() {
    txtNoteFocusNode?.dispose();
    txtNoteTextController?.dispose();
  }
}
