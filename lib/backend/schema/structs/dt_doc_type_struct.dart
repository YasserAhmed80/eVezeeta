// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtDocTypeStruct extends FFFirebaseStruct {
  DtDocTypeStruct({
    int? typeKey,
    String? desc,
    int? lngCde,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _typeKey = typeKey,
        _desc = desc,
        _lngCde = lngCde,
        super(firestoreUtilData);

  // "type_key" field.
  int? _typeKey;
  int get typeKey => _typeKey ?? 0;
  set typeKey(int? val) => _typeKey = val;

  void incrementTypeKey(int amount) => typeKey = typeKey + amount;

  bool hasTypeKey() => _typeKey != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  set lngCde(int? val) => _lngCde = val;

  void incrementLngCde(int amount) => lngCde = lngCde + amount;

  bool hasLngCde() => _lngCde != null;

  static DtDocTypeStruct fromMap(Map<String, dynamic> data) => DtDocTypeStruct(
        typeKey: castToType<int>(data['type_key']),
        desc: data['desc'] as String?,
        lngCde: castToType<int>(data['lng_cde']),
      );

  static DtDocTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? DtDocTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type_key': _typeKey,
        'desc': _desc,
        'lng_cde': _lngCde,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type_key': serializeParam(
          _typeKey,
          ParamType.int,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
        'lng_cde': serializeParam(
          _lngCde,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtDocTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtDocTypeStruct(
        typeKey: deserializeParam(
          data['type_key'],
          ParamType.int,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
          ParamType.String,
          false,
        ),
        lngCde: deserializeParam(
          data['lng_cde'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtDocTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtDocTypeStruct &&
        typeKey == other.typeKey &&
        desc == other.desc &&
        lngCde == other.lngCde;
  }

  @override
  int get hashCode => const ListEquality().hash([typeKey, desc, lngCde]);
}

DtDocTypeStruct createDtDocTypeStruct({
  int? typeKey,
  String? desc,
  int? lngCde,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtDocTypeStruct(
      typeKey: typeKey,
      desc: desc,
      lngCde: lngCde,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtDocTypeStruct? updateDtDocTypeStruct(
  DtDocTypeStruct? dtDocType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtDocType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtDocTypeStructData(
  Map<String, dynamic> firestoreData,
  DtDocTypeStruct? dtDocType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtDocType == null) {
    return;
  }
  if (dtDocType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtDocType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtDocTypeData = getDtDocTypeFirestoreData(dtDocType, forFieldValue);
  final nestedData = dtDocTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtDocType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtDocTypeFirestoreData(
  DtDocTypeStruct? dtDocType, [
  bool forFieldValue = false,
]) {
  if (dtDocType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtDocType.toMap());

  // Add any Firestore field values
  dtDocType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtDocTypeListFirestoreData(
  List<DtDocTypeStruct>? dtDocTypes,
) =>
    dtDocTypes?.map((e) => getDtDocTypeFirestoreData(e, true)).toList() ?? [];
