import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DtAreaStruct>? getFilteredArea(
  int zoneKey,
  List<DtAreaStruct>? areaList,
) {
  List<DtAreaStruct>? outputList =
      areaList?.where((item) => item.zoneCde == zoneKey).toList();

  outputList?.sort((a, b) => a.desc.compareTo(b.desc));

  //print(outputList);
  return outputList;
}

List<DtSubCategoryStruct>? getFilteredSubCategory(
  int catKey,
  List<DtSubCategoryStruct>? subCatList,
) {
  print('subcat');

  //print(subCatList);

  List<DtSubCategoryStruct>? outputList;

  if (catKey != null || catKey != -1) {
    outputList = subCatList?.where((item) => item.catCde == catKey).toList();

    outputList?.sort((a, b) => a.desc.compareTo(b.desc));
  }

  return outputList;
}

DtDocTitleStruct? getDocTitleItem(
  String? desc,
  List<DtDocTitleStruct>? typeList,
  int key,
) {
  DtDocTitleStruct? item;

  if (key > 0) {
    // get itme by key
    item = typeList?.firstWhere((i) => i.titleKey == key);
  } else {
    item = typeList?.firstWhere((i) => i.desc == desc);
  }

  if (item != null) {
    return item;
  }
  return null;
}

DtDocTypeStruct? getDocTypeItem(
  String? desc,
  List<DtDocTypeStruct>? typeList,
  int key,
) {
  DtDocTypeStruct? item;

  if (key >= 0) {
    // get itme by key
    item = typeList?.firstWhere((i) => i.typeKey == key);
  } else {
    item = typeList?.firstWhere((i) => i.desc == desc);
  }

  if (item != null) {
    return item;
  }
  return null;
}

String? stringToImagePath(String? url) {
  return url;
}

List<DtZoneStruct>? getFilteredZone(
  int govKey,
  List<DtZoneStruct>? zoneList,
) {
  List<DtZoneStruct>? outputList =
      zoneList?.where((item) => item.govCde == govKey).toList();

  outputList?.sort((a, b) => a.desc.compareTo(b.desc));

  return outputList;
}

bool? checkItemInList(
  int? itemKey,
  List<int>? itemList,
) {
  if (itemKey == null || itemList == null) {
    return false;
  }
  return itemList.contains(itemKey);
}
