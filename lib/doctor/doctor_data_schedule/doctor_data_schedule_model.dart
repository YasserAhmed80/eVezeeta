import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/custom_navbar/custom_navbar_widget.dart';
import 'doctor_data_schedule_widget.dart' show DoctorDataScheduleWidget;
import 'package:flutter/material.dart';

class DoctorDataScheduleModel
    extends FlutterFlowModel<DoctorDataScheduleWidget> {
  ///  Local state fields for this page.

  int? bookTypeCode = 1;

  int? price = 400;

  int? priceRevisit = 100;

  int? avgVisitPerHour = 1;

  bool isValideBookType = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for txtPrice widget.
  FocusNode? txtPriceFocusNode;
  TextEditingController? txtPriceTextController;
  String? Function(BuildContext, String?)? txtPriceTextControllerValidator;
  // State field(s) for txtPriceRevisit widget.
  FocusNode? txtPriceRevisitFocusNode;
  TextEditingController? txtPriceRevisitTextController;
  String? Function(BuildContext, String?)?
      txtPriceRevisitTextControllerValidator;
  // State field(s) for txtAvergeVisit widget.
  FocusNode? txtAvergeVisitFocusNode;
  TextEditingController? txtAvergeVisitTextController;
  String? Function(BuildContext, String?)?
      txtAvergeVisitTextControllerValidator;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    txtPriceFocusNode?.dispose();
    txtPriceTextController?.dispose();

    txtPriceRevisitFocusNode?.dispose();
    txtPriceRevisitTextController?.dispose();

    txtAvergeVisitFocusNode?.dispose();
    txtAvergeVisitTextController?.dispose();

    customNavbarModel.dispose();
  }
}
