import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_item_component_widget.dart' show SearchItemComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchItemComponentModel
    extends FlutterFlowModel<SearchItemComponentWidget> {
  ///  Local state fields for this component.

  List<int> selectedList = [];
  void addToSelectedList(int item) => selectedList.add(item);
  void removeFromSelectedList(int item) => selectedList.remove(item);
  void removeAtIndexFromSelectedList(int index) => selectedList.removeAt(index);
  void insertAtIndexInSelectedList(int index, int item) =>
      selectedList.insert(index, item);
  void updateSelectedListAtIndex(int index, Function(int) updateFn) =>
      selectedList[index] = updateFn(selectedList[index]);

  List<DtGeneralListStruct> dataList = [];
  void addToDataList(DtGeneralListStruct item) => dataList.add(item);
  void removeFromDataList(DtGeneralListStruct item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, DtGeneralListStruct item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(
          int index, Function(DtGeneralListStruct) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  double? fromValue;

  double? toValue = 3000.0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - copyToList] action in search_item_component widget.
  List<DtGeneralListStruct>? returnedData;
  // State field(s) for sliderFrom widget.
  double? sliderFromValue;
  // State field(s) for sliderTo widget.
  double? sliderToValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
