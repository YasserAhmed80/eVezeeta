import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_category_component_widget.dart'
    show SearchCategoryComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchCategoryComponentModel
    extends FlutterFlowModel<SearchCategoryComponentWidget> {
  ///  Local state fields for this component.

  List<DtGeneralListStruct> catList = [];
  void addToCatList(DtGeneralListStruct item) => catList.add(item);
  void removeFromCatList(DtGeneralListStruct item) => catList.remove(item);
  void removeAtIndexFromCatList(int index) => catList.removeAt(index);
  void insertAtIndexInCatList(int index, DtGeneralListStruct item) =>
      catList.insert(index, item);
  void updateCatListAtIndex(
          int index, Function(DtGeneralListStruct) updateFn) =>
      catList[index] = updateFn(catList[index]);

  List<DtGeneralListStruct> subCatList = [];
  void addToSubCatList(DtGeneralListStruct item) => subCatList.add(item);
  void removeFromSubCatList(DtGeneralListStruct item) =>
      subCatList.remove(item);
  void removeAtIndexFromSubCatList(int index) => subCatList.removeAt(index);
  void insertAtIndexInSubCatList(int index, DtGeneralListStruct item) =>
      subCatList.insert(index, item);
  void updateSubCatListAtIndex(
          int index, Function(DtGeneralListStruct) updateFn) =>
      subCatList[index] = updateFn(subCatList[index]);

  int? selectedCat = -1;

  List<int> selectedSubCat = [];
  void addToSelectedSubCat(int item) => selectedSubCat.add(item);
  void removeFromSelectedSubCat(int item) => selectedSubCat.remove(item);
  void removeAtIndexFromSelectedSubCat(int index) =>
      selectedSubCat.removeAt(index);
  void insertAtIndexInSelectedSubCat(int index, int item) =>
      selectedSubCat.insert(index, item);
  void updateSelectedSubCatAtIndex(int index, Function(int) updateFn) =>
      selectedSubCat[index] = updateFn(selectedSubCat[index]);

  String selectedCatDesc = 'الكل';

  String selectedSubCatDesc = 'الكل';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - copyToList] action in search_category_component widget.
  List<DtGeneralListStruct>? returnedCat;
  // Stores action output result for [Custom Action - copyToList] action in search_category_component widget.
  List<DtGeneralListStruct>? returnedSubCat;
  // Stores action output result for [Custom Action - copyToList] action in Container widget.
  List<DtGeneralListStruct>? filteredSubCat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
