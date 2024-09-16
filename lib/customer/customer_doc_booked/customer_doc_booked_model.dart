import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/custom_navbar/custom_navbar_widget.dart';
import '/public_components/loading_component/loading_component_widget.dart';
import 'customer_doc_booked_widget.dart' show CustomerDocBookedWidget;
import 'package:flutter/material.dart';

class CustomerDocBookedModel extends FlutterFlowModel<CustomerDocBookedWidget> {
  ///  Local state fields for this page.

  List<DtBookedItemStruct> bookedList = [];
  void addToBookedList(DtBookedItemStruct item) => bookedList.add(item);
  void removeFromBookedList(DtBookedItemStruct item) => bookedList.remove(item);
  void removeAtIndexFromBookedList(int index) => bookedList.removeAt(index);
  void insertAtIndexInBookedList(int index, DtBookedItemStruct item) =>
      bookedList.insert(index, item);
  void updateBookedListAtIndex(
          int index, Function(DtBookedItemStruct) updateFn) =>
      bookedList[index] = updateFn(bookedList[index]);

  int? loopIndex = 0;

  int? loopMax = 0;

  bool isLoadingCompleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in customer_doc_booked widget.
  List<DocBookedTimeRecord>? returnedBookedItems;
  // Stores action output result for [Backend Call - Read Document] action in customer_doc_booked widget.
  DocRecord? returnedDoc;
  // Model for loading_component component.
  late LoadingComponentModel loadingComponentModel;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    loadingComponentModel = createModel(context, () => LoadingComponentModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    loadingComponentModel.dispose();
    customNavbarModel.dispose();
  }
}
