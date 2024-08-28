import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CusRecord extends FirestoreRecord {
  CusRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "tel" field.
  String? _tel;
  String get tel => _tel ?? '';
  bool hasTel() => _tel != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "sex" field.
  int? _sex;
  int get sex => _sex ?? 0;
  bool hasSex() => _sex != null;

  // "gov_cde" field.
  int? _govCde;
  int get govCde => _govCde ?? 0;
  bool hasGovCde() => _govCde != null;

  // "zone_cde" field.
  int? _zoneCde;
  int get zoneCde => _zoneCde ?? 0;
  bool hasZoneCde() => _zoneCde != null;

  // "con_cde" field.
  int? _conCde;
  int get conCde => _conCde ?? 0;
  bool hasConCde() => _conCde != null;

  // "area_cde" field.
  int? _areaCde;
  int get areaCde => _areaCde ?? 0;
  bool hasAreaCde() => _areaCde != null;

  // "addr" field.
  String? _addr;
  String get addr => _addr ?? '';
  bool hasAddr() => _addr != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _tel = snapshotData['tel'] as String?;
    _dob = snapshotData['dob'] as DateTime?;
    _sex = castToType<int>(snapshotData['sex']);
    _govCde = castToType<int>(snapshotData['gov_cde']);
    _zoneCde = castToType<int>(snapshotData['zone_cde']);
    _conCde = castToType<int>(snapshotData['con_cde']);
    _areaCde = castToType<int>(snapshotData['area_cde']);
    _addr = snapshotData['addr'] as String?;
    _img = snapshotData['img'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cus');

  static Stream<CusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CusRecord.fromSnapshot(s));

  static Future<CusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CusRecord.fromSnapshot(s));

  static CusRecord fromSnapshot(DocumentSnapshot snapshot) => CusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCusRecordData({
  String? name,
  String? tel,
  DateTime? dob,
  int? sex,
  int? govCde,
  int? zoneCde,
  int? conCde,
  int? areaCde,
  String? addr,
  String? img,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'tel': tel,
      'dob': dob,
      'sex': sex,
      'gov_cde': govCde,
      'zone_cde': zoneCde,
      'con_cde': conCde,
      'area_cde': areaCde,
      'addr': addr,
      'img': img,
    }.withoutNulls,
  );

  return firestoreData;
}

class CusRecordDocumentEquality implements Equality<CusRecord> {
  const CusRecordDocumentEquality();

  @override
  bool equals(CusRecord? e1, CusRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.tel == e2?.tel &&
        e1?.dob == e2?.dob &&
        e1?.sex == e2?.sex &&
        e1?.govCde == e2?.govCde &&
        e1?.zoneCde == e2?.zoneCde &&
        e1?.conCde == e2?.conCde &&
        e1?.areaCde == e2?.areaCde &&
        e1?.addr == e2?.addr &&
        e1?.img == e2?.img;
  }

  @override
  int hash(CusRecord? e) => const ListEquality().hash([
        e?.name,
        e?.tel,
        e?.dob,
        e?.sex,
        e?.govCde,
        e?.zoneCde,
        e?.conCde,
        e?.areaCde,
        e?.addr,
        e?.img
      ]);

  @override
  bool isValidKey(Object? o) => o is CusRecord;
}
