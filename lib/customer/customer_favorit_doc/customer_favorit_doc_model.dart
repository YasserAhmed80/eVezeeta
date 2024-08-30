import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_favorit_doc_widget.dart' show CustomerFavoritDocWidget;
import 'package:flutter/material.dart';

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

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in customer_favorit_doc widget.
  List<CusFavDocRecord>? returnedDocRef;
  // Stores action output result for [Backend Call - Read Document] action in customer_favorit_doc widget.
  DocRecord? readDoctor;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
