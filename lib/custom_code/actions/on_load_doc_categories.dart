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

Future onLoadDocCategories() async {
  // copy code of ref_religion collection in firestore to app state religionRef data type
  // Assuming you have already initialized Firestore in your Flutter app

  print('stat onLoadDocCategories');

  Future getCategory() async {
    // Get governate data

    try {
      CollectionReference refCollection =
          FirebaseFirestore.instance.collection('category');

      // Get the documents in the ref_religion collection
      QuerySnapshot refCollectionSnapshot = await refCollection.get();

      refCollectionSnapshot.docs.forEach((doc) async {
        DtCategoryStruct item = DtCategoryStruct();

        item.catKey = doc.get('cat_key');
        item.seq = doc.get('seq');
        item.desc = doc.get('desc');
        item.lngCde = doc.get('lng_cde');

        if (item.lngCde == FFAppState().currentLanguage) {
          FFAppState().update(() {
            FFAppState().refCategory.add(item);
          });
        }
      });
    } catch (e) {
      print('error in getCategory $e');
    }
  }

  //---------------------------------------------------------------------------------------------------------//
  Future getSubCategory() async {
    // Get governate data

    try {
      CollectionReference refCollection =
          FirebaseFirestore.instance.collection('category_sub');

      // Get the documents in the ref_religion collection
      QuerySnapshot refCollectionSnapshot = await refCollection.get();

      refCollectionSnapshot.docs.forEach((doc) async {
        DtSubCategoryStruct item = DtSubCategoryStruct();

        item.subKey = doc.get('sub_key');
        item.catCde = doc.get('cat_cde');
        item.seq = doc.get('seq');
        item.desc = doc.get('desc');
        item.lngCde = doc.get('lng_cde');

        if (item.lngCde == FFAppState().currentLanguage) {
          FFAppState().update(() {
            FFAppState().refSubCategory.add(item);
          });
        }
      });
    } catch (e) {
      print('error in getSubCategory $e');
    }
  }
  //---------------------------------------------------------------------------------------------------------//

  //---------------------------------------------------------------------------------------------------------//

  try {
    if (FFAppState().refCategory.length == 0) {
      await getCategory();
      //FFAppState().refCategory?.sort((a, b) => a.seq > b.seq);
    }

    if (FFAppState().refSubCategory.length == 0) {
      await getSubCategory();
    }

    //print(FFAppState().appStateRefData);
  } catch (e) {
    print('error in onLoadDocCategories $e');
  }
}
