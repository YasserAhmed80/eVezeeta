import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CusPhotosRecord extends FirestoreRecord {
  CusPhotosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "cus_id" field.
  String? _cusId;
  String get cusId => _cusId ?? '';
  bool hasCusId() => _cusId != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "c" field.
  String? _c;
  String get c => _c ?? '';
  bool hasC() => _c != null;

  void _initializeFields() {
    _cusId = snapshotData['cus_id'] as String?;
    _img = snapshotData['img'] as String?;
    _c = snapshotData['c'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cus_photos');

  static Stream<CusPhotosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CusPhotosRecord.fromSnapshot(s));

  static Future<CusPhotosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CusPhotosRecord.fromSnapshot(s));

  static CusPhotosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CusPhotosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CusPhotosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CusPhotosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CusPhotosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CusPhotosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCusPhotosRecordData({
  String? cusId,
  String? img,
  String? c,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cus_id': cusId,
      'img': img,
      'c': c,
    }.withoutNulls,
  );

  return firestoreData;
}

class CusPhotosRecordDocumentEquality implements Equality<CusPhotosRecord> {
  const CusPhotosRecordDocumentEquality();

  @override
  bool equals(CusPhotosRecord? e1, CusPhotosRecord? e2) {
    return e1?.cusId == e2?.cusId && e1?.img == e2?.img && e1?.c == e2?.c;
  }

  @override
  int hash(CusPhotosRecord? e) =>
      const ListEquality().hash([e?.cusId, e?.img, e?.c]);

  @override
  bool isValidKey(Object? o) => o is CusPhotosRecord;
}
