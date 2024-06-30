import '/components/custom_navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/public_components/upload_photo/upload_photo_widget.dart';
import 'doctor_data_images_widget.dart' show DoctorDataImagesWidget;
import 'package:flutter/material.dart';

class DoctorDataImagesModel extends FlutterFlowModel<DoctorDataImagesWidget> {
  ///  Local state fields for this page.

  List<String> imageList = [];
  void addToImageList(String item) => imageList.add(item);
  void removeFromImageList(String item) => imageList.remove(item);
  void removeAtIndexFromImageList(int index) => imageList.removeAt(index);
  void insertAtIndexInImageList(int index, String item) =>
      imageList.insert(index, item);
  void updateImageListAtIndex(int index, Function(String) updateFn) =>
      imageList[index] = updateFn(imageList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for upload_photo component.
  late UploadPhotoModel uploadPhotoModel;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    uploadPhotoModel = createModel(context, () => UploadPhotoModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    uploadPhotoModel.dispose();
    customNavbarModel.dispose();
  }
}
