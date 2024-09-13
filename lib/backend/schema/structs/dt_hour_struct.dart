// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtHourStruct extends FFFirebaseStruct {
  DtHourStruct({
    int? hourKey,
    String? desc,
    String? period,
    int? seq,
    int? lngCde,
    EnumBookHourStatus? statusCde,
    int? bookCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _hourKey = hourKey,
        _desc = desc,
        _period = period,
        _seq = seq,
        _lngCde = lngCde,
        _statusCde = statusCde,
        _bookCount = bookCount,
        super(firestoreUtilData);

  // "hour_key" field.
  int? _hourKey;
  int get hourKey => _hourKey ?? 0;
  set hourKey(int? val) => _hourKey = val;

  void incrementHourKey(int amount) => hourKey = hourKey + amount;

  bool hasHourKey() => _hourKey != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

  // "period" field.
  String? _period;
  String get period => _period ?? '';
  set period(String? val) => _period = val;

  bool hasPeriod() => _period != null;

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

  // "status_cde" field.
  EnumBookHourStatus? _statusCde;
  EnumBookHourStatus? get statusCde => _statusCde;
  set statusCde(EnumBookHourStatus? val) => _statusCde = val;

  bool hasStatusCde() => _statusCde != null;

  // "book_count" field.
  int? _bookCount;
  int get bookCount => _bookCount ?? 0;
  set bookCount(int? val) => _bookCount = val;

  void incrementBookCount(int amount) => bookCount = bookCount + amount;

  bool hasBookCount() => _bookCount != null;

  static DtHourStruct fromMap(Map<String, dynamic> data) => DtHourStruct(
        hourKey: castToType<int>(data['hour_key']),
        desc: data['desc'] as String?,
        period: data['period'] as String?,
        seq: castToType<int>(data['seq']),
        lngCde: castToType<int>(data['lng_cde']),
        statusCde: deserializeEnum<EnumBookHourStatus>(data['status_cde']),
        bookCount: castToType<int>(data['book_count']),
      );

  static DtHourStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtHourStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'hour_key': _hourKey,
        'desc': _desc,
        'period': _period,
        'seq': _seq,
        'lng_cde': _lngCde,
        'status_cde': _statusCde?.serialize(),
        'book_count': _bookCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'hour_key': serializeParam(
          _hourKey,
          ParamType.int,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
        'period': serializeParam(
          _period,
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
        'status_cde': serializeParam(
          _statusCde,
          ParamType.Enum,
        ),
        'book_count': serializeParam(
          _bookCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtHourStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtHourStruct(
        hourKey: deserializeParam(
          data['hour_key'],
          ParamType.int,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
          ParamType.String,
          false,
        ),
        period: deserializeParam(
          data['period'],
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
        statusCde: deserializeParam<EnumBookHourStatus>(
          data['status_cde'],
          ParamType.Enum,
          false,
        ),
        bookCount: deserializeParam(
          data['book_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtHourStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtHourStruct &&
        hourKey == other.hourKey &&
        desc == other.desc &&
        period == other.period &&
        seq == other.seq &&
        lngCde == other.lngCde &&
        statusCde == other.statusCde &&
        bookCount == other.bookCount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([hourKey, desc, period, seq, lngCde, statusCde, bookCount]);
}

DtHourStruct createDtHourStruct({
  int? hourKey,
  String? desc,
  String? period,
  int? seq,
  int? lngCde,
  EnumBookHourStatus? statusCde,
  int? bookCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtHourStruct(
      hourKey: hourKey,
      desc: desc,
      period: period,
      seq: seq,
      lngCde: lngCde,
      statusCde: statusCde,
      bookCount: bookCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtHourStruct? updateDtHourStruct(
  DtHourStruct? dtHour, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtHour
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtHourStructData(
  Map<String, dynamic> firestoreData,
  DtHourStruct? dtHour,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtHour == null) {
    return;
  }
  if (dtHour.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtHour.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtHourData = getDtHourFirestoreData(dtHour, forFieldValue);
  final nestedData = dtHourData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtHour.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtHourFirestoreData(
  DtHourStruct? dtHour, [
  bool forFieldValue = false,
]) {
  if (dtHour == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtHour.toMap());

  // Add any Firestore field values
  dtHour.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtHourListFirestoreData(
  List<DtHourStruct>? dtHours,
) =>
    dtHours?.map((e) => getDtHourFirestoreData(e, true)).toList() ?? [];
