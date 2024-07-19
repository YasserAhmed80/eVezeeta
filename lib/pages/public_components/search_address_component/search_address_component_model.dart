import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_address_component_widget.dart' show SearchAddressComponentWidget;
import 'package:flutter/material.dart';

class SearchAddressComponentModel
    extends FlutterFlowModel<SearchAddressComponentWidget> {
  ///  Local state fields for this component.

  List<DtGeneralListStruct> zoneList = [];
  void addToZoneList(DtGeneralListStruct item) => zoneList.add(item);
  void removeFromZoneList(DtGeneralListStruct item) => zoneList.remove(item);
  void removeAtIndexFromZoneList(int index) => zoneList.removeAt(index);
  void insertAtIndexInZoneList(int index, DtGeneralListStruct item) =>
      zoneList.insert(index, item);
  void updateZoneListAtIndex(
          int index, Function(DtGeneralListStruct) updateFn) =>
      zoneList[index] = updateFn(zoneList[index]);

  List<DtGeneralListStruct> areaList = [];
  void addToAreaList(DtGeneralListStruct item) => areaList.add(item);
  void removeFromAreaList(DtGeneralListStruct item) => areaList.remove(item);
  void removeAtIndexFromAreaList(int index) => areaList.removeAt(index);
  void insertAtIndexInAreaList(int index, DtGeneralListStruct item) =>
      areaList.insert(index, item);
  void updateAreaListAtIndex(
          int index, Function(DtGeneralListStruct) updateFn) =>
      areaList[index] = updateFn(areaList[index]);

  int? selectedGov = -1;

  int? selectedZone = -1;

  int? selectedArea = -1;

  String selectedGovDesc = 'الكل';

  String selectedZoneDesc = 'الكل';

  String selectedAreaDesc = 'الكل';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - copyToList] action in search_address_component widget.
  List<DtGeneralListStruct>? returnedList;
  // Stores action output result for [Custom Action - copyToList] action in Container widget.
  List<DtGeneralListStruct>? returendZones;
  // Stores action output result for [Custom Action - copyToList] action in Container widget.
  List<DtGeneralListStruct>? returnedArea;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
