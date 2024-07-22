import '/data_loading_components/load_day_hours_data/load_day_hours_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/public_components/custom_navbar/custom_navbar_widget.dart';
import 'doctor_data_schedule_widget.dart' show DoctorDataScheduleWidget;
import 'package:flutter/material.dart';

class DoctorDataScheduleModel
    extends FlutterFlowModel<DoctorDataScheduleWidget> {
  ///  Local state fields for this page.

  List<String> imageList = [];
  void addToImageList(String item) => imageList.add(item);
  void removeFromImageList(String item) => imageList.remove(item);
  void removeAtIndexFromImageList(int index) => imageList.removeAt(index);
  void insertAtIndexInImageList(int index, String item) =>
      imageList.insert(index, item);
  void updateImageListAtIndex(int index, Function(String) updateFn) =>
      imageList[index] = updateFn(imageList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for fullNameField widget.
  FocusNode? fullNameFieldFocusNode1;
  TextEditingController? fullNameFieldTextController1;
  String? Function(BuildContext, String?)?
      fullNameFieldTextController1Validator;
  // State field(s) for fullNameField widget.
  FocusNode? fullNameFieldFocusNode2;
  TextEditingController? fullNameFieldTextController2;
  String? Function(BuildContext, String?)?
      fullNameFieldTextController2Validator;
  // State field(s) for fullNameField widget.
  FocusNode? fullNameFieldFocusNode3;
  TextEditingController? fullNameFieldTextController3;
  String? Function(BuildContext, String?)?
      fullNameFieldTextController3Validator;
  // Model for loadDayHoursData component.
  late LoadDayHoursDataModel loadDayHoursDataModel;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    loadDayHoursDataModel = createModel(context, () => LoadDayHoursDataModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFieldFocusNode1?.dispose();
    fullNameFieldTextController1?.dispose();

    fullNameFieldFocusNode2?.dispose();
    fullNameFieldTextController2?.dispose();

    fullNameFieldFocusNode3?.dispose();
    fullNameFieldTextController3?.dispose();

    loadDayHoursDataModel.dispose();
    customNavbarModel.dispose();
  }
}
