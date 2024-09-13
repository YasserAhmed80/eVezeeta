import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/doctor/doctor_data_component/doctor_data_component_widget.dart';
import '/pages/public_components/empty_list_component/empty_list_component_widget.dart';
import 'customer_favorit_doc_widget.dart' show CustomerFavoritDocWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerFavoritDocModel
    extends FlutterFlowModel<CustomerFavoritDocWidget> {
  ///  Local state fields for this page.

  List<DocRecord> doctorDocumentList = [];
  void addToDoctorDocumentList(DocRecord item) => doctorDocumentList.add(item);
  void removeFromDoctorDocumentList(DocRecord item) =>
      doctorDocumentList.remove(item);
  void removeAtIndexFromDoctorDocumentList(int index) =>
      doctorDocumentList.removeAt(index);
  void insertAtIndexInDoctorDocumentList(int index, DocRecord item) =>
      doctorDocumentList.insert(index, item);
  void updateDoctorDocumentListAtIndex(
          int index, Function(DocRecord) updateFn) =>
      doctorDocumentList[index] = updateFn(doctorDocumentList[index]);

  int? loopIndex = 0;

  int? loopMax = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in customer_favorit_doc widget.
  List<CusFavDocRecord>? returnedDocRef;
  // Stores action output result for [Backend Call - Read Document] action in customer_favorit_doc widget.
  DocRecord? readDocDocument;
  // Model for emptyListComponent component.
  late EmptyListComponentModel emptyListComponentModel;

  @override
  void initState(BuildContext context) {
    emptyListComponentModel =
        createModel(context, () => EmptyListComponentModel());
  }

  @override
  void dispose() {
    emptyListComponentModel.dispose();
  }
}
