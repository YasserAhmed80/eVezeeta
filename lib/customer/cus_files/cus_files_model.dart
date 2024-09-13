import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/public_components/empty_list_component/empty_list_component_widget.dart';
import '/pages/public_components/image_component/image_component_widget.dart';
import 'cus_files_widget.dart' show CusFilesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
