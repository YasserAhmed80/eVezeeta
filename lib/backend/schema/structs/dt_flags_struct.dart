// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtFlagsStruct extends FFFirebaseStruct {
  DtFlagsStruct({
    String? id,
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _url = url,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static DtFlagsStruct fromMap(Map<String, dynamic> data) => DtFlagsStruct(
        id: data['id'] as String?,
        url: data['url'] as String?,
      );

  static DtFlagsStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtFlagsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtFlagsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtFlagsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtFlagsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtFlagsStruct && id == other.id && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([id, url]);
}

DtFlagsStruct createDtFlagsStruct({
  String? id,
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtFlagsStruct(
      id: id,
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtFlagsStruct? updateDtFlagsStruct(
  DtFlagsStruct? dtFlags, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtFlags
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtFlagsStructData(
  Map<String, dynamic> firestoreData,
  DtFlagsStruct? dtFlags,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtFlags == null) {
    return;
  }
  if (dtFlags.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtFlags.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtFlagsData = getDtFlagsFirestoreData(dtFlags, forFieldValue);
  final nestedData = dtFlagsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtFlags.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtFlagsFirestoreData(
  DtFlagsStruct? dtFlags, [
  bool forFieldValue = false,
]) {
  if (dtFlags == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtFlags.toMap());

  // Add any Firestore field values
  dtFlags.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtFlagsListFirestoreData(
  List<DtFlagsStruct>? dtFlagss,
) =>
    dtFlagss?.map((e) => getDtFlagsFirestoreData(e, true)).toList() ?? [];
