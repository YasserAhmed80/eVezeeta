// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtCustomerFileStruct extends FFFirebaseStruct {
  DtCustomerFileStruct({
    DocumentReference? fileRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fileRef = fileRef,
        super(firestoreUtilData);

  // "file_ref" field.
  DocumentReference? _fileRef;
  DocumentReference? get fileRef => _fileRef;
  set fileRef(DocumentReference? val) => _fileRef = val;

  bool hasFileRef() => _fileRef != null;

  static DtCustomerFileStruct fromMap(Map<String, dynamic> data) =>
      DtCustomerFileStruct(
        fileRef: data['file_ref'] as DocumentReference?,
      );

  static DtCustomerFileStruct? maybeFromMap(dynamic data) => data is Map
      ? DtCustomerFileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'file_ref': _fileRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'file_ref': serializeParam(
          _fileRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static DtCustomerFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtCustomerFileStruct(
        fileRef: deserializeParam(
          data['file_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['cus_files'],
        ),
      );

  @override
  String toString() => 'DtCustomerFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtCustomerFileStruct && fileRef == other.fileRef;
  }

  @override
  int get hashCode => const ListEquality().hash([fileRef]);
}

DtCustomerFileStruct createDtCustomerFileStruct({
  DocumentReference? fileRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtCustomerFileStruct(
      fileRef: fileRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtCustomerFileStruct? updateDtCustomerFileStruct(
  DtCustomerFileStruct? dtCustomerFile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtCustomerFile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtCustomerFileStructData(
  Map<String, dynamic> firestoreData,
  DtCustomerFileStruct? dtCustomerFile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtCustomerFile == null) {
    return;
  }
  if (dtCustomerFile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtCustomerFile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtCustomerFileData =
      getDtCustomerFileFirestoreData(dtCustomerFile, forFieldValue);
  final nestedData =
      dtCustomerFileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtCustomerFile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtCustomerFileFirestoreData(
  DtCustomerFileStruct? dtCustomerFile, [
  bool forFieldValue = false,
]) {
  if (dtCustomerFile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtCustomerFile.toMap());

  // Add any Firestore field values
  dtCustomerFile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtCustomerFileListFirestoreData(
  List<DtCustomerFileStruct>? dtCustomerFiles,
) =>
    dtCustomerFiles
        ?.map((e) => getDtCustomerFileFirestoreData(e, true))
        .toList() ??
    [];
