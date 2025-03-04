// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<DtGeneralListStruct>> copyToList(
  String? dataSource,
  int? filterValue,
) async {
  // Add your function code here!

  List<DtGeneralListStruct>? returnList = [];

  // add ALL item

  DtGeneralListStruct newItem = DtGeneralListStruct();
  newItem.key = -1;
  newItem.desc = 'الكل';
  returnList.add(newItem);

  if (dataSource == 'gov') {
    List<DtGovernateStruct> aList = FFAppState().refGovernate;

    //aList?.sort((a, b) => a.seq < b.seq);
    aList?.sort((a, b) => a.desc.compareTo(b.desc));

    for (DtGovernateStruct item in aList) {
      DtGeneralListStruct newItem = DtGeneralListStruct();
      newItem.key = item.govKey;
      newItem.desc = item.desc;

      returnList.add(newItem);
    }
  }

  // zone data
  if (dataSource == 'zone') {
    List<DtZoneStruct> aList = FFAppState().refZone;
    aList?.sort((a, b) => a.desc.compareTo(b.desc));

    for (DtZoneStruct item in aList) {
      if (item.govCde == filterValue) {
        DtGeneralListStruct newItem = DtGeneralListStruct();
        newItem.key = item.zoneKey;
        newItem.desc = item.desc;

        returnList.add(newItem);
      }
    }
  }

  // area data
  if (dataSource == 'area') {
    List<DtAreaStruct> aList = FFAppState().refArea;
    aList?.sort((a, b) => a.desc.compareTo(b.desc));

    for (DtAreaStruct item in aList) {
      if (item.zoneCde == filterValue) {
        DtGeneralListStruct newItem = DtGeneralListStruct();
        newItem.key = item.areaKey;
        newItem.desc = item.desc;

        returnList.add(newItem);
      }
    }
  }

  // doc category data ------------------------------------------------------
  if (dataSource == 'cat') {
    List<DtCategoryStruct> aList = FFAppState().refCategory;
    aList?.sort((a, b) => a.desc.compareTo(b.desc));

    // remove all item
    returnList.clear();

    for (DtCategoryStruct item in aList) {
      DtGeneralListStruct newItem = DtGeneralListStruct();
      newItem.key = item.catKey;
      newItem.desc = item.desc;

      returnList.add(newItem);
    }
  }

  // doc sub cat data -------------------------------------------------------------
  if (dataSource == 'subCat') {
    List<DtSubCategoryStruct> aList = FFAppState().refSubCategory;
    aList?.sort((a, b) => a.desc.compareTo(b.desc));

    for (DtSubCategoryStruct item in aList) {
      if (item.catCde == filterValue) {
        DtGeneralListStruct newItem = DtGeneralListStruct();
        newItem.key = item.subKey;
        newItem.desc = item.desc;

        returnList.add(newItem);
      }
    }
  }

  // doc type data -------------------------------------------------------------
  if (dataSource == 'type') {
    List<DtDocTypeStruct> aList = FFAppState().refDocType;
    aList?.sort((a, b) => a.desc.compareTo(b.desc));

    for (DtDocTypeStruct item in aList) {
      DtGeneralListStruct newItem = DtGeneralListStruct();
      newItem.key = item.typeKey;
      newItem.desc = item.desc;

      returnList.add(newItem);
    }
  }

  // doc type data -------------------------------------------------------------
  if (dataSource == 'title') {
    List<DtDocTitleStruct> aList = FFAppState().refDocTitle;
    aList?.sort((a, b) => a.desc.compareTo(b.desc));

    for (DtDocTitleStruct item in aList) {
      DtGeneralListStruct newItem = DtGeneralListStruct();
      newItem.key = item.titleKey;
      newItem.desc = item.desc;

      returnList.add(newItem);
    }
  }

  return returnList;
}
