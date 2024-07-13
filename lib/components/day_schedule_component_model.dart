import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'day_schedule_component_widget.dart' show DayScheduleComponentWidget;
import 'package:flutter/material.dart';

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

  ///  State fields for stateful widgets in this component.

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
