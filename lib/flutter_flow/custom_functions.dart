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

DtRefTableStruct? getRefItemLable(
  String? itemType,
  int? itemCode,
  List<DtRefTableStruct> refDataAppState,
  int? countryCode,
) {
  for (DtRefTableStruct item in refDataAppState) {
    if (item.code == itemCode &&
        item.source == itemType &&
        item.countryCde == countryCode) {
      return item;
    }
  }
  return null;
}

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
