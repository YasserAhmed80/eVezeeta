import '/flutter_flow/flutter_flow_util.dart';
import 'upload_photo_widget.dart' show UploadPhotoWidget;
import 'package:flutter/material.dart';

class UploadPhotoModel extends FlutterFlowModel<UploadPhotoWidget> {
  ///  Local state fields for this component.

  String url =
      'https://media.gettyimages.com/id/1331913108/photo/great-pyramids-and-the-camel-caravan-is-in-front-of-the-egyptian-pyramids-giza-egypt.jpg?s=612x612&w=gi&k=20&c=MT03Uje4GqcDEVL3KmgG52csw-knigvNcOMBV1UE8FM=';

  FFUploadedFile? uplodedImage;

  bool saveLoadImage = false;

  bool? isLoading;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - saveImageToStorage1] action in IconButton widget.
  String? photoName;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
