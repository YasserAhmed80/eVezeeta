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

import 'dart:convert';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<String?> saveImageToStorage1(
    FFUploadedFile? fileData, String folderName) async {
  if (fileData == null || fileData.bytes == null) return null;

  print('File name$fileData.name');

  // Get the image bytes from FFUploadedFile
  Uint8List bytes = fileData.bytes!;

  // Get a reference to the Firebase storage bucket
  final firebase_storage.Reference storageRef =
      firebase_storage.FirebaseStorage.instance.ref().child(folderName);

  // Generate a unique filename (you can customize this as needed)
  String fileName = '';

  //   fileData.name;
  fileName = fileData.name ?? '';

  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  fileName = timestamp;

  // '${DateTime.now().millisecondsSinceEpoch}.jpg';

  try {
    // Upload the image to Firebase Storage
    await storageRef.child(fileName).putData(bytes);

    // Get the download URL for the uploaded image
    String downloadURL = await storageRef.child(fileName).getDownloadURL();

    // save image to photo collection

    try {
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection(
              folderName); // collection name same as photo folder in storage

      DocumentReference documentReference = await collectionReference
          .add({'cus_id': '100', 'img': downloadURL, 'c': '1'});
    } catch (e) {
      print(e.toString());
    }

    // Return the download URL
    return downloadURL;
  } catch (e) {
    // Handle any errors that occur during the upload process
    print('Error uploading image: $e');
    return null;
  }
}
