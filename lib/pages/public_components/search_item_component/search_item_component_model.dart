import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_item_component_widget.dart' show SearchItemComponentWidget;
import 'package:flutter/material.dart';

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

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - copyToList] action in search_item_component widget.
  List<DtGeneralListStruct>? returnedData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
