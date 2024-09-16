import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CusFilesRecord extends FirestoreRecord {
  CusFilesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "cus_ref" field.
  DocumentReference? _cusRef;
  DocumentReference? get cusRef => _cusRef;
  bool hasCusRef() => _cusRef != null;

  // "file_cde" field.
  int? _fileCde;
  int get fileCde => _fileCde ?? 0;
  bool hasFileCde() => _fileCde != null;

  // "file_desc" field.
  String? _fileDesc;
  String get fileDesc => _fileDesc ?? '';
  bool hasFileDesc() => _fileDesc != null;

  // "doc_ref" field.
  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  bool hasDocRef() => _docRef != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "c_at" field.
  DateTime? _cAt;
  DateTime? get cAt => _cAt;
  bool hasCAt() => _cAt != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "doc_desc" field.
  String? _docDesc;
  String get docDesc => _docDesc ?? '';
  bool hasDocDesc() => _docDesc != null;

  // "review_status" field.
  int? _reviewStatus;
  int get reviewStatus => _reviewStatus ?? 0;
  bool hasReviewStatus() => _reviewStatus != null;

  // "review_reason" field.
  String? _reviewReason;
  String get reviewReason => _reviewReason ?? '';
  bool hasReviewReason() => _reviewReason != null;

  void _initializeFields() {
    _cusRef = snapshotData['cus_ref'] as DocumentReference?;
    _fileCde = castToType<int>(snapshotData['file_cde']);
    _fileDesc = snapshotData['file_desc'] as String?;
    _docRef = snapshotData['doc_ref'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _cAt = snapshotData['c_at'] as DateTime?;
    _img = snapshotData['img'] as String?;
    _docDesc = snapshotData['doc_desc'] as String?;
    _reviewStatus = castToType<int>(snapshotData['review_status']);
    _reviewReason = snapshotData['review_reason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cus_files');

  static Stream<CusFilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CusFilesRecord.fromSnapshot(s));

  static Future<CusFilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CusFilesRecord.fromSnapshot(s));

  static CusFilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CusFilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CusFilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CusFilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CusFilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CusFilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCusFilesRecordData({
  DocumentReference? cusRef,
  int? fileCde,
  String? fileDesc,
  DocumentReference? docRef,
  DateTime? date,
  DateTime? cAt,
  String? img,
  String? docDesc,
  int? reviewStatus,
  String? reviewReason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cus_ref': cusRef,
      'file_cde': fileCde,
      'file_desc': fileDesc,
      'doc_ref': docRef,
      'date': date,
      'c_at': cAt,
      'img': img,
      'doc_desc': docDesc,
      'review_status': reviewStatus,
      'review_reason': reviewReason,
    }.withoutNulls,
  );

  return firestoreData;
}

class CusFilesRecordDocumentEquality implements Equality<CusFilesRecord> {
  const CusFilesRecordDocumentEquality();

  @override
  bool equals(CusFilesRecord? e1, CusFilesRecord? e2) {
    return e1?.cusRef == e2?.cusRef &&
        e1?.fileCde == e2?.fileCde &&
        e1?.fileDesc == e2?.fileDesc &&
        e1?.docRef == e2?.docRef &&
        e1?.date == e2?.date &&
        e1?.cAt == e2?.cAt &&
        e1?.img == e2?.img &&
        e1?.docDesc == e2?.docDesc &&
        e1?.reviewStatus == e2?.reviewStatus &&
        e1?.reviewReason == e2?.reviewReason;
  }

  @override
  int hash(CusFilesRecord? e) => const ListEquality().hash([
        e?.cusRef,
        e?.fileCde,
        e?.fileDesc,
        e?.docRef,
        e?.date,
        e?.cAt,
        e?.img,
        e?.docDesc,
        e?.reviewStatus,
        e?.reviewReason
      ]);

  @override
  bool isValidKey(Object? o) => o is CusFilesRecord;
}
