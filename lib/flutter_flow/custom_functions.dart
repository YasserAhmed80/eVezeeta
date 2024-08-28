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
import '/backend/schema/enums/enums.dart';
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
  DtDocTitleStruct? item = DtDocTitleStruct();

  if (key > 0) {
    // get itme by key
    item = typeList?.firstWhere((i) => i.titleKey == key);
  } else {
    item = typeList?.firstWhere((i) => i.desc == desc);
  }

  if (item != null) {
    return item;
  } else {
    item?.desc = 'none';
    item?.titleKey = -1;
  }
  return item;
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
    //return item;
  } else {
    item = DtDocTypeStruct();
    item.typeKey = -1;
    item.desc = 'none';
  }
  return item;
}

DateTime? concatDateTime(
  DateTime? pDate,
  String? pHr,
  int? pMinute,
  String? period,
) {
  // write a function with parameter datetime and return date only
  if (pDate == null) {
    return null;
  }

  int? nHr;

  nHr = int.parse(pHr!);

  if (period == 'م' && nHr! != 12) {
    nHr = nHr + 12;
  }

  if (period == 'ص' && nHr == 12) {
    nHr = 0;
  }

  return DateTime(pDate.year, pDate.month, pDate.day, nHr!, pMinute!);
}

DateTime? getCurrentDate() {
  // write a function with parameter datetime and return date only
  DateTime pDate = DateTime.now();

  return DateTime(pDate.year, pDate.month, pDate.day);
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

bool? checkSearchItemActive(
  String? itemType,
  DtSearchParametersStruct? searchParam,
) {
  if (itemType == 'type') {
    if (searchParam?.docTypeCde.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  if (itemType == 'title') {
    if (searchParam?.docTitleCde.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  if (itemType == 'price') {
    if (searchParam?.filterPriceCheck == true) {
      return true;
    } else {
      return false;
    }
  }

  return false;
}

String? getDayNameFromDate(DateTime? dDay) {
  return DateFormat('EEEE').format(dDay as DateTime);
}

String? getFullAddress(
  int? govKey,
  int? zoneKey,
  int? areaKey,
  List<DtGovernateStruct> govList,
  List<DtZoneStruct> zoneList,
  List<DtAreaStruct> areaList,
) {
  String sGov = '';
  String sZone = '';
  String sArea = '';

  try {
    //return '{$govKey}, {$zoneKey}, {$areaKey}';

    for (DtGovernateStruct item in govList) {
      if (item.govKey == govKey) {
        sGov = item.desc;
      }
    }

    for (DtZoneStruct item in zoneList) {
      if (item.zoneKey == zoneKey) {
        sZone = item.desc;
      }
    }

    for (DtAreaStruct item in areaList) {
      if (item.areaKey == areaKey) {
        sArea = item.desc;
      }
    }

    if (sGov == '') {
      return 'لايوجد';
    }

    String sAddress = sGov + ' > ' + sZone;

    if (sArea != '' && sArea != sZone) {
      sAddress = sAddress + ' > ' + sArea;
    }

    return sAddress;
  } catch (e) {
    return 'error getFullAddress: $e';
  }
}

DtDayStruct? getDayCode(
  DateTime dayValue,
  List<DtDayStruct> dayRef,
) {
  String dayDesc = DateFormat('EEEE').format(dayValue as DateTime);
  for (DtDayStruct item in dayRef) {
    if (item.descEng == dayDesc) {
      return item;
    }
  }

  return null;
}

DateTime? dateAdd(DateTime? dDate) {
  return dDate?.add(Duration(days: 1));
}

DateTime? dateOnly(DateTime? pDate) {
  // write a function with parameter datetime and return date only
  if (pDate == null) {
    return null;
  }
  return DateTime(pDate.year, pDate.month, pDate.day);
}

int? calcMinutesOfHour(
  int? nCount,
  int? nAvg,
) {
  double? x = nCount! / nAvg! * 60;

  return x.toInt();
}

DateTime? getDateBack(String? sPeriod) {
  DateTime pDate = DateTime.now();

  if (sPeriod == 'ld') {
    // last day
    pDate = pDate.subtract(Duration(days: 1));
  }

  if (sPeriod == 'w') {
    pDate = pDate.subtract(Duration(days: 7));
  }
  if (sPeriod == 'm') {
    pDate = DateTime(pDate.year, pDate.month, 1);
  }

  if (sPeriod == 'y') {
    pDate = DateTime(pDate.year, 1, 1);
  }

  return pDate;
}

DateTime? addMonths(
  DateTime? pDate,
  int? nMonths,
) {
  var newDate = DateTime(pDate!.year, pDate!.month + nMonths!, pDate!.day);

  return newDate;
}

int? dateDifference(
  DateTime? fDate,
  DateTime? toDate,
) {
  // get difference between two date in days
  if (fDate == null || toDate == null) {
    return null;
  }
  final difference = toDate.difference(fDate);
  int x = difference.inDays;

  if (x < 0) {
    return 0;
  }

  return x;
}

int? getMonthDayCount(
  int? pYear,
  int? pMonth,
) {
  // calculate last day of the month
  if (pYear == null || pMonth == null) {
    return null;
  }
  final year = (pYear);
  final month = (pMonth);
  if (month < 1 || month > 12) {
    return null;
  }
  final date = DateTime(year, month + 1, 0);
  return date.day;
}

int? stringToInteger(String? pValue) {
  final v = int.parse(pValue!);

  return v;
}

DateTime? createDate(
  int? pYear,
  int? pMonth,
  int? pDay,
) {
  final date = DateTime(pYear!, pMonth!, pDay!);
  return date;
}

int? getDatePart(
  DateTime? pDate,
  String? pPart,
) {
  if (pPart == 'd') {
    return pDate!.day;
  }
  if (pPart == 'm') {
    return pDate!.month;
  }
  if (pPart == 'y') {
    return pDate!.year;
  }
}

String? toString(int? pValue) {
  return pValue!.toString();
}

int? calcAge(DateTime? pDOB) {
  // calculate age from date
  if (pDOB == null) {
    return null;
  }
  final now = DateTime.now();
  int age = now.year - pDOB.year;
  if (now.month < pDOB.month ||
      (now.month == pDOB.month && now.day < pDOB.day)) {
    age--;
  }
  return age;
}
