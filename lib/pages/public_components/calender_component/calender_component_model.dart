import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'calender_component_widget.dart' show CalenderComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalenderComponentModel extends FlutterFlowModel<CalenderComponentWidget> {
  ///  Local state fields for this component.

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CalenderControl widget.
  DateTimeRange? calenderControlSelectedDay;

  @override
  void initState(BuildContext context) {
    calenderControlSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
