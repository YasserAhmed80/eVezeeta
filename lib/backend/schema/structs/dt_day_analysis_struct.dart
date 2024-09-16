// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtDayAnalysisStruct extends FFFirebaseStruct {
  DtDayAnalysisStruct({
    DateTime? date,
    int? count,
    int? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _count = count,
        _value = value,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  set value(int? val) => _value = val;

  void incrementValue(int amount) => value = value + amount;

  bool hasValue() => _value != null;

  static DtDayAnalysisStruct fromMap(Map<String, dynamic> data) =>
      DtDayAnalysisStruct(
        date: data['date'] as DateTime?,
        count: castToType<int>(data['count']),
        value: castToType<int>(data['value']),
      );

  static DtDayAnalysisStruct? maybeFromMap(dynamic data) => data is Map
      ? DtDayAnalysisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'count': _count,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'value': serializeParam(
          _value,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtDayAnalysisStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtDayAnalysisStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtDayAnalysisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtDayAnalysisStruct &&
        date == other.date &&
        count == other.count &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([date, count, value]);
}

DtDayAnalysisStruct createDtDayAnalysisStruct({
  DateTime? date,
  int? count,
  int? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtDayAnalysisStruct(
      date: date,
      count: count,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtDayAnalysisStruct? updateDtDayAnalysisStruct(
  DtDayAnalysisStruct? dtDayAnalysis, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtDayAnalysis
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtDayAnalysisStructData(
  Map<String, dynamic> firestoreData,
  DtDayAnalysisStruct? dtDayAnalysis,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtDayAnalysis == null) {
    return;
  }
  if (dtDayAnalysis.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtDayAnalysis.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtDayAnalysisData =
      getDtDayAnalysisFirestoreData(dtDayAnalysis, forFieldValue);
  final nestedData =
      dtDayAnalysisData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtDayAnalysis.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtDayAnalysisFirestoreData(
  DtDayAnalysisStruct? dtDayAnalysis, [
  bool forFieldValue = false,
]) {
  if (dtDayAnalysis == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtDayAnalysis.toMap());

  // Add any Firestore field values
  dtDayAnalysis.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtDayAnalysisListFirestoreData(
  List<DtDayAnalysisStruct>? dtDayAnalysiss,
) =>
    dtDayAnalysiss
        ?.map((e) => getDtDayAnalysisFirestoreData(e, true))
        .toList() ??
    [];
