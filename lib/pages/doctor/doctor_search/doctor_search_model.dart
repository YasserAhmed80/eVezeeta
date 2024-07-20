import '/flutter_flow/flutter_flow_util.dart';
import 'doctor_search_widget.dart' show DoctorSearchWidget;
import 'package:flutter/material.dart';

class DoctorSearchModel extends FlutterFlowModel<DoctorSearchWidget> {
  ///  Local state fields for this page.

  int? selectedGov;

  int? selectedZone;

  int? selectedArea;

  String selectedGovDesc = 'الكل';

  String selectedZoneDesc = 'الكل';

  String selectedAreaDesc = 'الكل';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
