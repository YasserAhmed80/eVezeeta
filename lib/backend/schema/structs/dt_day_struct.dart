// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtDayStruct extends FFFirebaseStruct {
  DtDayStruct({
    int? dayKey,
    String? desc,
    int? seq,
    int? lngCde,
    String? descEng,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dayKey = dayKey,
        _desc = desc,
        _seq = seq,
        _lngCde = lngCde,
        _descEng = descEng,
        super(firestoreUtilData);

  // "day_key" field.
  int? _dayKey;
  int get dayKey => _dayKey ?? 0;
  set dayKey(int? val) => _dayKey = val;

  void incrementDayKey(int amount) => dayKey = dayKey + amount;

  bool hasDayKey() => _dayKey != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  set seq(int? val) => _seq = val;

  void incrementSeq(int amount) => seq = seq + amount;

  bool hasSeq() => _seq != null;

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  set lngCde(int? val) => _lngCde = val;

  void incrementLngCde(int amount) => lngCde = lngCde + amount;

  bool hasLngCde() => _lngCde != null;

  // "desc_eng" field.
  String? _descEng;
  String get descEng => _descEng ?? '';
  set descEng(String? val) => _descEng = val;

  bool hasDescEng() => _descEng != null;

  static DtDayStruct fromMap(Map<String, dynamic> data) => DtDayStruct(
        dayKey: castToType<int>(data['day_key']),
        desc: data['desc'] as String?,
        seq: castToType<int>(data['seq']),
        lngCde: castToType<int>(data['lng_cde']),
        descEng: data['desc_eng'] as String?,
      );

  static DtDayStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtDayStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'day_key': _dayKey,
        'desc': _desc,
        'seq': _seq,
        'lng_cde': _lngCde,
        'desc_eng': _descEng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'day_key': serializeParam(
          _dayKey,
          ParamType.int,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
        'seq': serializeParam(
          _seq,
          ParamType.int,
        ),
        'lng_cde': serializeParam(
          _lngCde,
          ParamType.int,
        ),
        'desc_eng': serializeParam(
          _descEng,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtDayStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtDayStruct(
        dayKey: deserializeParam(
          data['day_key'],
          ParamType.int,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
          ParamType.String,
          false,
        ),
        seq: deserializeParam(
          data['seq'],
          ParamType.int,
          false,
        ),
        lngCde: deserializeParam(
          data['lng_cde'],
          ParamType.int,
          false,
        ),
        descEng: deserializeParam(
          data['desc_eng'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtDayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtDayStruct &&
        dayKey == other.dayKey &&
        desc == other.desc &&
        seq == other.seq &&
        lngCde == other.lngCde &&
        descEng == other.descEng;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dayKey, desc, seq, lngCde, descEng]);
}

DtDayStruct createDtDayStruct({
  int? dayKey,
  String? desc,
  int? seq,
  int? lngCde,
  String? descEng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtDayStruct(
      dayKey: dayKey,
      desc: desc,
      seq: seq,
      lngCde: lngCde,
      descEng: descEng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtDayStruct? updateDtDayStruct(
  DtDayStruct? dtDay, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtDay
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtDayStructData(
  Map<String, dynamic> firestoreData,
  DtDayStruct? dtDay,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtDay == null) {
    return;
  }
  if (dtDay.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtDay.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtDayData = getDtDayFirestoreData(dtDay, forFieldValue);
  final nestedData = dtDayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtDay.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtDayFirestoreData(
  DtDayStruct? dtDay, [
  bool forFieldValue = false,
]) {
  if (dtDay == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtDay.toMap());

  // Add any Firestore field values
  dtDay.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtDayListFirestoreData(
  List<DtDayStruct>? dtDays,
) =>
    dtDays?.map((e) => getDtDayFirestoreData(e, true)).toList() ?? [];
