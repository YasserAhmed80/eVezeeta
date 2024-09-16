import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/loading_component/loading_component_widget.dart';
import 'cus_files_doctor_widget.dart' show CusFilesDoctorWidget;
import 'package:flutter/material.dart';

class CusFilesDoctorModel extends FlutterFlowModel<CusFilesDoctorWidget> {
  ///  Local state fields for this page.

  List<DtCusFilesStruct> filesList = [];
  void addToFilesList(DtCusFilesStruct item) => filesList.add(item);
  void removeFromFilesList(DtCusFilesStruct item) => filesList.remove(item);
  void removeAtIndexFromFilesList(int index) => filesList.removeAt(index);
  void insertAtIndexInFilesList(int index, DtCusFilesStruct item) =>
      filesList.insert(index, item);
  void updateFilesListAtIndex(int index, Function(DtCusFilesStruct) updateFn) =>
      filesList[index] = updateFn(filesList[index]);

  int? loopIndex = 0;

  int? loopMax = 0;

  bool isLoadingCompleted = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in cus_files_Doctor widget.
  List<CusFilesRecord>? returnedFiles;
  // Stores action output result for [Backend Call - Read Document] action in cus_files_Doctor widget.
  DocRecord? returnedDoc;
  // Model for loading_component component.
  late LoadingComponentModel loadingComponentModel;

  @override
  void initState(BuildContext context) {
    loadingComponentModel = createModel(context, () => LoadingComponentModel());
  }

  @override
  void dispose() {
    loadingComponentModel.dispose();
  }

  /// Action blocks.
  Future<bool?> validateData(BuildContext context) async {
    return null;
  }
}
