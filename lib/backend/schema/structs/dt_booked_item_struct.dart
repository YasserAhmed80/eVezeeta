// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtBookedItemStruct extends FFFirebaseStruct {
  DtBookedItemStruct({
    DateTime? date,
    DateTime? time,
    int? statusCde,
    String? cusName,
    String? cusTel,
    DocumentReference? itemRef,
    DocumentReference? docRef,
    DocumentReference? cusRef,
    String? cusImage,
    DateTime? cusDob,
    String? cancelReason,
    String? docName,
    String? docImg,
    int? docGender,
    int? price,
    int? docCatCde,
    String? docTitleDesc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _time = time,
        _statusCde = statusCde,
        _cusName = cusName,
        _cusTel = cusTel,
        _itemRef = itemRef,
        _docRef = docRef,
        _cusRef = cusRef,
        _cusImage = cusImage,
        _cusDob = cusDob,
        _cancelReason = cancelReason,
        _docName = docName,
        _docImg = docImg,
        _docGender = docGender,
        _price = price,
        _docCatCde = docCatCde,
        _docTitleDesc = docTitleDesc,
        super(firestoreUtilData);

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

  // "doc_ref" field.
  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  set docRef(DocumentReference? val) => _docRef = val;

  bool hasDocRef() => _docRef != null;

  // "cus_ref" field.
  DocumentReference? _cusRef;
  DocumentReference? get cusRef => _cusRef;
  set cusRef(DocumentReference? val) => _cusRef = val;

  bool hasCusRef() => _cusRef != null;

  // "cus_image" field.
  String? _cusImage;
  String get cusImage => _cusImage ?? '';
  set cusImage(String? val) => _cusImage = val;

  bool hasCusImage() => _cusImage != null;

  // "cus_dob" field.
  DateTime? _cusDob;
  DateTime? get cusDob => _cusDob;
  set cusDob(DateTime? val) => _cusDob = val;

  bool hasCusDob() => _cusDob != null;

  // "cancel_reason" field.
  String? _cancelReason;
  String get cancelReason => _cancelReason ?? '';
  set cancelReason(String? val) => _cancelReason = val;

  bool hasCancelReason() => _cancelReason != null;

  // "doc_name" field.
  String? _docName;
  String get docName => _docName ?? '';
  set docName(String? val) => _docName = val;

  bool hasDocName() => _docName != null;

  // "doc_img" field.
  String? _docImg;
  String get docImg => _docImg ?? '';
  set docImg(String? val) => _docImg = val;

  bool hasDocImg() => _docImg != null;

  // "doc_gender" field.
  int? _docGender;
  int get docGender => _docGender ?? 0;
  set docGender(int? val) => _docGender = val;

  void incrementDocGender(int amount) => docGender = docGender + amount;

  bool hasDocGender() => _docGender != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "doc_Cat_cde" field.
  int? _docCatCde;
  int get docCatCde => _docCatCde ?? 0;
  set docCatCde(int? val) => _docCatCde = val;

  void incrementDocCatCde(int amount) => docCatCde = docCatCde + amount;

  bool hasDocCatCde() => _docCatCde != null;

  // "doc_titleDesc" field.
  String? _docTitleDesc;
  String get docTitleDesc => _docTitleDesc ?? '';
  set docTitleDesc(String? val) => _docTitleDesc = val;

  bool hasDocTitleDesc() => _docTitleDesc != null;

  static DtBookedItemStruct fromMap(Map<String, dynamic> data) =>
      DtBookedItemStruct(
        date: data['date'] as DateTime?,
        time: data['time'] as DateTime?,
        statusCde: castToType<int>(data['status_cde']),
        cusName: data['cus_name'] as String?,
        cusTel: data['cus_tel'] as String?,
        itemRef: data['item_ref'] as DocumentReference?,
        docRef: data['doc_ref'] as DocumentReference?,
        cusRef: data['cus_ref'] as DocumentReference?,
        cusImage: data['cus_image'] as String?,
        cusDob: data['cus_dob'] as DateTime?,
        cancelReason: data['cancel_reason'] as String?,
        docName: data['doc_name'] as String?,
        docImg: data['doc_img'] as String?,
        docGender: castToType<int>(data['doc_gender']),
        price: castToType<int>(data['price']),
        docCatCde: castToType<int>(data['doc_Cat_cde']),
        docTitleDesc: data['doc_titleDesc'] as String?,
      );

  static DtBookedItemStruct? maybeFromMap(dynamic data) => data is Map
      ? DtBookedItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'time': _time,
        'status_cde': _statusCde,
        'cus_name': _cusName,
        'cus_tel': _cusTel,
        'item_ref': _itemRef,
        'doc_ref': _docRef,
        'cus_ref': _cusRef,
        'cus_image': _cusImage,
        'cus_dob': _cusDob,
        'cancel_reason': _cancelReason,
        'doc_name': _docName,
        'doc_img': _docImg,
        'doc_gender': _docGender,
        'price': _price,
        'doc_Cat_cde': _docCatCde,
        'doc_titleDesc': _docTitleDesc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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
        'doc_ref': serializeParam(
          _docRef,
          ParamType.DocumentReference,
        ),
        'cus_ref': serializeParam(
          _cusRef,
          ParamType.DocumentReference,
        ),
        'cus_image': serializeParam(
          _cusImage,
          ParamType.String,
        ),
        'cus_dob': serializeParam(
          _cusDob,
          ParamType.DateTime,
        ),
        'cancel_reason': serializeParam(
          _cancelReason,
          ParamType.String,
        ),
        'doc_name': serializeParam(
          _docName,
          ParamType.String,
        ),
        'doc_img': serializeParam(
          _docImg,
          ParamType.String,
        ),
        'doc_gender': serializeParam(
          _docGender,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'doc_Cat_cde': serializeParam(
          _docCatCde,
          ParamType.int,
        ),
        'doc_titleDesc': serializeParam(
          _docTitleDesc,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtBookedItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtBookedItemStruct(
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
        docRef: deserializeParam(
          data['doc_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['doc'],
        ),
        cusRef: deserializeParam(
          data['cus_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['cus'],
        ),
        cusImage: deserializeParam(
          data['cus_image'],
          ParamType.String,
          false,
        ),
        cusDob: deserializeParam(
          data['cus_dob'],
          ParamType.DateTime,
          false,
        ),
        cancelReason: deserializeParam(
          data['cancel_reason'],
          ParamType.String,
          false,
        ),
        docName: deserializeParam(
          data['doc_name'],
          ParamType.String,
          false,
        ),
        docImg: deserializeParam(
          data['doc_img'],
          ParamType.String,
          false,
        ),
        docGender: deserializeParam(
          data['doc_gender'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        docCatCde: deserializeParam(
          data['doc_Cat_cde'],
          ParamType.int,
          false,
        ),
        docTitleDesc: deserializeParam(
          data['doc_titleDesc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtBookedItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtBookedItemStruct &&
        date == other.date &&
        time == other.time &&
        statusCde == other.statusCde &&
        cusName == other.cusName &&
        cusTel == other.cusTel &&
        itemRef == other.itemRef &&
        docRef == other.docRef &&
        cusRef == other.cusRef &&
        cusImage == other.cusImage &&
        cusDob == other.cusDob &&
        cancelReason == other.cancelReason &&
        docName == other.docName &&
        docImg == other.docImg &&
        docGender == other.docGender &&
        price == other.price &&
        docCatCde == other.docCatCde &&
        docTitleDesc == other.docTitleDesc;
  }

  @override
  int get hashCode => const ListEquality().hash([
        date,
        time,
        statusCde,
        cusName,
        cusTel,
        itemRef,
        docRef,
        cusRef,
        cusImage,
        cusDob,
        cancelReason,
        docName,
        docImg,
        docGender,
        price,
        docCatCde,
        docTitleDesc
      ]);
}

DtBookedItemStruct createDtBookedItemStruct({
  DateTime? date,
  DateTime? time,
  int? statusCde,
  String? cusName,
  String? cusTel,
  DocumentReference? itemRef,
  DocumentReference? docRef,
  DocumentReference? cusRef,
  String? cusImage,
  DateTime? cusDob,
  String? cancelReason,
  String? docName,
  String? docImg,
  int? docGender,
  int? price,
  int? docCatCde,
  String? docTitleDesc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtBookedItemStruct(
      date: date,
      time: time,
      statusCde: statusCde,
      cusName: cusName,
      cusTel: cusTel,
      itemRef: itemRef,
      docRef: docRef,
      cusRef: cusRef,
      cusImage: cusImage,
      cusDob: cusDob,
      cancelReason: cancelReason,
      docName: docName,
      docImg: docImg,
      docGender: docGender,
      price: price,
      docCatCde: docCatCde,
      docTitleDesc: docTitleDesc,
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
