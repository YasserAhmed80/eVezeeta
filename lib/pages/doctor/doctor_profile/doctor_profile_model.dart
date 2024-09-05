import '/backend/backend.dart';
import '/components/doctor_files_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/public_components/addrress_component/addrress_component_widget.dart';
import 'doctor_profile_widget.dart' show DoctorProfileWidget;
import 'package:flutter/material.dart';

class DoctorProfileModel extends FlutterFlowModel<DoctorProfileWidget> {
  ///  Local state fields for this page.

  DocRecord? docDocument;

  List<String> imageList = [];
  void addToImageList(String item) => imageList.add(item);
  void removeFromImageList(String item) => imageList.remove(item);
  void removeAtIndexFromImageList(int index) => imageList.removeAt(index);
  void insertAtIndexInImageList(int index, String item) =>
      imageList.insert(index, item);
  void updateImageListAtIndex(int index, Function(String) updateFn) =>
      imageList[index] = updateFn(imageList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in doctor_profile widget.
  DocRecord? returnedDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in doctor_profile widget.
  List<ImgsRecord>? returnedImages;
  // Model for addrress_component component.
  late AddrressComponentModel addrressComponentModel;
  // Model for doctor_files_component component.
  late DoctorFilesComponentModel doctorFilesComponentModel;

  @override
  void initState(BuildContext context) {
    addrressComponentModel =
        createModel(context, () => AddrressComponentModel());
    doctorFilesComponentModel =
        createModel(context, () => DoctorFilesComponentModel());
  }

  @override
  void dispose() {
    addrressComponentModel.dispose();
    doctorFilesComponentModel.dispose();
  }
}
