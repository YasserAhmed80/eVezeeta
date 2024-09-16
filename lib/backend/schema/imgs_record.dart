import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImgsRecord extends FirestoreRecord {
  ImgsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "e_type" field.
  String? _eType;
  String get eType => _eType ?? '';
  bool hasEType() => _eType != null;

  // "i_type" field.
  String? _iType;
  String get iType => _iType ?? '';
  bool hasIType() => _iType != null;

  // "i_seq" field.
  int? _iSeq;
  int get iSeq => _iSeq ?? 0;
  bool hasISeq() => _iSeq != null;

  // "i_ref" field.
  String? _iRef;
  String get iRef => _iRef ?? '';
  bool hasIRef() => _iRef != null;

  // "e_code" field.
  String? _eCode;
  String get eCode => _eCode ?? '';
  bool hasECode() => _eCode != null;

  // "c_at" field.
  DateTime? _cAt;
  DateTime? get cAt => _cAt;
  bool hasCAt() => _cAt != null;

  // "review_status" field.
  int? _reviewStatus;
  int get reviewStatus => _reviewStatus ?? 0;
  bool hasReviewStatus() => _reviewStatus != null;

  // "review_reason" field.
  String? _reviewReason;
  String get reviewReason => _reviewReason ?? '';
  bool hasReviewReason() => _reviewReason != null;

  void _initializeFields() {
    _eType = snapshotData['e_type'] as String?;
    _iType = snapshotData['i_type'] as String?;
    _iSeq = castToType<int>(snapshotData['i_seq']);
    _iRef = snapshotData['i_ref'] as String?;
    _eCode = snapshotData['e_code'] as String?;
    _cAt = snapshotData['c_at'] as DateTime?;
    _reviewStatus = castToType<int>(snapshotData['review_status']);
    _reviewReason = snapshotData['review_reason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imgs');

  static Stream<ImgsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImgsRecord.fromSnapshot(s));

  static Future<ImgsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImgsRecord.fromSnapshot(s));

  static ImgsRecord fromSnapshot(DocumentSnapshot snapshot) => ImgsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImgsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImgsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImgsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImgsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImgsRecordData({
  String? eType,
  String? iType,
  int? iSeq,
  String? iRef,
  String? eCode,
  DateTime? cAt,
  int? reviewStatus,
  String? reviewReason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'e_type': eType,
      'i_type': iType,
      'i_seq': iSeq,
      'i_ref': iRef,
      'e_code': eCode,
      'c_at': cAt,
      'review_status': reviewStatus,
      'review_reason': reviewReason,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImgsRecordDocumentEquality implements Equality<ImgsRecord> {
  const ImgsRecordDocumentEquality();

  @override
  bool equals(ImgsRecord? e1, ImgsRecord? e2) {
    return e1?.eType == e2?.eType &&
        e1?.iType == e2?.iType &&
        e1?.iSeq == e2?.iSeq &&
        e1?.iRef == e2?.iRef &&
        e1?.eCode == e2?.eCode &&
        e1?.cAt == e2?.cAt &&
        e1?.reviewStatus == e2?.reviewStatus &&
        e1?.reviewReason == e2?.reviewReason;
  }

  @override
  int hash(ImgsRecord? e) => const ListEquality().hash([
        e?.eType,
        e?.iType,
        e?.iSeq,
        e?.iRef,
        e?.eCode,
        e?.cAt,
        e?.reviewStatus,
        e?.reviewReason
      ]);

  @override
  bool isValidKey(Object? o) => o is ImgsRecord;
}
