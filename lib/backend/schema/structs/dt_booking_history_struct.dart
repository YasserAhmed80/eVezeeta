// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtBookingHistoryStruct extends FFFirebaseStruct {
  DtBookingHistoryStruct({
    DateTime? date,
    int? statusCde,
    String? cusId,
    int? price,
    int? fee,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _statusCde = statusCde,
        _cusId = cusId,
        _price = price,
        _fee = fee,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "status_cde" field.
  int? _statusCde;
  int get statusCde => _statusCde ?? 0;
  set statusCde(int? val) => _statusCde = val;

  void incrementStatusCde(int amount) => statusCde = statusCde + amount;

  bool hasStatusCde() => _statusCde != null;

  // "cus_id" field.
  String? _cusId;
  String get cusId => _cusId ?? '';
  set cusId(String? val) => _cusId = val;

  bool hasCusId() => _cusId != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "fee" field.
  int? _fee;
  int get fee => _fee ?? 0;
  set fee(int? val) => _fee = val;

  void incrementFee(int amount) => fee = fee + amount;

  bool hasFee() => _fee != null;

  static DtBookingHistoryStruct fromMap(Map<String, dynamic> data) =>
      DtBookingHistoryStruct(
        date: data['date'] as DateTime?,
        statusCde: castToType<int>(data['status_cde']),
        cusId: data['cus_id'] as String?,
        price: castToType<int>(data['price']),
        fee: castToType<int>(data['fee']),
      );

  static DtBookingHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? DtBookingHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'status_cde': _statusCde,
        'cus_id': _cusId,
        'price': _price,
        'fee': _fee,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'status_cde': serializeParam(
          _statusCde,
          ParamType.int,
        ),
        'cus_id': serializeParam(
          _cusId,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'fee': serializeParam(
          _fee,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtBookingHistoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtBookingHistoryStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        statusCde: deserializeParam(
          data['status_cde'],
          ParamType.int,
          false,
        ),
        cusId: deserializeParam(
          data['cus_id'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        fee: deserializeParam(
          data['fee'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtBookingHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtBookingHistoryStruct &&
        date == other.date &&
        statusCde == other.statusCde &&
        cusId == other.cusId &&
        price == other.price &&
        fee == other.fee;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, statusCde, cusId, price, fee]);
}

DtBookingHistoryStruct createDtBookingHistoryStruct({
  DateTime? date,
  int? statusCde,
  String? cusId,
  int? price,
  int? fee,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtBookingHistoryStruct(
      date: date,
      statusCde: statusCde,
      cusId: cusId,
      price: price,
      fee: fee,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtBookingHistoryStruct? updateDtBookingHistoryStruct(
  DtBookingHistoryStruct? dtBookingHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtBookingHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtBookingHistoryStructData(
  Map<String, dynamic> firestoreData,
  DtBookingHistoryStruct? dtBookingHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtBookingHistory == null) {
    return;
  }
  if (dtBookingHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtBookingHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtBookingHistoryData =
      getDtBookingHistoryFirestoreData(dtBookingHistory, forFieldValue);
  final nestedData =
      dtBookingHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtBookingHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtBookingHistoryFirestoreData(
  DtBookingHistoryStruct? dtBookingHistory, [
  bool forFieldValue = false,
]) {
  if (dtBookingHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtBookingHistory.toMap());

  // Add any Firestore field values
  dtBookingHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtBookingHistoryListFirestoreData(
  List<DtBookingHistoryStruct>? dtBookingHistorys,
) =>
    dtBookingHistorys
        ?.map((e) => getDtBookingHistoryFirestoreData(e, true))
        .toList() ??
    [];
