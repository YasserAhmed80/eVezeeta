import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'upload_photo_widget.dart' show UploadPhotoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadPhotoModel extends FlutterFlowModel<UploadPhotoWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? uplodedImage;

  bool saveLoadImage = false;

  bool? isLoading;

  String? curretImage;

  DocumentReference? imageRef;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in upload_photo widget.
  List<ImgsRecord>? queryImage;
  // Stores action output result for [Custom Action - saveImageToStorage1] action in IconButton widget.
  DocumentReference? photoRef;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  ImgsRecord? savedImageDoc;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - getFileSize] action in IconButton widget.
  int? nFileSize;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future updateEntityImageAction(
    BuildContext context, {
    String? imgURL,
  }) async {
    if ((widget!.entityType == 'doc') && (widget!.imgType == 'p')) {
      await FFAppState().currentDoctor.dbDocRef!.update(createDocRecordData(
            img: imgURL,
          ));
    } else {
      if ((widget!.entityType == 'cus') && (widget!.imgType == 'p')) {
        await FFAppState()
            .currentCustomer
            .cusDocRef!
            .update(createCusRecordData(
              img: imgURL,
            ));
      } else {
        if (widget!.entityType == 'cus_file') {
          await FFAppState()
              .currentFileCustomer
              .fileRef!
              .update(createCusFilesRecordData(
                img: imgURL,
              ));
        }
      }
    }
  }
}
