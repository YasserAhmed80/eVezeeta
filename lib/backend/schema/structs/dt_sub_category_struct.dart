// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtSubCategoryStruct extends FFFirebaseStruct {
  DtSubCategoryStruct({
    int? subKey,
    int? catCde,
    String? desc,
    int? lngCde,
    int? seq,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subKey = subKey,
        _catCde = catCde,
        _desc = desc,
        _lngCde = lngCde,
        _seq = seq,
        super(firestoreUtilData);

  // "sub_key" field.
  int? _subKey;
  int get subKey => _subKey ?? 0;
  set subKey(int? val) => _subKey = val;

  void incrementSubKey(int amount) => subKey = subKey + amount;

  bool hasSubKey() => _subKey != null;

  // "cat_cde" field.
  int? _catCde;
  int get catCde => _catCde ?? 0;
  set catCde(int? val) => _catCde = val;

  void incrementCatCde(int amount) => catCde = catCde + amount;

  bool hasCatCde() => _catCde != null;

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

  static DtSubCategoryStruct fromMap(Map<String, dynamic> data) =>
      DtSubCategoryStruct(
        subKey: castToType<int>(data['sub_key']),
        catCde: castToType<int>(data['cat_cde']),
        desc: data['desc'] as String?,
        lngCde: castToType<int>(data['lng_cde']),
        seq: castToType<int>(data['seq']),
      );

  static DtSubCategoryStruct? maybeFromMap(dynamic data) => data is Map
      ? DtSubCategoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sub_key': _subKey,
        'cat_cde': _catCde,
        'desc': _desc,
        'lng_cde': _lngCde,
        'seq': _seq,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sub_key': serializeParam(
          _subKey,
          ParamType.int,
        ),
        'cat_cde': serializeParam(
          _catCde,
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

  static DtSubCategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtSubCategoryStruct(
        subKey: deserializeParam(
          data['sub_key'],
          ParamType.int,
          false,
        ),
        catCde: deserializeParam(
          data['cat_cde'],
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
  String toString() => 'DtSubCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtSubCategoryStruct &&
        subKey == other.subKey &&
        catCde == other.catCde &&
        desc == other.desc &&
        lngCde == other.lngCde &&
        seq == other.seq;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([subKey, catCde, desc, lngCde, seq]);
}

DtSubCategoryStruct createDtSubCategoryStruct({
  int? subKey,
  int? catCde,
  String? desc,
  int? lngCde,
  int? seq,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtSubCategoryStruct(
      subKey: subKey,
      catCde: catCde,
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

DtSubCategoryStruct? updateDtSubCategoryStruct(
  DtSubCategoryStruct? dtSubCategory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtSubCategory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtSubCategoryStructData(
  Map<String, dynamic> firestoreData,
  DtSubCategoryStruct? dtSubCategory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtSubCategory == null) {
    return;
  }
  if (dtSubCategory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtSubCategory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtSubCategoryData =
      getDtSubCategoryFirestoreData(dtSubCategory, forFieldValue);
  final nestedData =
      dtSubCategoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtSubCategory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtSubCategoryFirestoreData(
  DtSubCategoryStruct? dtSubCategory, [
  bool forFieldValue = false,
]) {
  if (dtSubCategory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtSubCategory.toMap());

  // Add any Firestore field values
  dtSubCategory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtSubCategoryListFirestoreData(
  List<DtSubCategoryStruct>? dtSubCategorys,
) =>
    dtSubCategorys
        ?.map((e) => getDtSubCategoryFirestoreData(e, true))
        .toList() ??
    [];
