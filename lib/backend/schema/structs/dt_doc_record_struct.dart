// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtDocRecordStruct extends FFFirebaseStruct {
  DtDocRecordStruct({
    String? docId,
    DocumentReference? docRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _docId = docId,
        _docRef = docRef,
        super(firestoreUtilData);

  // "doc_id" field.
  String? _docId;
  String get docId => _docId ?? '';
  set docId(String? val) => _docId = val;

  bool hasDocId() => _docId != null;

  // "doc_ref" field.
  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  set docRef(DocumentReference? val) => _docRef = val;

  bool hasDocRef() => _docRef != null;

  static DtDocRecordStruct fromMap(Map<String, dynamic> data) =>
      DtDocRecordStruct(
        docId: data['doc_id'] as String?,
        docRef: data['doc_ref'] as DocumentReference?,
      );

  static DtDocRecordStruct? maybeFromMap(dynamic data) => data is Map
      ? DtDocRecordStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'doc_id': _docId,
        'doc_ref': _docRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'doc_id': serializeParam(
          _docId,
          ParamType.String,
        ),
        'doc_ref': serializeParam(
          _docRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static DtDocRecordStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtDocRecordStruct(
        docId: deserializeParam(
          data['doc_id'],
          ParamType.String,
          false,
        ),
        docRef: deserializeParam(
          data['doc_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['doc'],
        ),
      );

  @override
  String toString() => 'DtDocRecordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtDocRecordStruct &&
        docId == other.docId &&
        docRef == other.docRef;
  }

  @override
  int get hashCode => const ListEquality().hash([docId, docRef]);
}

DtDocRecordStruct createDtDocRecordStruct({
  String? docId,
  DocumentReference? docRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtDocRecordStruct(
      docId: docId,
      docRef: docRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtDocRecordStruct? updateDtDocRecordStruct(
  DtDocRecordStruct? dtDocRecord, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtDocRecord
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtDocRecordStructData(
  Map<String, dynamic> firestoreData,
  DtDocRecordStruct? dtDocRecord,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtDocRecord == null) {
    return;
  }
  if (dtDocRecord.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtDocRecord.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtDocRecordData =
      getDtDocRecordFirestoreData(dtDocRecord, forFieldValue);
  final nestedData =
      dtDocRecordData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtDocRecord.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtDocRecordFirestoreData(
  DtDocRecordStruct? dtDocRecord, [
  bool forFieldValue = false,
]) {
  if (dtDocRecord == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtDocRecord.toMap());

  // Add any Firestore field values
  dtDocRecord.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtDocRecordListFirestoreData(
  List<DtDocRecordStruct>? dtDocRecords,
) =>
    dtDocRecords?.map((e) => getDtDocRecordFirestoreData(e, true)).toList() ??
    [];
