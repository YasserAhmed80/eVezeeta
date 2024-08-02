// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtBookStatusStruct extends FFFirebaseStruct {
  DtBookStatusStruct({
    int? code,
    Color? color,
    String? desc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _color = color,
        _desc = desc,
        super(firestoreUtilData);

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

  static DtBookStatusStruct fromMap(Map<String, dynamic> data) =>
      DtBookStatusStruct(
        code: castToType<int>(data['code']),
        color: getSchemaColor(data['color']),
        desc: data['desc'] as String?,
      );

  static DtBookStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? DtBookStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'color': _color,
        'desc': _desc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtBookStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtBookStatusStruct(
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtBookStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtBookStatusStruct &&
        code == other.code &&
        color == other.color &&
        desc == other.desc;
  }

  @override
  int get hashCode => const ListEquality().hash([code, color, desc]);
}

DtBookStatusStruct createDtBookStatusStruct({
  int? code,
  Color? color,
  String? desc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtBookStatusStruct(
      code: code,
      color: color,
      desc: desc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtBookStatusStruct? updateDtBookStatusStruct(
  DtBookStatusStruct? dtBookStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtBookStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtBookStatusStructData(
  Map<String, dynamic> firestoreData,
  DtBookStatusStruct? dtBookStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtBookStatus == null) {
    return;
  }
  if (dtBookStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtBookStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtBookStatusData =
      getDtBookStatusFirestoreData(dtBookStatus, forFieldValue);
  final nestedData =
      dtBookStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtBookStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtBookStatusFirestoreData(
  DtBookStatusStruct? dtBookStatus, [
  bool forFieldValue = false,
]) {
  if (dtBookStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtBookStatus.toMap());

  // Add any Firestore field values
  dtBookStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtBookStatusListFirestoreData(
  List<DtBookStatusStruct>? dtBookStatuss,
) =>
    dtBookStatuss?.map((e) => getDtBookStatusFirestoreData(e, true)).toList() ??
    [];
