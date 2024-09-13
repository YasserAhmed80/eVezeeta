import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/public_components/calender_component/calender_component_widget.dart';
import '/pages/upload_photo/upload_photo_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cus_new_file_widget.dart' show CusNewFileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CusNewFileModel extends FlutterFlowModel<CusNewFileWidget> {
  ///  Local state fields for this page.

  bool isValidFileDate = true;

  bool isValidFileType = true;

  int? fileKey = -1;

  DateTime? fileDate;

  CusFilesRecord? fileDocument;

  bool isDataSaved = false;

  String currentFileCode = 'xxx';

  bool isPageLoading = true;

  bool isValideFileDate = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in cus_new_file widget.
  CusFilesRecord? returnedFile;
  // State field(s) for cboFileType widget.
  int? cboFileTypeValue;
  FormFieldController<int>? cboFileTypeValueController;
  // State field(s) for txtFileDesc widget.
  FocusNode? txtFileDescFocusNode;
  TextEditingController? txtFileDescTextController;
  String? Function(BuildContext, String?)? txtFileDescTextControllerValidator;
  String? _txtFileDescTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vhkeywy5' /* Field is required */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'rfzfvabs' /* حجم المعلومات صغير جدا */,
      );
    }
    if (val.length > 150) {
      return FFLocalizations.of(context).getText(
        '9ujnvguj' /* حجم المعلومات كبير جدا */,
      );
    }

    return null;
  }

  // State field(s) for txtDocDesc widget.
  FocusNode? txtDocDescFocusNode;
  TextEditingController? txtDocDescTextController;
  String? Function(BuildContext, String?)? txtDocDescTextControllerValidator;
  String? _txtDocDescTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xcyvq3e6' /* Field is required */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        '45xd2xtl' /* حجم المعلومات صغير جدا */,
      );
    }
    if (val.length > 200) {
      return FFLocalizations.of(context).getText(
        '9rv7l8f5' /* حجم المعلومات كبير جدا */,
      );
    }

    return null;
  }

  // Stores action output result for [Action Block - validateData] action in Button widget.
  bool? isValidData;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formIsValid;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CusFilesRecord? savedFile;
  // Model for imageComponentItem.
  late UploadPhotoModel imageComponentItemModel;

  @override
  void initState(BuildContext context) {
    txtFileDescTextControllerValidator = _txtFileDescTextControllerValidator;
    txtDocDescTextControllerValidator = _txtDocDescTextControllerValidator;
    imageComponentItemModel = createModel(context, () => UploadPhotoModel());
  }

  @override
  void dispose() {
    txtFileDescFocusNode?.dispose();
    txtFileDescTextController?.dispose();

    txtDocDescFocusNode?.dispose();
    txtDocDescTextController?.dispose();

    imageComponentItemModel.dispose();
  }

  /// Action blocks.
  Future<bool?> validateData(BuildContext context) async {
    if (fileKey == -1) {
      isValidFileType = false;
    }
    if (fileDate == null) {
      isValidFileDate = false;
    }
    if ((isValidFileDate == false) || (isValidFileType == false)) {
      return false;
    }

    return true;
  }
}
