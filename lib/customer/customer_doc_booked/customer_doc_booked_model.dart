import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/cancel_booking_component_widget.dart';
import '/components/image_component_circle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_navbar/custom_navbar_widget.dart';
import '/pages/public_components/booked_status_component/booked_status_component_widget.dart';
import 'customer_doc_booked_widget.dart' show CustomerDocBookedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in customer_doc_booked widget.
  List<DocBookedTimeRecord>? returnedBookedItems;
  // Stores action output result for [Backend Call - Read Document] action in customer_doc_booked widget.
  DocRecord? returnedDoc;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    customNavbarModel.dispose();
  }
}
