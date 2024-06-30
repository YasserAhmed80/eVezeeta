// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:js';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future onProjectLoad() async {
  // copy code of ref_religion collection in firestore to app state religionRef data type
  // Assuming you have already initialized Firestore in your Flutter app

  //---------------------------------------------------------------------------------------------------------//
  Future getCollectionData(String coll_name) async {
    // Get a reference to the ref_religion collection in Firestore
    CollectionReference refCollection =
        FirebaseFirestore.instance.collection(coll_name);

    // Get the documents in the ref_religion collection
    QuerySnapshot refCollectionSnapshot = await refCollection.get();

    // Create a list to hold the religion data

    // Loop through the documents and add the data to the list

    refCollectionSnapshot.docs.forEach((doc) async {
      DtRefTableStruct item = DtRefTableStruct();

      item.code = doc.get('code');
      item.source = doc.get('source');
      item.desc = doc.get('desc');
      item.lng = doc.get('lng');
      item.countryCde = 0;

      // get country flag
      if (item.source == 'country') {
        try {
          // Get a reference to the Firebase storage bucket
          final firebase_storage.Reference storageRef =
              firebase_storage.FirebaseStorage.instance.ref().child('flags');

          // Get the download URL for the uploaded image
          String fileNmae = item.code.toString() + '.png';

          String downloadURL =
              await storageRef.child(fileNmae).getDownloadURL();

          item.imgUrl = downloadURL;

          //print('flag url' + downloadURL);
        } catch (e) {
          print('Error in get flag URL: $e');
        }
      }

      if (item.lng == FFAppState().currentLanguage) {
        FFAppState().update(() {
          FFAppState().appStateRefData.add(item);
        });
      }
    });
  }
  //---------------------------------------------------------------------------------------------------------//

  //---------------------------------------------------------------------------------------------------------//
  Future getRefCities(String coll_name) async {
    // Get a reference to the ref_religion collection in Firestore

    try {
      CollectionReference refCollection =
          FirebaseFirestore.instance.collection(coll_name);

      // Get the documents in the ref_religion collection
      QuerySnapshot refCollectionSnapshot = await refCollection.get();

      // Create a list to hold the religion data

      // Loop through the documents and add the data to the list

      refCollectionSnapshot.docs.forEach((doc) async {
        DtRefTableStruct item = DtRefTableStruct();

        item.code = doc.get('code');
        item.countryCde = doc.get('country_cde');
        item.desc = doc.get('desc');
        item.source = 'cities';
        item.lng = doc.get('lng');

        if (item.lng == FFAppState().currentLanguage) {
          FFAppState().update(() {
            FFAppState().appStateRefData.add(item);
          });
        }
      });
    } catch (e) {
      print('error in load ref citite $e');
    }
  }
  //---------------------------------------------------------------------------------------------------------//

  //---------------------------------------------------------------------------------------------------------//
  // add list of numbers to the age, weight and height
  void addListOfNumbers(
      String data_source, int value_from, int value_to) async {
    // add numbers to app state

    for (int i = value_from; i <= value_to; i++) {
      DtRefTableStruct item = DtRefTableStruct();

      item.code = i;
      item.source = data_source;
      item.desc = i.toString();
      item.lng = 0; // all languages

      FFAppState().update(() {
        FFAppState().appStateRefData.add(item);
      });
    }
  }

  print(FFAppState().appStateRefData);
  //---------------------------------------------------------------------------------------------------------//

  // calling functions
  await getCollectionData('ref_data');
  await getRefCities('ref_cities');
  addListOfNumbers('age', 18, 70);
  addListOfNumbers('height', 140, 210);
  addListOfNumbers('weight', 40, 150);

  // set dark mode
}
