import '/flutter_flow/flutter_flow_util.dart';
import 'switch_title_component_widget.dart' show SwitchTitleComponentWidget;
import 'package:flutter/material.dart';

class SwitchTitleComponentModel
    extends FlutterFlowModel<SwitchTitleComponentWidget> {
  ///  Local state fields for this component.

  List<int> selectedList = [];
  void addToSelectedList(int item) => selectedList.add(item);
  void removeFromSelectedList(int item) => selectedList.remove(item);
  void removeAtIndexFromSelectedList(int index) => selectedList.removeAt(index);
  void insertAtIndexInSelectedList(int index, int item) =>
      selectedList.insert(index, item);
  void updateSelectedListAtIndex(int index, Function(int) updateFn) =>
      selectedList[index] = updateFn(selectedList[index]);

  bool switchValue = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
