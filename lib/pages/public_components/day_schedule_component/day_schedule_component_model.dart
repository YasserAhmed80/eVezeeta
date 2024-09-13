import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'day_schedule_component_widget.dart' show DayScheduleComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DayScheduleComponentModel
    extends FlutterFlowModel<DayScheduleComponentWidget> {
  ///  Local state fields for this component.

  List<int> selectedHours = [];
  void addToSelectedHours(int item) => selectedHours.add(item);
  void removeFromSelectedHours(int item) => selectedHours.remove(item);
  void removeAtIndexFromSelectedHours(int index) =>
      selectedHours.removeAt(index);
  void insertAtIndexInSelectedHours(int index, int item) =>
      selectedHours.insert(index, item);
  void updateSelectedHoursAtIndex(int index, Function(int) updateFn) =>
      selectedHours[index] = updateFn(selectedHours[index]);

  DocumentReference? currentDay;

  bool isActiveDay = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in DayScheduleComponent widget.
  DocTimeRecord? savedDayRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DocTimeRecord? createdDay;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
