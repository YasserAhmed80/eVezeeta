import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/doctor_files_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/public_components/addrress_component/addrress_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'doctor_profile_widget.dart' show DoctorProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
