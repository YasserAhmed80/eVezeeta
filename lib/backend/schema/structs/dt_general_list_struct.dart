// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtGeneralListStruct extends FFFirebaseStruct {
  DtGeneralListStruct({
    int? key,
    String? desc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _key = key,
        _desc = desc,
        super(firestoreUtilData);

  // "key" field.
  int? _key;
  int get key => _key ?? 0;
  set key(int? val) => _key = val;

  void incrementKey(int amount) => key = key + amount;

  bool hasKey() => _key != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

  static DtGeneralListStruct fromMap(Map<String, dynamic> data) =>
      DtGeneralListStruct(
        key: castToType<int>(data['key']),
        desc: data['desc'] as String?,
      );

  static DtGeneralListStruct? maybeFromMap(dynamic data) => data is Map
      ? DtGeneralListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'key': _key,
        'desc': _desc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'key': serializeParam(
          _key,
          ParamType.int,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtGeneralListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtGeneralListStruct(
        key: deserializeParam(
          data['key'],
          ParamType.int,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtGeneralListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtGeneralListStruct &&
        key == other.key &&
        desc == other.desc;
  }

  @override
  int get hashCode => const ListEquality().hash([key, desc]);
}

DtGeneralListStruct createDtGeneralListStruct({
  int? key,
  String? desc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtGeneralListStruct(
      key: key,
      desc: desc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtGeneralListStruct? updateDtGeneralListStruct(
  DtGeneralListStruct? dtGeneralList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtGeneralList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtGeneralListStructData(
  Map<String, dynamic> firestoreData,
  DtGeneralListStruct? dtGeneralList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtGeneralList == null) {
    return;
  }
  if (dtGeneralList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtGeneralList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtGeneralListData =
      getDtGeneralListFirestoreData(dtGeneralList, forFieldValue);
  final nestedData =
      dtGeneralListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtGeneralList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtGeneralListFirestoreData(
  DtGeneralListStruct? dtGeneralList, [
  bool forFieldValue = false,
]) {
  if (dtGeneralList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtGeneralList.toMap());

  // Add any Firestore field values
  dtGeneralList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtGeneralListListFirestoreData(
  List<DtGeneralListStruct>? dtGeneralLists,
) =>
    dtGeneralLists
        ?.map((e) => getDtGeneralListFirestoreData(e, true))
        .toList() ??
    [];
