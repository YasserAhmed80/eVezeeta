// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtDaysListStruct extends FFFirebaseStruct {
  DtDaysListStruct({
    DateTime? dayValue,
    DtDayStruct? dayItem,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dayValue = dayValue,
        _dayItem = dayItem,
        super(firestoreUtilData);

  // "day_value" field.
  DateTime? _dayValue;
  DateTime? get dayValue => _dayValue;
  set dayValue(DateTime? val) => _dayValue = val;

  bool hasDayValue() => _dayValue != null;

  // "day_item" field.
  DtDayStruct? _dayItem;
  DtDayStruct get dayItem => _dayItem ?? DtDayStruct();
  set dayItem(DtDayStruct? val) => _dayItem = val;

  void updateDayItem(Function(DtDayStruct) updateFn) {
    updateFn(_dayItem ??= DtDayStruct());
  }

  bool hasDayItem() => _dayItem != null;

  static DtDaysListStruct fromMap(Map<String, dynamic> data) =>
      DtDaysListStruct(
        dayValue: data['day_value'] as DateTime?,
        dayItem: DtDayStruct.maybeFromMap(data['day_item']),
      );

  static DtDaysListStruct? maybeFromMap(dynamic data) => data is Map
      ? DtDaysListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'day_value': _dayValue,
        'day_item': _dayItem?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'day_value': serializeParam(
          _dayValue,
          ParamType.DateTime,
        ),
        'day_item': serializeParam(
          _dayItem,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DtDaysListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtDaysListStruct(
        dayValue: deserializeParam(
          data['day_value'],
          ParamType.DateTime,
          false,
        ),
        dayItem: deserializeStructParam(
          data['day_item'],
          ParamType.DataStruct,
          false,
          structBuilder: DtDayStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DtDaysListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtDaysListStruct &&
        dayValue == other.dayValue &&
        dayItem == other.dayItem;
  }

  @override
  int get hashCode => const ListEquality().hash([dayValue, dayItem]);
}

DtDaysListStruct createDtDaysListStruct({
  DateTime? dayValue,
  DtDayStruct? dayItem,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtDaysListStruct(
      dayValue: dayValue,
      dayItem: dayItem ?? (clearUnsetFields ? DtDayStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtDaysListStruct? updateDtDaysListStruct(
  DtDaysListStruct? dtDaysList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtDaysList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtDaysListStructData(
  Map<String, dynamic> firestoreData,
  DtDaysListStruct? dtDaysList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtDaysList == null) {
    return;
  }
  if (dtDaysList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtDaysList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtDaysListData = getDtDaysListFirestoreData(dtDaysList, forFieldValue);
  final nestedData = dtDaysListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtDaysList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtDaysListFirestoreData(
  DtDaysListStruct? dtDaysList, [
  bool forFieldValue = false,
]) {
  if (dtDaysList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtDaysList.toMap());

  // Handle nested data for "day_item" field.
  addDtDayStructData(
    firestoreData,
    dtDaysList.hasDayItem() ? dtDaysList.dayItem : null,
    'day_item',
    forFieldValue,
  );

  // Add any Firestore field values
  dtDaysList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtDaysListListFirestoreData(
  List<DtDaysListStruct>? dtDaysLists,
) =>
    dtDaysLists?.map((e) => getDtDaysListFirestoreData(e, true)).toList() ?? [];
