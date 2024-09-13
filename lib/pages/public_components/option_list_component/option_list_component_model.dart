import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'option_list_component_widget.dart' show OptionListComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OptionListComponentModel
    extends FlutterFlowModel<OptionListComponentWidget> {
  ///  Local state fields for this component.

  int? selectedCode;

  List<DtGeneralListStruct> currentList = [];
  void addToCurrentList(DtGeneralListStruct item) => currentList.add(item);
  void removeFromCurrentList(DtGeneralListStruct item) =>
      currentList.remove(item);
  void removeAtIndexFromCurrentList(int index) => currentList.removeAt(index);
  void insertAtIndexInCurrentList(int index, DtGeneralListStruct item) =>
      currentList.insert(index, item);
  void updateCurrentListAtIndex(
          int index, Function(DtGeneralListStruct) updateFn) =>
      currentList[index] = updateFn(currentList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - copyToList] action in option_list_component widget.
  List<DtGeneralListStruct>? returnedList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
