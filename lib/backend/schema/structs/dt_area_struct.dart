// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtAreaStruct extends FFFirebaseStruct {
  DtAreaStruct({
    int? areaKey,
    int? zoneCde,
    String? desc,
    int? lngCde,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _areaKey = areaKey,
        _zoneCde = zoneCde,
        _desc = desc,
        _lngCde = lngCde,
        super(firestoreUtilData);

  // "area_key" field.
  int? _areaKey;
  int get areaKey => _areaKey ?? 0;
  set areaKey(int? val) => _areaKey = val;

  void incrementAreaKey(int amount) => areaKey = areaKey + amount;

  bool hasAreaKey() => _areaKey != null;

  // "zone_cde" field.
  int? _zoneCde;
  int get zoneCde => _zoneCde ?? 0;
  set zoneCde(int? val) => _zoneCde = val;

  void incrementZoneCde(int amount) => zoneCde = zoneCde + amount;

  bool hasZoneCde() => _zoneCde != null;

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

  static DtAreaStruct fromMap(Map<String, dynamic> data) => DtAreaStruct(
        areaKey: castToType<int>(data['area_key']),
        zoneCde: castToType<int>(data['zone_cde']),
        desc: data['desc'] as String?,
        lngCde: castToType<int>(data['lng_cde']),
      );

  static DtAreaStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtAreaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'area_key': _areaKey,
        'zone_cde': _zoneCde,
        'desc': _desc,
        'lng_cde': _lngCde,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'area_key': serializeParam(
          _areaKey,
          ParamType.int,
        ),
        'zone_cde': serializeParam(
          _zoneCde,
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

  static DtAreaStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtAreaStruct(
        areaKey: deserializeParam(
          data['area_key'],
          ParamType.int,
          false,
        ),
        zoneCde: deserializeParam(
          data['zone_cde'],
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
  String toString() => 'DtAreaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtAreaStruct &&
        areaKey == other.areaKey &&
        zoneCde == other.zoneCde &&
        desc == other.desc &&
        lngCde == other.lngCde;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([areaKey, zoneCde, desc, lngCde]);
}

DtAreaStruct createDtAreaStruct({
  int? areaKey,
  int? zoneCde,
  String? desc,
  int? lngCde,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtAreaStruct(
      areaKey: areaKey,
      zoneCde: zoneCde,
      desc: desc,
      lngCde: lngCde,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtAreaStruct? updateDtAreaStruct(
  DtAreaStruct? dtArea, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtArea
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtAreaStructData(
  Map<String, dynamic> firestoreData,
  DtAreaStruct? dtArea,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtArea == null) {
    return;
  }
  if (dtArea.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtArea.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtAreaData = getDtAreaFirestoreData(dtArea, forFieldValue);
  final nestedData = dtAreaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtArea.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtAreaFirestoreData(
  DtAreaStruct? dtArea, [
  bool forFieldValue = false,
]) {
  if (dtArea == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtArea.toMap());

  // Add any Firestore field values
  dtArea.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtAreaListFirestoreData(
  List<DtAreaStruct>? dtAreas,
) =>
    dtAreas?.map((e) => getDtAreaFirestoreData(e, true)).toList() ?? [];
