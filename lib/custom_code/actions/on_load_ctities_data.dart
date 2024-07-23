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

import 'dart:js';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future onLoadCtitiesData() async {
  // copy code of ref_religion collection in firestore to app state religionRef data type
  // Assuming you have already initialized Firestore in your Flutter app

  print('stat onLoadCtitiesData');

  Future getGovernate() async {
    // Get governate data

    try {
      CollectionReference refCollection =
          FirebaseFirestore.instance.collection('governate');

      // Get the documents in the ref_religion collection
      QuerySnapshot refCollectionSnapshot = await refCollection.get();

      refCollectionSnapshot.docs.forEach((doc) async {
        DtGovernateStruct item = DtGovernateStruct();

        item.govKey = doc.get('gov_key');
        item.cntryCde = doc.get('cntry_cde');
        item.desc = doc.get('desc');
        item.lngCde = doc.get('lng_cde');

        if (item.lngCde == FFAppState().currentLanguage) {
          FFAppState().update(() {
            FFAppState().refGovernate.add(item);
          });
        }
      });
    } catch (e) {
      print('error in getGovernate $e');
    }
  }

  //---------------------------------------------------------------------------------------------------------//
  Future getZone() async {
    // Get governate data

    try {
      CollectionReference refCollection =
          FirebaseFirestore.instance.collection('govern_zone');

      // Get the documents in the ref_religion collection
      QuerySnapshot refCollectionSnapshot = await refCollection.get();

      refCollectionSnapshot.docs.forEach((doc) async {
        DtZoneStruct item = DtZoneStruct();

        item.zoneKey = doc.get('zone_key');
        item.govCde = doc.get('govern_cde');
        item.desc = doc.get('desc');
        item.lngCde = doc.get('lng_cde');

        if (item.lngCde == FFAppState().currentLanguage) {
          FFAppState().update(() {
            FFAppState().refZone.add(item);
          });
        }
      });
    } catch (e) {
      print('error in getZone $e');
    }
  }
  //---------------------------------------------------------------------------------------------------------//

  //---------------------------------------------------------------------------------------------------------//
  Future getArea() async {
    // Get governate data

    try {
      CollectionReference refCollection =
          FirebaseFirestore.instance.collection('zone_area');

      // Get the documents in the ref_religion collection
      QuerySnapshot refCollectionSnapshot = await refCollection.get();

      refCollectionSnapshot.docs.forEach((doc) async {
        DtAreaStruct item = DtAreaStruct();

        item.areaKey = doc.get('area_key');
        item.zoneCde = doc.get('zone_cde');
        item.desc = doc.get('desc');
        item.lngCde = doc.get('lng_cde');

        if (item.lngCde == FFAppState().currentLanguage) {
          FFAppState().update(() {
            FFAppState().refArea.add(item);
          });
        }
      });
    } catch (e) {
      print('error in getArea $e');
    }
  }
  //---------------------------------------------------------------------------------------------------------//

  //---------------------------------------------------------------------------------------------------------//

  try {
    if (FFAppState().refGovernate.length == 0) {
      await getGovernate();
    }

    if (FFAppState().refZone.length == 0) {
      await getZone();
    }

    if (FFAppState().refArea.length == 0) {
      await getArea();
    }

    //print(FFAppState().appStateRefData);
  } catch (e) {
    print('error in called functions $e');
  }
}
