// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtCusStruct extends FFFirebaseStruct {
  DtCusStruct({
    String? name,
    DocumentReference? cusDocRef,
    String? img,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _cusDocRef = cusDocRef,
        _img = img,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "cus_doc_ref" field.
  DocumentReference? _cusDocRef;
  DocumentReference? get cusDocRef => _cusDocRef;
  set cusDocRef(DocumentReference? val) => _cusDocRef = val;

  bool hasCusDocRef() => _cusDocRef != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  static DtCusStruct fromMap(Map<String, dynamic> data) => DtCusStruct(
        name: data['name'] as String?,
        cusDocRef: data['cus_doc_ref'] as DocumentReference?,
        img: data['img'] as String?,
      );

  static DtCusStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtCusStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'cus_doc_ref': _cusDocRef,
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'cus_doc_ref': serializeParam(
          _cusDocRef,
          ParamType.DocumentReference,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtCusStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtCusStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        cusDocRef: deserializeParam(
          data['cus_doc_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['cus'],
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtCusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtCusStruct &&
        name == other.name &&
        cusDocRef == other.cusDocRef &&
        img == other.img;
  }

  @override
  int get hashCode => const ListEquality().hash([name, cusDocRef, img]);
}

DtCusStruct createDtCusStruct({
  String? name,
  DocumentReference? cusDocRef,
  String? img,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtCusStruct(
      name: name,
      cusDocRef: cusDocRef,
      img: img,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtCusStruct? updateDtCusStruct(
  DtCusStruct? dtCus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtCus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtCusStructData(
  Map<String, dynamic> firestoreData,
  DtCusStruct? dtCus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtCus == null) {
    return;
  }
  if (dtCus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtCus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtCusData = getDtCusFirestoreData(dtCus, forFieldValue);
  final nestedData = dtCusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtCus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtCusFirestoreData(
  DtCusStruct? dtCus, [
  bool forFieldValue = false,
]) {
  if (dtCus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtCus.toMap());

  // Add any Firestore field values
  dtCus.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtCusListFirestoreData(
  List<DtCusStruct>? dtCuss,
) =>
    dtCuss?.map((e) => getDtCusFirestoreData(e, true)).toList() ?? [];
