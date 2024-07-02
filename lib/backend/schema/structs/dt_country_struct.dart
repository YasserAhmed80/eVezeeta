// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtCountryStruct extends FFFirebaseStruct {
  DtCountryStruct({
    int? cKey,
    String? desc,
    int? lngCde,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cKey = cKey,
        _desc = desc,
        _lngCde = lngCde,
        super(firestoreUtilData);

  // "c_key" field.
  int? _cKey;
  int get cKey => _cKey ?? 0;
  set cKey(int? val) => _cKey = val;

  void incrementCKey(int amount) => cKey = cKey + amount;

  bool hasCKey() => _cKey != null;

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

  static DtCountryStruct fromMap(Map<String, dynamic> data) => DtCountryStruct(
        cKey: castToType<int>(data['c_key']),
        desc: data['desc'] as String?,
        lngCde: castToType<int>(data['lng_cde']),
      );

  static DtCountryStruct? maybeFromMap(dynamic data) => data is Map
      ? DtCountryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'c_key': _cKey,
        'desc': _desc,
        'lng_cde': _lngCde,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'c_key': serializeParam(
          _cKey,
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

  static DtCountryStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtCountryStruct(
        cKey: deserializeParam(
          data['c_key'],
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
  String toString() => 'DtCountryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtCountryStruct &&
        cKey == other.cKey &&
        desc == other.desc &&
        lngCde == other.lngCde;
  }

  @override
  int get hashCode => const ListEquality().hash([cKey, desc, lngCde]);
}

DtCountryStruct createDtCountryStruct({
  int? cKey,
  String? desc,
  int? lngCde,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtCountryStruct(
      cKey: cKey,
      desc: desc,
      lngCde: lngCde,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtCountryStruct? updateDtCountryStruct(
  DtCountryStruct? dtCountry, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtCountry
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtCountryStructData(
  Map<String, dynamic> firestoreData,
  DtCountryStruct? dtCountry,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtCountry == null) {
    return;
  }
  if (dtCountry.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtCountry.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtCountryData = getDtCountryFirestoreData(dtCountry, forFieldValue);
  final nestedData = dtCountryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtCountry.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtCountryFirestoreData(
  DtCountryStruct? dtCountry, [
  bool forFieldValue = false,
]) {
  if (dtCountry == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtCountry.toMap());

  // Add any Firestore field values
  dtCountry.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtCountryListFirestoreData(
  List<DtCountryStruct>? dtCountrys,
) =>
    dtCountrys?.map((e) => getDtCountryFirestoreData(e, true)).toList() ?? [];
