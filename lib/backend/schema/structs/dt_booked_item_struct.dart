// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtBookedItemStruct extends FFFirebaseStruct {
  DtBookedItemStruct({
    String? cusId,
    String? docId,
    DateTime? date,
    DateTime? time,
    int? statusCde,
    String? cusName,
    String? cusTel,
    DocumentReference? itemRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cusId = cusId,
        _docId = docId,
        _date = date,
        _time = time,
        _statusCde = statusCde,
        _cusName = cusName,
        _cusTel = cusTel,
        _itemRef = itemRef,
        super(firestoreUtilData);

  // "cus_id" field.
  String? _cusId;
  String get cusId => _cusId ?? '';
  set cusId(String? val) => _cusId = val;

  bool hasCusId() => _cusId != null;

  // "doc_id" field.
  String? _docId;
  String get docId => _docId ?? '';
  set docId(String? val) => _docId = val;

  bool hasDocId() => _docId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "status_cde" field.
  int? _statusCde;
  int get statusCde => _statusCde ?? 0;
  set statusCde(int? val) => _statusCde = val;

  void incrementStatusCde(int amount) => statusCde = statusCde + amount;

  bool hasStatusCde() => _statusCde != null;

  // "cus_name" field.
  String? _cusName;
  String get cusName => _cusName ?? '';
  set cusName(String? val) => _cusName = val;

  bool hasCusName() => _cusName != null;

  // "cus_tel" field.
  String? _cusTel;
  String get cusTel => _cusTel ?? '';
  set cusTel(String? val) => _cusTel = val;

  bool hasCusTel() => _cusTel != null;

  // "item_ref" field.
  DocumentReference? _itemRef;
  DocumentReference? get itemRef => _itemRef;
  set itemRef(DocumentReference? val) => _itemRef = val;

  bool hasItemRef() => _itemRef != null;

  static DtBookedItemStruct fromMap(Map<String, dynamic> data) =>
      DtBookedItemStruct(
        cusId: data['cus_id'] as String?,
        docId: data['doc_id'] as String?,
        date: data['date'] as DateTime?,
        time: data['time'] as DateTime?,
        statusCde: castToType<int>(data['status_cde']),
        cusName: data['cus_name'] as String?,
        cusTel: data['cus_tel'] as String?,
        itemRef: data['item_ref'] as DocumentReference?,
      );

  static DtBookedItemStruct? maybeFromMap(dynamic data) => data is Map
      ? DtBookedItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cus_id': _cusId,
        'doc_id': _docId,
        'date': _date,
        'time': _time,
        'status_cde': _statusCde,
        'cus_name': _cusName,
        'cus_tel': _cusTel,
        'item_ref': _itemRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cus_id': serializeParam(
          _cusId,
          ParamType.String,
        ),
        'doc_id': serializeParam(
          _docId,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'status_cde': serializeParam(
          _statusCde,
          ParamType.int,
        ),
        'cus_name': serializeParam(
          _cusName,
          ParamType.String,
        ),
        'cus_tel': serializeParam(
          _cusTel,
          ParamType.String,
        ),
        'item_ref': serializeParam(
          _itemRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static DtBookedItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtBookedItemStruct(
        cusId: deserializeParam(
          data['cus_id'],
          ParamType.String,
          false,
        ),
        docId: deserializeParam(
          data['doc_id'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        statusCde: deserializeParam(
          data['status_cde'],
          ParamType.int,
          false,
        ),
        cusName: deserializeParam(
          data['cus_name'],
          ParamType.String,
          false,
        ),
        cusTel: deserializeParam(
          data['cus_tel'],
          ParamType.String,
          false,
        ),
        itemRef: deserializeParam(
          data['item_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['doc_booked_time'],
        ),
      );

  @override
  String toString() => 'DtBookedItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtBookedItemStruct &&
        cusId == other.cusId &&
        docId == other.docId &&
        date == other.date &&
        time == other.time &&
        statusCde == other.statusCde &&
        cusName == other.cusName &&
        cusTel == other.cusTel &&
        itemRef == other.itemRef;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([cusId, docId, date, time, statusCde, cusName, cusTel, itemRef]);
}

DtBookedItemStruct createDtBookedItemStruct({
  String? cusId,
  String? docId,
  DateTime? date,
  DateTime? time,
  int? statusCde,
  String? cusName,
  String? cusTel,
  DocumentReference? itemRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtBookedItemStruct(
      cusId: cusId,
      docId: docId,
      date: date,
      time: time,
      statusCde: statusCde,
      cusName: cusName,
      cusTel: cusTel,
      itemRef: itemRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtBookedItemStruct? updateDtBookedItemStruct(
  DtBookedItemStruct? dtBookedItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtBookedItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtBookedItemStructData(
  Map<String, dynamic> firestoreData,
  DtBookedItemStruct? dtBookedItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtBookedItem == null) {
    return;
  }
  if (dtBookedItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtBookedItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtBookedItemData =
      getDtBookedItemFirestoreData(dtBookedItem, forFieldValue);
  final nestedData =
      dtBookedItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtBookedItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtBookedItemFirestoreData(
  DtBookedItemStruct? dtBookedItem, [
  bool forFieldValue = false,
]) {
  if (dtBookedItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtBookedItem.toMap());

  // Add any Firestore field values
  dtBookedItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtBookedItemListFirestoreData(
  List<DtBookedItemStruct>? dtBookedItems,
) =>
    dtBookedItems?.map((e) => getDtBookedItemFirestoreData(e, true)).toList() ??
    [];
