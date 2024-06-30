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

import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<String?> getImageURL(String folderName, String fileName) async {
  try {
    // Get a reference to the Firebase storage bucket
    final firebase_storage.Reference storageRef =
        firebase_storage.FirebaseStorage.instance.ref().child(folderName);

    // Get the download URL for the uploaded image
    String downloadURL = await storageRef.child(fileName).getDownloadURL();

    // Return the download URL
    return downloadURL;
  } catch (e) {
    // Handle any errors that occur during the upload process
    print('Error in get image URL: $e');
    return null;
  }
}
