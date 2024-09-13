// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtZoneStruct extends FFFirebaseStruct {
  DtZoneStruct({
    int? zoneKey,
    int? govCde,
    String? desc,
    int? lngCde,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _zoneKey = zoneKey,
        _govCde = govCde,
        _desc = desc,
        _lngCde = lngCde,
        super(firestoreUtilData);

  // "zone_key" field.
  int? _zoneKey;
  int get zoneKey => _zoneKey ?? 0;
  set zoneKey(int? val) => _zoneKey = val;

  void incrementZoneKey(int amount) => zoneKey = zoneKey + amount;

  bool hasZoneKey() => _zoneKey != null;

  // "gov_cde" field.
  int? _govCde;
  int get govCde => _govCde ?? 0;
  set govCde(int? val) => _govCde = val;

  void incrementGovCde(int amount) => govCde = govCde + amount;

  bool hasGovCde() => _govCde != null;

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

  static DtZoneStruct fromMap(Map<String, dynamic> data) => DtZoneStruct(
        zoneKey: castToType<int>(data['zone_key']),
        govCde: castToType<int>(data['gov_cde']),
        desc: data['desc'] as String?,
        lngCde: castToType<int>(data['lng_cde']),
      );

  static DtZoneStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtZoneStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'zone_key': _zoneKey,
        'gov_cde': _govCde,
        'desc': _desc,
        'lng_cde': _lngCde,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'zone_key': serializeParam(
          _zoneKey,
          ParamType.int,
        ),
        'gov_cde': serializeParam(
          _govCde,
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

  static DtZoneStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtZoneStruct(
        zoneKey: deserializeParam(
          data['zone_key'],
          ParamType.int,
          false,
        ),
        govCde: deserializeParam(
          data['gov_cde'],
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
  String toString() => 'DtZoneStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtZoneStruct &&
        zoneKey == other.zoneKey &&
        govCde == other.govCde &&
        desc == other.desc &&
        lngCde == other.lngCde;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([zoneKey, govCde, desc, lngCde]);
}

DtZoneStruct createDtZoneStruct({
  int? zoneKey,
  int? govCde,
  String? desc,
  int? lngCde,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtZoneStruct(
      zoneKey: zoneKey,
      govCde: govCde,
      desc: desc,
      lngCde: lngCde,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtZoneStruct? updateDtZoneStruct(
  DtZoneStruct? dtZone, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtZone
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtZoneStructData(
  Map<String, dynamic> firestoreData,
  DtZoneStruct? dtZone,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtZone == null) {
    return;
  }
  if (dtZone.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtZone.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtZoneData = getDtZoneFirestoreData(dtZone, forFieldValue);
  final nestedData = dtZoneData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtZone.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtZoneFirestoreData(
  DtZoneStruct? dtZone, [
  bool forFieldValue = false,
]) {
  if (dtZone == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtZone.toMap());

  // Add any Firestore field values
  dtZone.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtZoneListFirestoreData(
  List<DtZoneStruct>? dtZones,
) =>
    dtZones?.map((e) => getDtZoneFirestoreData(e, true)).toList() ?? [];
