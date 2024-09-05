import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cus_files_widget.dart' show CusFilesWidget;
import 'package:flutter/material.dart';

class CusFilesModel extends FlutterFlowModel<CusFilesWidget> {
  ///  Local state fields for this page.

  bool isValidFileDate = true;

  bool isValidFileType = true;

  int? fileKey = -1;

  DateTime? fileDate;

  CusFilesRecord? fileDocument;

  bool isActive = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future<bool?> validateData(BuildContext context) async {
    return null;
  }
}
