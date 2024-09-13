import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_navbar/custom_navbar_widget.dart';
import '/pages/doctor/doctor_data_component/doctor_data_component_widget.dart';
import '/pages/public_components/empty_list_component/empty_list_component_widget.dart';
import '/search/doc_search_item_list_component/doc_search_item_list_component_widget.dart';
import '/search/search_address_component/search_address_component_widget.dart';
import '/search/search_category_component/search_category_component_widget.dart';
import 'doctor_search_widget.dart' show DoctorSearchWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoctorSearchModel extends FlutterFlowModel<DoctorSearchWidget> {
  ///  Local state fields for this page.

  int? selectedGov;

  int? selectedZone;

  int? selectedArea;

  String selectedGovDesc = 'الكل';

  String selectedZoneDesc = 'الكل';

  String selectedAreaDesc = 'الكل';

  ///  State fields for stateful widgets in this page.

  // Models for doctor_data_component dynamic component.
  late FlutterFlowDynamicModels<DoctorDataComponentModel>
      doctorDataComponentModels;
  // Model for doc_search_item_list_component component.
  late DocSearchItemListComponentModel docSearchItemListComponentModel;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    doctorDataComponentModels =
        FlutterFlowDynamicModels(() => DoctorDataComponentModel());
    docSearchItemListComponentModel =
        createModel(context, () => DocSearchItemListComponentModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    doctorDataComponentModels.dispose();
    docSearchItemListComponentModel.dispose();
    customNavbarModel.dispose();
  }
}
