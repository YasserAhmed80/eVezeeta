import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'doctor_files_component_widget.dart' show DoctorFilesComponentWidget;
import 'package:flutter/material.dart';

class DoctorFilesComponentModel
    extends FlutterFlowModel<DoctorFilesComponentWidget> {
  ///  Local state fields for this component.

  List<String> imageList = [];
  void addToImageList(String item) => imageList.add(item);
  void removeFromImageList(String item) => imageList.remove(item);
  void removeAtIndexFromImageList(int index) => imageList.removeAt(index);
  void insertAtIndexInImageList(int index, String item) =>
      imageList.insert(index, item);
  void updateImageListAtIndex(int index, Function(String) updateFn) =>
      imageList[index] = updateFn(imageList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in doctor_files_component widget.
  List<ImgsRecord>? returnedData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
