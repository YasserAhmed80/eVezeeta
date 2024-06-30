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

String? stringToImagePath(String? url) {
  return url;
}
