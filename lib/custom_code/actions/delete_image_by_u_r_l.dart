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

import 'package:firebase_storage/firebase_storage.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future deleteImageByURL(String url) async {
  // delete image from fire storage using url
// Function to delete image from Firebase storage using URL
  final FirebaseStorage storage = FirebaseStorage.instance;
  Reference reference = storage.refFromURL(url);
  try {
    await reference.delete();
    print("Image deleted successfully");
  } catch (e) {
    print("Error deleting image: $e");
  }
}
