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
        e1?.img == e2?.img;
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
        e?.img
      ]);

  @override
  bool isValidKey(Object? o) => o is DocRecord;
}
