import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocRecord extends FirestoreRecord {
  DocRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "gender" field.
  int? _gender;
  int get gender => _gender ?? 0;
  bool hasGender() => _gender != null;

  // "cat_id" field.
  int? _catId;
  int get catId => _catId ?? 0;
  bool hasCatId() => _catId != null;

  // "title_id" field.
  int? _titleId;
  int get titleId => _titleId ?? 0;
  bool hasTitleId() => _titleId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "sub_cat_id" field.
  List<int>? _subCatId;
  List<int> get subCatId => _subCatId ?? const [];
  bool hasSubCatId() => _subCatId != null;

  // "a_Con" field.
  int? _aCon;
  int get aCon => _aCon ?? 0;
  bool hasACon() => _aCon != null;

  // "a_gov" field.
  int? _aGov;
  int get aGov => _aGov ?? 0;
  bool hasAGov() => _aGov != null;

  // "a_zone" field.
  int? _aZone;
  int get aZone => _aZone ?? 0;
  bool hasAZone() => _aZone != null;

  // "a_area" field.
  int? _aArea;
  int get aArea => _aArea ?? 0;
  bool hasAArea() => _aArea != null;

  // "a_addr" field.
  String? _aAddr;
  String get aAddr => _aAddr ?? '';
  bool hasAAddr() => _aAddr != null;

  // "a_latlng" field.
  LatLng? _aLatlng;
  LatLng? get aLatlng => _aLatlng;
  bool hasALatlng() => _aLatlng != null;

  // "tel_1" field.
  String? _tel1;
  String get tel1 => _tel1 ?? '';
  bool hasTel1() => _tel1 != null;

  // "tel_2" field.
  String? _tel2;
  String get tel2 => _tel2 ?? '';
  bool hasTel2() => _tel2 != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "price_re" field.
  int? _priceRe;
  int get priceRe => _priceRe ?? 0;
  bool hasPriceRe() => _priceRe != null;

  // "avg_visit" field.
  int? _avgVisit;
  int get avgVisit => _avgVisit ?? 0;
  bool hasAvgVisit() => _avgVisit != null;

  // "book_type" field.
  int? _bookType;
  int get bookType => _bookType ?? 0;
  bool hasBookType() => _bookType != null;

  // "status_cde" field.
  int? _statusCde;
  int get statusCde => _statusCde ?? 0;
  bool hasStatusCde() => _statusCde != null;

  // "freq_cde" field.
  int? _freqCde;
  int get freqCde => _freqCde ?? 0;
  bool hasFreqCde() => _freqCde != null;

  // "s_f_date" field.
  DateTime? _sFDate;
  DateTime? get sFDate => _sFDate;
  bool hasSFDate() => _sFDate != null;

  // "s_to_date" field.
  DateTime? _sToDate;
  DateTime? get sToDate => _sToDate;
  bool hasSToDate() => _sToDate != null;

  // "s_cost" field.
  int? _sCost;
  int get sCost => _sCost ?? 0;
  bool hasSCost() => _sCost != null;

  // "s_fee" field.
  int? _sFee;
  int get sFee => _sFee ?? 0;
  bool hasSFee() => _sFee != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _gender = castToType<int>(snapshotData['gender']);
    _catId = castToType<int>(snapshotData['cat_id']);
    _titleId = castToType<int>(snapshotData['title_id']);
    _title = snapshotData['title'] as String?;
    _about = snapshotData['about'] as String?;
    _subCatId = getDataList(snapshotData['sub_cat_id']);
    _aCon = castToType<int>(snapshotData['a_Con']);
    _aGov = castToType<int>(snapshotData['a_gov']);
    _aZone = castToType<int>(snapshotData['a_zone']);
    _aArea = castToType<int>(snapshotData['a_area']);
    _aAddr = snapshotData['a_addr'] as String?;
    _aLatlng = snapshotData['a_latlng'] as LatLng?;
    _tel1 = snapshotData['tel_1'] as String?;
    _tel2 = snapshotData['tel_2'] as String?;
    _img = snapshotData['img'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _priceRe = castToType<int>(snapshotData['price_re']);
    _avgVisit = castToType<int>(snapshotData['avg_visit']);
    _bookType = castToType<int>(snapshotData['book_type']);
    _statusCde = castToType<int>(snapshotData['status_cde']);
    _freqCde = castToType<int>(snapshotData['freq_cde']);
    _sFDate = snapshotData['s_f_date'] as DateTime?;
    _sToDate = snapshotData['s_to_date'] as DateTime?;
    _sCost = castToType<int>(snapshotData['s_cost']);
    _sFee = castToType<int>(snapshotData['s_fee']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doc');

  static Stream<DocRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocRecord.fromSnapshot(s));

  static Future<DocRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocRecord.fromSnapshot(s));

  static DocRecord fromSnapshot(DocumentSnapshot snapshot) => DocRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocRecordData({
  String? name,
  int? gender,
  int? catId,
  int? titleId,
  String? title,
  String? about,
  int? aCon,
  int? aGov,
  int? aZone,
  int? aArea,
  String? aAddr,
  LatLng? aLatlng,
  String? tel1,
  String? tel2,
  String? img,
  int? price,
  int? priceRe,
  int? avgVisit,
  int? bookType,
  int? statusCde,
  int? freqCde,
  DateTime? sFDate,
  DateTime? sToDate,
  int? sCost,
  int? sFee,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'gender': gender,
      'cat_id': catId,
      'title_id': titleId,
      'title': title,
      'about': about,
      'a_Con': aCon,
      'a_gov': aGov,
      'a_zone': aZone,
      'a_area': aArea,
      'a_addr': aAddr,
      'a_latlng': aLatlng,
      'tel_1': tel1,
      'tel_2': tel2,
      'img': img,
      'price': price,
      'price_re': priceRe,
      'avg_visit': avgVisit,
      'book_type': bookType,
      'status_cde': statusCde,
      'freq_cde': freqCde,
      's_f_date': sFDate,
      's_to_date': sToDate,
      's_cost': sCost,
      's_fee': sFee,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocRecordDocumentEquality implements Equality<DocRecord> {
  const DocRecordDocumentEquality();

  @override
  bool equals(DocRecord? e1, DocRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.gender == e2?.gender &&
        e1?.catId == e2?.catId &&
        e1?.titleId == e2?.titleId &&
        e1?.title == e2?.title &&
        e1?.about == e2?.about &&
        listEquality.equals(e1?.subCatId, e2?.subCatId) &&
        e1?.aCon == e2?.aCon &&
        e1?.aGov == e2?.aGov &&
        e1?.aZone == e2?.aZone &&
        e1?.aArea == e2?.aArea &&
        e1?.aAddr == e2?.aAddr &&
        e1?.aLatlng == e2?.aLatlng &&
        e1?.tel1 == e2?.tel1 &&
        e1?.tel2 == e2?.tel2 &&
        e1?.img == e2?.img &&
        e1?.price == e2?.price &&
        e1?.priceRe == e2?.priceRe &&
        e1?.avgVisit == e2?.avgVisit &&
        e1?.bookType == e2?.bookType &&
        e1?.statusCde == e2?.statusCde &&
        e1?.freqCde == e2?.freqCde &&
        e1?.sFDate == e2?.sFDate &&
        e1?.sToDate == e2?.sToDate &&
        e1?.sCost == e2?.sCost &&
        e1?.sFee == e2?.sFee;
  }

  @override
  int hash(DocRecord? e) => const ListEquality().hash([
        e?.name,
        e?.gender,
        e?.catId,
        e?.titleId,
        e?.title,
        e?.about,
        e?.subCatId,
        e?.aCon,
        e?.aGov,
        e?.aZone,
        e?.aArea,
        e?.aAddr,
        e?.aLatlng,
        e?.tel1,
        e?.tel2,
        e?.img,
        e?.price,
        e?.priceRe,
        e?.avgVisit,
        e?.bookType,
        e?.statusCde,
        e?.freqCde,
        e?.sFDate,
        e?.sToDate,
        e?.sCost,
        e?.sFee
      ]);

  @override
  bool isValidKey(Object? o) => o is DocRecord;
}
