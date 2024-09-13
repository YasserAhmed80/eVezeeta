// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtDocTitleStruct extends FFFirebaseStruct {
  DtDocTitleStruct({
    int? titleKey,
    String? desc,
    int? lngCde,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titleKey = titleKey,
        _desc = desc,
        _lngCde = lngCde,
        super(firestoreUtilData);

  // "title_key" field.
  int? _titleKey;
  int get titleKey => _titleKey ?? 0;
  set titleKey(int? val) => _titleKey = val;

  void incrementTitleKey(int amount) => titleKey = titleKey + amount;

  bool hasTitleKey() => _titleKey != null;

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

  static DtDocTitleStruct fromMap(Map<String, dynamic> data) =>
      DtDocTitleStruct(
        titleKey: castToType<int>(data['title_key']),
        desc: data['desc'] as String?,
        lngCde: castToType<int>(data['lng_cde']),
      );

  static DtDocTitleStruct? maybeFromMap(dynamic data) => data is Map
      ? DtDocTitleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title_key': _titleKey,
        'desc': _desc,
        'lng_cde': _lngCde,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title_key': serializeParam(
          _titleKey,
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

  static DtDocTitleStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtDocTitleStruct(
        titleKey: deserializeParam(
          data['title_key'],
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
  String toString() => 'DtDocTitleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtDocTitleStruct &&
        titleKey == other.titleKey &&
        desc == other.desc &&
        lngCde == other.lngCde;
  }

  @override
  int get hashCode => const ListEquality().hash([titleKey, desc, lngCde]);
}

DtDocTitleStruct createDtDocTitleStruct({
  int? titleKey,
  String? desc,
  int? lngCde,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtDocTitleStruct(
      titleKey: titleKey,
      desc: desc,
      lngCde: lngCde,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtDocTitleStruct? updateDtDocTitleStruct(
  DtDocTitleStruct? dtDocTitle, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtDocTitle
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtDocTitleStructData(
  Map<String, dynamic> firestoreData,
  DtDocTitleStruct? dtDocTitle,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtDocTitle == null) {
    return;
  }
  if (dtDocTitle.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtDocTitle.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtDocTitleData = getDtDocTitleFirestoreData(dtDocTitle, forFieldValue);
  final nestedData = dtDocTitleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtDocTitle.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtDocTitleFirestoreData(
  DtDocTitleStruct? dtDocTitle, [
  bool forFieldValue = false,
]) {
  if (dtDocTitle == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtDocTitle.toMap());

  // Add any Firestore field values
  dtDocTitle.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtDocTitleListFirestoreData(
  List<DtDocTitleStruct>? dtDocTitles,
) =>
    dtDocTitles?.map((e) => getDtDocTitleFirestoreData(e, true)).toList() ?? [];
