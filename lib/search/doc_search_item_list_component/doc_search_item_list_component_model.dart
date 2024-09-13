import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/search/search_item_component/search_item_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'doc_search_item_list_component_widget.dart'
    show DocSearchItemListComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DocSearchItemListComponentModel
    extends FlutterFlowModel<DocSearchItemListComponentWidget> {
  ///  Local state fields for this component.

  List<int> selectedItemData = [];
  void addToSelectedItemData(int item) => selectedItemData.add(item);
  void removeFromSelectedItemData(int item) => selectedItemData.remove(item);
  void removeAtIndexFromSelectedItemData(int index) =>
      selectedItemData.removeAt(index);
  void insertAtIndexInSelectedItemData(int index, int item) =>
      selectedItemData.insert(index, item);
  void updateSelectedItemDataAtIndex(int index, Function(int) updateFn) =>
      selectedItemData[index] = updateFn(selectedItemData[index]);

  bool isActive = false;

  int? loopIndex = 0;

  int? loopMax;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
