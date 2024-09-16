import '/data_loading_components/load_ref_data_component/load_ref_data_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding01_widget.dart' show Onboarding01Widget;
import 'package:flutter/material.dart';

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
      if (FFAppState().currentProfileType == 2) {
        context.pushNamed('cus_master_page');
      } else {
        if (FFAppState().currentProfileType == 4) {
          context.pushNamed('admin_doctor_review');
        }
      }
    }
  }
}
