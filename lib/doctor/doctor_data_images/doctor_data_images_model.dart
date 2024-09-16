import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/upload_photo/upload_photo_widget.dart';
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

  // Model for upload_photo component.
  late UploadPhotoModel uploadPhotoModel1;
  // Model for upload_photo component.
  late UploadPhotoModel uploadPhotoModel2;
  // Model for upload_photo component.
  late UploadPhotoModel uploadPhotoModel3;
  // Model for upload_photo component.
  late UploadPhotoModel uploadPhotoModel4;
  // Model for upload_photo component.
  late UploadPhotoModel uploadPhotoModel5;

  @override
  void initState(BuildContext context) {
    uploadPhotoModel1 = createModel(context, () => UploadPhotoModel());
    uploadPhotoModel2 = createModel(context, () => UploadPhotoModel());
    uploadPhotoModel3 = createModel(context, () => UploadPhotoModel());
    uploadPhotoModel4 = createModel(context, () => UploadPhotoModel());
    uploadPhotoModel5 = createModel(context, () => UploadPhotoModel());
  }

  @override
  void dispose() {
    uploadPhotoModel1.dispose();
    uploadPhotoModel2.dispose();
    uploadPhotoModel3.dispose();
    uploadPhotoModel4.dispose();
    uploadPhotoModel5.dispose();
  }
}
