import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "admin_id" field.
  String? _adminId;
  String get adminId => _adminId ?? '';
  bool hasAdminId() => _adminId != null;

  // "e_id" field.
  String? _eId;
  String get eId => _eId ?? '';
  bool hasEId() => _eId != null;

  // "e_type" field.
  String? _eType;
  String get eType => _eType ?? '';
  bool hasEType() => _eType != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  bool hasMsg() => _msg != null;

  // "c_at" field.
  DateTime? _cAt;
  DateTime? get cAt => _cAt;
  bool hasCAt() => _cAt != null;

  // "not_cde" field.
  int? _notCde;
  int get notCde => _notCde ?? 0;
  bool hasNotCde() => _notCde != null;

  // "seen_ind" field.
  bool? _seenInd;
  bool get seenInd => _seenInd ?? false;
  bool hasSeenInd() => _seenInd != null;

  void _initializeFields() {
    _adminId = snapshotData['admin_id'] as String?;
    _eId = snapshotData['e_id'] as String?;
    _eType = snapshotData['e_type'] as String?;
    _msg = snapshotData['msg'] as String?;
    _cAt = snapshotData['c_at'] as DateTime?;
    _notCde = castToType<int>(snapshotData['not_cde']);
    _seenInd = snapshotData['seen_ind'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? adminId,
  String? eId,
  String? eType,
  String? msg,
  DateTime? cAt,
  int? notCde,
  bool? seenInd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin_id': adminId,
      'e_id': eId,
      'e_type': eType,
      'msg': msg,
      'c_at': cAt,
      'not_cde': notCde,
      'seen_ind': seenInd,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.adminId == e2?.adminId &&
        e1?.eId == e2?.eId &&
        e1?.eType == e2?.eType &&
        e1?.msg == e2?.msg &&
        e1?.cAt == e2?.cAt &&
        e1?.notCde == e2?.notCde &&
        e1?.seenInd == e2?.seenInd;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash(
      [e?.adminId, e?.eId, e?.eType, e?.msg, e?.cAt, e?.notCde, e?.seenInd]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
