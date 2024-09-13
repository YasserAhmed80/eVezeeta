// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtRefCitiesStruct extends FFFirebaseStruct {
  DtRefCitiesStruct({
    String? desc,
    int? lng,
    int? code,
    int? countryCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _desc = desc,
        _lng = lng,
        _code = code,
        _countryCode = countryCode,
        super(firestoreUtilData);

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

  // "lng" field.
  int? _lng;
  int get lng => _lng ?? 0;
  set lng(int? val) => _lng = val;

  void incrementLng(int amount) => lng = lng + amount;

  bool hasLng() => _lng != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "country_code" field.
  int? _countryCode;
  int get countryCode => _countryCode ?? 0;
  set countryCode(int? val) => _countryCode = val;

  void incrementCountryCode(int amount) => countryCode = countryCode + amount;

  bool hasCountryCode() => _countryCode != null;

  static DtRefCitiesStruct fromMap(Map<String, dynamic> data) =>
      DtRefCitiesStruct(
        desc: data['desc'] as String?,
        lng: castToType<int>(data['lng']),
        code: castToType<int>(data['code']),
        countryCode: castToType<int>(data['country_code']),
      );

  static DtRefCitiesStruct? maybeFromMap(dynamic data) => data is Map
      ? DtRefCitiesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'desc': _desc,
        'lng': _lng,
        'code': _code,
        'country_code': _countryCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.int,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'country_code': serializeParam(
          _countryCode,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtRefCitiesStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtRefCitiesStruct(
        desc: deserializeParam(
          data['desc'],
          ParamType.String,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.int,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        countryCode: deserializeParam(
          data['country_code'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtRefCitiesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtRefCitiesStruct &&
        desc == other.desc &&
        lng == other.lng &&
        code == other.code &&
        countryCode == other.countryCode;
  }

  @override
  int get hashCode => const ListEquality().hash([desc, lng, code, countryCode]);
}

DtRefCitiesStruct createDtRefCitiesStruct({
  String? desc,
  int? lng,
  int? code,
  int? countryCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtRefCitiesStruct(
      desc: desc,
      lng: lng,
      code: code,
      countryCode: countryCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtRefCitiesStruct? updateDtRefCitiesStruct(
  DtRefCitiesStruct? dtRefCities, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtRefCities
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtRefCitiesStructData(
  Map<String, dynamic> firestoreData,
  DtRefCitiesStruct? dtRefCities,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtRefCities == null) {
    return;
  }
  if (dtRefCities.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtRefCities.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtRefCitiesData =
      getDtRefCitiesFirestoreData(dtRefCities, forFieldValue);
  final nestedData =
      dtRefCitiesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtRefCities.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtRefCitiesFirestoreData(
  DtRefCitiesStruct? dtRefCities, [
  bool forFieldValue = false,
]) {
  if (dtRefCities == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtRefCities.toMap());

  // Add any Firestore field values
  dtRefCities.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtRefCitiesListFirestoreData(
  List<DtRefCitiesStruct>? dtRefCitiess,
) =>
    dtRefCitiess?.map((e) => getDtRefCitiesFirestoreData(e, true)).toList() ??
    [];
