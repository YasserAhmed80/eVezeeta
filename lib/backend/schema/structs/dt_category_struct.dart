// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtCategoryStruct extends FFFirebaseStruct {
  DtCategoryStruct({
    int? catKey,
    String? desc,
    int? lngCde,
    int? seq,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _catKey = catKey,
        _desc = desc,
        _lngCde = lngCde,
        _seq = seq,
        super(firestoreUtilData);

  // "cat_key" field.
  int? _catKey;
  int get catKey => _catKey ?? 0;
  set catKey(int? val) => _catKey = val;

  void incrementCatKey(int amount) => catKey = catKey + amount;

  bool hasCatKey() => _catKey != null;

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

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  set seq(int? val) => _seq = val;

  void incrementSeq(int amount) => seq = seq + amount;

  bool hasSeq() => _seq != null;

  static DtCategoryStruct fromMap(Map<String, dynamic> data) =>
      DtCategoryStruct(
        catKey: castToType<int>(data['cat_key']),
        desc: data['desc'] as String?,
        lngCde: castToType<int>(data['lng_cde']),
        seq: castToType<int>(data['seq']),
      );

  static DtCategoryStruct? maybeFromMap(dynamic data) => data is Map
      ? DtCategoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cat_key': _catKey,
        'desc': _desc,
        'lng_cde': _lngCde,
        'seq': _seq,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cat_key': serializeParam(
          _catKey,
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
        'seq': serializeParam(
          _seq,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtCategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtCategoryStruct(
        catKey: deserializeParam(
          data['cat_key'],
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
        seq: deserializeParam(
          data['seq'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtCategoryStruct &&
        catKey == other.catKey &&
        desc == other.desc &&
        lngCde == other.lngCde &&
        seq == other.seq;
  }

  @override
  int get hashCode => const ListEquality().hash([catKey, desc, lngCde, seq]);
}

DtCategoryStruct createDtCategoryStruct({
  int? catKey,
  String? desc,
  int? lngCde,
  int? seq,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtCategoryStruct(
      catKey: catKey,
      desc: desc,
      lngCde: lngCde,
      seq: seq,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtCategoryStruct? updateDtCategoryStruct(
  DtCategoryStruct? dtCategory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtCategory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtCategoryStructData(
  Map<String, dynamic> firestoreData,
  DtCategoryStruct? dtCategory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtCategory == null) {
    return;
  }
  if (dtCategory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtCategory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtCategoryData = getDtCategoryFirestoreData(dtCategory, forFieldValue);
  final nestedData = dtCategoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtCategory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtCategoryFirestoreData(
  DtCategoryStruct? dtCategory, [
  bool forFieldValue = false,
]) {
  if (dtCategory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtCategory.toMap());

  // Add any Firestore field values
  dtCategory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtCategoryListFirestoreData(
  List<DtCategoryStruct>? dtCategorys,
) =>
    dtCategorys?.map((e) => getDtCategoryFirestoreData(e, true)).toList() ?? [];
