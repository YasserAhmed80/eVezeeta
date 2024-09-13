// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtRefTableStruct extends FFFirebaseStruct {
  DtRefTableStruct({
    String? desc,
    int? lng,
    int? code,
    String? source,
    String? imgUrl,
    int? countryCde,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _desc = desc,
        _lng = lng,
        _code = code,
        _source = source,
        _imgUrl = imgUrl,
        _countryCde = countryCde,
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

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  set source(String? val) => _source = val;

  bool hasSource() => _source != null;

  // "img_url" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  set imgUrl(String? val) => _imgUrl = val;

  bool hasImgUrl() => _imgUrl != null;

  // "country_cde" field.
  int? _countryCde;
  int get countryCde => _countryCde ?? 0;
  set countryCde(int? val) => _countryCde = val;

  void incrementCountryCde(int amount) => countryCde = countryCde + amount;

  bool hasCountryCde() => _countryCde != null;

  static DtRefTableStruct fromMap(Map<String, dynamic> data) =>
      DtRefTableStruct(
        desc: data['desc'] as String?,
        lng: castToType<int>(data['lng']),
        code: castToType<int>(data['code']),
        source: data['source'] as String?,
        imgUrl: data['img_url'] as String?,
        countryCde: castToType<int>(data['country_cde']),
      );

  static DtRefTableStruct? maybeFromMap(dynamic data) => data is Map
      ? DtRefTableStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'desc': _desc,
        'lng': _lng,
        'code': _code,
        'source': _source,
        'img_url': _imgUrl,
        'country_cde': _countryCde,
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
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
        'img_url': serializeParam(
          _imgUrl,
          ParamType.String,
        ),
        'country_cde': serializeParam(
          _countryCde,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtRefTableStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtRefTableStruct(
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
        source: deserializeParam(
          data['source'],
          ParamType.String,
          false,
        ),
        imgUrl: deserializeParam(
          data['img_url'],
          ParamType.String,
          false,
        ),
        countryCde: deserializeParam(
          data['country_cde'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtRefTableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtRefTableStruct &&
        desc == other.desc &&
        lng == other.lng &&
        code == other.code &&
        source == other.source &&
        imgUrl == other.imgUrl &&
        countryCde == other.countryCde;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([desc, lng, code, source, imgUrl, countryCde]);
}

DtRefTableStruct createDtRefTableStruct({
  String? desc,
  int? lng,
  int? code,
  String? source,
  String? imgUrl,
  int? countryCde,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtRefTableStruct(
      desc: desc,
      lng: lng,
      code: code,
      source: source,
      imgUrl: imgUrl,
      countryCde: countryCde,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtRefTableStruct? updateDtRefTableStruct(
  DtRefTableStruct? dtRefTable, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtRefTable
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtRefTableStructData(
  Map<String, dynamic> firestoreData,
  DtRefTableStruct? dtRefTable,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtRefTable == null) {
    return;
  }
  if (dtRefTable.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtRefTable.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtRefTableData = getDtRefTableFirestoreData(dtRefTable, forFieldValue);
  final nestedData = dtRefTableData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtRefTable.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtRefTableFirestoreData(
  DtRefTableStruct? dtRefTable, [
  bool forFieldValue = false,
]) {
  if (dtRefTable == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtRefTable.toMap());

  // Add any Firestore field values
  dtRefTable.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtRefTableListFirestoreData(
  List<DtRefTableStruct>? dtRefTables,
) =>
    dtRefTables?.map((e) => getDtRefTableFirestoreData(e, true)).toList() ?? [];
