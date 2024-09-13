// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtDoctorStruct extends FFFirebaseStruct {
  DtDoctorStruct({
    DocumentReference? dbDocRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dbDocRef = dbDocRef,
        super(firestoreUtilData);

  // "db_doc_ref" field.
  DocumentReference? _dbDocRef;
  DocumentReference? get dbDocRef => _dbDocRef;
  set dbDocRef(DocumentReference? val) => _dbDocRef = val;

  bool hasDbDocRef() => _dbDocRef != null;

  static DtDoctorStruct fromMap(Map<String, dynamic> data) => DtDoctorStruct(
        dbDocRef: data['db_doc_ref'] as DocumentReference?,
      );

  static DtDoctorStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtDoctorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'db_doc_ref': _dbDocRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'db_doc_ref': serializeParam(
          _dbDocRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static DtDoctorStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtDoctorStruct(
        dbDocRef: deserializeParam(
          data['db_doc_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['doc'],
        ),
      );

  @override
  String toString() => 'DtDoctorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtDoctorStruct && dbDocRef == other.dbDocRef;
  }

  @override
  int get hashCode => const ListEquality().hash([dbDocRef]);
}

DtDoctorStruct createDtDoctorStruct({
  DocumentReference? dbDocRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtDoctorStruct(
      dbDocRef: dbDocRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtDoctorStruct? updateDtDoctorStruct(
  DtDoctorStruct? dtDoctor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtDoctor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtDoctorStructData(
  Map<String, dynamic> firestoreData,
  DtDoctorStruct? dtDoctor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtDoctor == null) {
    return;
  }
  if (dtDoctor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtDoctor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtDoctorData = getDtDoctorFirestoreData(dtDoctor, forFieldValue);
  final nestedData = dtDoctorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtDoctor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtDoctorFirestoreData(
  DtDoctorStruct? dtDoctor, [
  bool forFieldValue = false,
]) {
  if (dtDoctor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtDoctor.toMap());

  // Add any Firestore field values
  dtDoctor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtDoctorListFirestoreData(
  List<DtDoctorStruct>? dtDoctors,
) =>
    dtDoctors?.map((e) => getDtDoctorFirestoreData(e, true)).toList() ?? [];
