import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/custom_navbar/custom_navbar_widget.dart';
import 'cus_master_page_widget.dart' show CusMasterPageWidget;
import 'package:flutter/material.dart';

class CusMasterPageModel extends FlutterFlowModel<CusMasterPageWidget> {
  ///  Local state fields for this page.

  String cusNmae = 'c';

  String tel = '0';

  int? genderKey = 0;

  int? countryKey = 1;

  int? govKey = 0;

  int? zoneKey = 0;

  int? areaKey = 0;

  String addressDesc = ' ';

  ///  State fields for stateful widgets in this page.

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
