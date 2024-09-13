import '/data_loading_components/load_ref_data_component/load_ref_data_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'onboarding01_widget.dart' show Onboarding01Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Onboarding01Model extends FlutterFlowModel<Onboarding01Widget> {
  ///  Local state fields for this page.

  bool isLoadingCompleted = false;

  bool isDone = false;

  ///  State fields for stateful widgets in this page.

  // Model for loadRefData_Component component.
  late LoadRefDataComponentModel loadRefDataComponentModel;

  @override
  void initState(BuildContext context) {
    loadRefDataComponentModel =
        createModel(context, () => LoadRefDataComponentModel());
  }

  @override
  void dispose() {
    loadRefDataComponentModel.dispose();
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
