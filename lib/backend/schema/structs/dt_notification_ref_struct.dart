// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtNotificationRefStruct extends FFFirebaseStruct {
  DtNotificationRefStruct({
    int? key,
    String? desc,
    int? severtyCde,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _key = key,
        _desc = desc,
        _severtyCde = severtyCde,
        _color = color,
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

  // "severty_cde" field.
  int? _severtyCde;
  int get severtyCde => _severtyCde ?? 0;
  set severtyCde(int? val) => _severtyCde = val;

  void incrementSevertyCde(int amount) => severtyCde = severtyCde + amount;

  bool hasSevertyCde() => _severtyCde != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static DtNotificationRefStruct fromMap(Map<String, dynamic> data) =>
      DtNotificationRefStruct(
        key: castToType<int>(data['key']),
        desc: data['desc'] as String?,
        severtyCde: castToType<int>(data['severty_cde']),
        color: getSchemaColor(data['color']),
      );

  static DtNotificationRefStruct? maybeFromMap(dynamic data) => data is Map
      ? DtNotificationRefStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'key': _key,
        'desc': _desc,
        'severty_cde': _severtyCde,
        'color': _color,
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
        'severty_cde': serializeParam(
          _severtyCde,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static DtNotificationRefStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtNotificationRefStruct(
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
        severtyCde: deserializeParam(
          data['severty_cde'],
          ParamType.int,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'DtNotificationRefStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtNotificationRefStruct &&
        key == other.key &&
        desc == other.desc &&
        severtyCde == other.severtyCde &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([key, desc, severtyCde, color]);
}

DtNotificationRefStruct createDtNotificationRefStruct({
  int? key,
  String? desc,
  int? severtyCde,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtNotificationRefStruct(
      key: key,
      desc: desc,
      severtyCde: severtyCde,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtNotificationRefStruct? updateDtNotificationRefStruct(
  DtNotificationRefStruct? dtNotificationRef, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtNotificationRef
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtNotificationRefStructData(
  Map<String, dynamic> firestoreData,
  DtNotificationRefStruct? dtNotificationRef,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtNotificationRef == null) {
    return;
  }
  if (dtNotificationRef.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtNotificationRef.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtNotificationRefData =
      getDtNotificationRefFirestoreData(dtNotificationRef, forFieldValue);
  final nestedData =
      dtNotificationRefData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtNotificationRef.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtNotificationRefFirestoreData(
  DtNotificationRefStruct? dtNotificationRef, [
  bool forFieldValue = false,
]) {
  if (dtNotificationRef == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtNotificationRef.toMap());

  // Add any Firestore field values
  dtNotificationRef.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtNotificationRefListFirestoreData(
  List<DtNotificationRefStruct>? dtNotificationRefs,
) =>
    dtNotificationRefs
        ?.map((e) => getDtNotificationRefFirestoreData(e, true))
        .toList() ??
    [];
