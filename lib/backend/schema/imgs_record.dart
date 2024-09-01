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

  // "i_ver" field.
  bool? _iVer;
  bool get iVer => _iVer ?? false;
  bool hasIVer() => _iVer != null;

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

  void _initializeFields() {
    _eType = snapshotData['e_type'] as String?;
    _iType = snapshotData['i_type'] as String?;
    _iSeq = castToType<int>(snapshotData['i_seq']);
    _iVer = snapshotData['i_ver'] as bool?;
    _iRef = snapshotData['i_ref'] as String?;
    _eCode = snapshotData['e_code'] as String?;
    _cAt = snapshotData['c_at'] as DateTime?;
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
  bool? iVer,
  String? iRef,
  String? eCode,
  DateTime? cAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'e_type': eType,
      'i_type': iType,
      'i_seq': iSeq,
      'i_ver': iVer,
      'i_ref': iRef,
      'e_code': eCode,
      'c_at': cAt,
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
        e1?.iVer == e2?.iVer &&
        e1?.iRef == e2?.iRef &&
        e1?.eCode == e2?.eCode &&
        e1?.cAt == e2?.cAt;
  }

  @override
  int hash(ImgsRecord? e) => const ListEquality()
      .hash([e?.eType, e?.iType, e?.iSeq, e?.iVer, e?.iRef, e?.eCode, e?.cAt]);

  @override
  bool isValidKey(Object? o) => o is ImgsRecord;
}
