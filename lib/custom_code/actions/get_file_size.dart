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

Future<int> getFileSize(FFUploadedFile? fileData) async {
  // calculate file size FFUploadedFile
  if (fileData == null) {
    return 0;
  }

  Uint8List bytes = fileData.bytes!;

  int fileSize = bytes.lengthInBytes;
  double fileSizeInKB = fileSize / 1024;
  double fileSizeInMB = fileSizeInKB / 1024;

  return fileSizeInMB.round();
}
