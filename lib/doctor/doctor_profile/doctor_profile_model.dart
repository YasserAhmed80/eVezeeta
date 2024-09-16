import '/backend/backend.dart';
import '/doctor/doctor_files_component/doctor_files_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/addrress_component/addrress_component_widget.dart';
import '/public_components/code_component/code_component_widget.dart';
import '/public_components/image_component_circle/image_component_circle_widget.dart';
import '/public_components/loading_component/loading_component_widget.dart';
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

  bool isLoadingCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in doctor_profile widget.
  DocRecord? returnedDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in doctor_profile widget.
  List<ImgsRecord>? returnedImages;
  // Model for image_component_circle component.
  late ImageComponentCircleModel imageComponentCircleModel;
  // Model for code_component component.
  late CodeComponentModel codeComponentModel;
  // Model for addrress_component component.
  late AddrressComponentModel addrressComponentModel;
  // Model for doctor_files_component component.
  late DoctorFilesComponentModel doctorFilesComponentModel;
  // Model for loading_component component.
  late LoadingComponentModel loadingComponentModel;

  @override
  void initState(BuildContext context) {
    imageComponentCircleModel =
        createModel(context, () => ImageComponentCircleModel());
    codeComponentModel = createModel(context, () => CodeComponentModel());
    addrressComponentModel =
        createModel(context, () => AddrressComponentModel());
    doctorFilesComponentModel =
        createModel(context, () => DoctorFilesComponentModel());
    loadingComponentModel = createModel(context, () => LoadingComponentModel());
  }

  @override
  void dispose() {
    imageComponentCircleModel.dispose();
    codeComponentModel.dispose();
    addrressComponentModel.dispose();
    doctorFilesComponentModel.dispose();
    loadingComponentModel.dispose();
  }
}
