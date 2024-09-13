import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CusFavDocRecord extends FirestoreRecord {
  CusFavDocRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cus_ref" field.
  DocumentReference? _cusRef;
  DocumentReference? get cusRef => _cusRef;
  bool hasCusRef() => _cusRef != null;

  // "doc_ref" field.
  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  bool hasDocRef() => _docRef != null;

  // "c_at" field.
  DateTime? _cAt;
  DateTime? get cAt => _cAt;
  bool hasCAt() => _cAt != null;

  void _initializeFields() {
    _cusRef = snapshotData['cus_ref'] as DocumentReference?;
    _docRef = snapshotData['doc_ref'] as DocumentReference?;
    _cAt = snapshotData['c_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cus_fav_doc');

  static Stream<CusFavDocRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CusFavDocRecord.fromSnapshot(s));

  static Future<CusFavDocRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CusFavDocRecord.fromSnapshot(s));

  static CusFavDocRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CusFavDocRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CusFavDocRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CusFavDocRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CusFavDocRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CusFavDocRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCusFavDocRecordData({
  DocumentReference? cusRef,
  DocumentReference? docRef,
  DateTime? cAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cus_ref': cusRef,
      'doc_ref': docRef,
      'c_at': cAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CusFavDocRecordDocumentEquality implements Equality<CusFavDocRecord> {
  const CusFavDocRecordDocumentEquality();

  @override
  bool equals(CusFavDocRecord? e1, CusFavDocRecord? e2) {
    return e1?.cusRef == e2?.cusRef &&
        e1?.docRef == e2?.docRef &&
        e1?.cAt == e2?.cAt;
  }

  @override
  int hash(CusFavDocRecord? e) =>
      const ListEquality().hash([e?.cusRef, e?.docRef, e?.cAt]);

  @override
  bool isValidKey(Object? o) => o is CusFavDocRecord;
}
