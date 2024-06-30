// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtGovernateStruct extends FFFirebaseStruct {
  DtGovernateStruct({
    int? govKey,
    String? desc,
    int? cntryCde,
    int? lngCde,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _govKey = govKey,
        _desc = desc,
        _cntryCde = cntryCde,
        _lngCde = lngCde,
        super(firestoreUtilData);

  // "gov_key" field.
  int? _govKey;
  int get govKey => _govKey ?? 0;
  set govKey(int? val) => _govKey = val;

  void incrementGovKey(int amount) => govKey = govKey + amount;

  bool hasGovKey() => _govKey != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

  // "cntry_cde" field.
  int? _cntryCde;
  int get cntryCde => _cntryCde ?? 0;
  set cntryCde(int? val) => _cntryCde = val;

  void incrementCntryCde(int amount) => cntryCde = cntryCde + amount;

  bool hasCntryCde() => _cntryCde != null;

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  set lngCde(int? val) => _lngCde = val;

  void incrementLngCde(int amount) => lngCde = lngCde + amount;

  bool hasLngCde() => _lngCde != null;

  static DtGovernateStruct fromMap(Map<String, dynamic> data) =>
      DtGovernateStruct(
        govKey: castToType<int>(data['gov_key']),
        desc: data['desc'] as String?,
        cntryCde: castToType<int>(data['cntry_cde']),
        lngCde: castToType<int>(data['lng_cde']),
      );

  static DtGovernateStruct? maybeFromMap(dynamic data) => data is Map
      ? DtGovernateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'gov_key': _govKey,
        'desc': _desc,
        'cntry_cde': _cntryCde,
        'lng_cde': _lngCde,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gov_key': serializeParam(
          _govKey,
          ParamType.int,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
        'cntry_cde': serializeParam(
          _cntryCde,
          ParamType.int,
        ),
        'lng_cde': serializeParam(
          _lngCde,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtGovernateStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtGovernateStruct(
        govKey: deserializeParam(
          data['gov_key'],
          ParamType.int,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
          ParamType.String,
          false,
        ),
        cntryCde: deserializeParam(
          data['cntry_cde'],
          ParamType.int,
          false,
        ),
        lngCde: deserializeParam(
          data['lng_cde'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtGovernateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtGovernateStruct &&
        govKey == other.govKey &&
        desc == other.desc &&
        cntryCde == other.cntryCde &&
        lngCde == other.lngCde;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([govKey, desc, cntryCde, lngCde]);
}

DtGovernateStruct createDtGovernateStruct({
  int? govKey,
  String? desc,
  int? cntryCde,
  int? lngCde,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtGovernateStruct(
      govKey: govKey,
      desc: desc,
      cntryCde: cntryCde,
      lngCde: lngCde,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtGovernateStruct? updateDtGovernateStruct(
  DtGovernateStruct? dtGovernate, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtGovernate
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtGovernateStructData(
  Map<String, dynamic> firestoreData,
  DtGovernateStruct? dtGovernate,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtGovernate == null) {
    return;
  }
  if (dtGovernate.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtGovernate.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtGovernateData =
      getDtGovernateFirestoreData(dtGovernate, forFieldValue);
  final nestedData =
      dtGovernateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtGovernate.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtGovernateFirestoreData(
  DtGovernateStruct? dtGovernate, [
  bool forFieldValue = false,
]) {
  if (dtGovernate == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtGovernate.toMap());

  // Add any Firestore field values
  dtGovernate.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtGovernateListFirestoreData(
  List<DtGovernateStruct>? dtGovernates,
) =>
    dtGovernates?.map((e) => getDtGovernateFirestoreData(e, true)).toList() ??
    [];
