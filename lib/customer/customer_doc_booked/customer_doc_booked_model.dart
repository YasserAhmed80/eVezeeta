import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_navbar/custom_navbar_widget.dart';
import 'customer_doc_booked_widget.dart' show CustomerDocBookedWidget;
import 'package:flutter/material.dart';

class CustomerDocBookedModel extends FlutterFlowModel<CustomerDocBookedWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in customer_doc_booked widget.
  List<DocBookedTimeRecord>? returnedBookedItems;
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
