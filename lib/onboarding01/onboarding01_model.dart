import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding01_widget.dart' show Onboarding01Widget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class Onboarding01Model extends FlutterFlowModel<Onboarding01Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Onboarding01 widget.
  LastDataLoadingRecord? returnedLoadingData;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 50000;
  int timerMilliseconds = 50000;
  String timerValue = StopWatchTimer.getDisplayTime(
    50000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }

  /// Action blocks.
  Future profileTypeAction(BuildContext context) async {
    if (FFAppState().currentProfileType == 1) {
      context.pushNamed('doctor_search');
    } else {
      context.pushNamed('cus_master_page');
    }
  }
}
