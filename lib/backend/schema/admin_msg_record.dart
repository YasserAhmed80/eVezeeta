import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminMsgRecord extends FirestoreRecord {
  AdminMsgRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "e_type" field.
  String? _eType;
  String get eType => _eType ?? '';
  bool hasEType() => _eType != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  bool hasMsg() => _msg != null;

  // "svrty_cd" field.
  int? _svrtyCd;
  int get svrtyCd => _svrtyCd ?? 0;
  bool hasSvrtyCd() => _svrtyCd != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "c_at" field.
  DateTime? _cAt;
  DateTime? get cAt => _cAt;
  bool hasCAt() => _cAt != null;

  // "reviwed" field.
  bool? _reviwed;
  bool get reviwed => _reviwed ?? false;
  bool hasReviwed() => _reviwed != null;

  // "from_id" field.
  String? _fromId;
  String get fromId => _fromId ?? '';
  bool hasFromId() => _fromId != null;

  // "to_id" field.
  String? _toId;
  String get toId => _toId ?? '';
  bool hasToId() => _toId != null;

  // "admin_ind" field.
  bool? _adminInd;
  bool get adminInd => _adminInd ?? false;
  bool hasAdminInd() => _adminInd != null;

  void _initializeFields() {
    _eType = snapshotData['e_type'] as String?;
    _msg = snapshotData['msg'] as String?;
    _svrtyCd = castToType<int>(snapshotData['svrty_cd']);
    _img = snapshotData['img'] as String?;
    _cAt = snapshotData['c_at'] as DateTime?;
    _reviwed = snapshotData['reviwed'] as bool?;
    _fromId = snapshotData['from_id'] as String?;
    _toId = snapshotData['to_id'] as String?;
    _adminInd = snapshotData['admin_ind'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admin_msg');

  static Stream<AdminMsgRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminMsgRecord.fromSnapshot(s));

  static Future<AdminMsgRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminMsgRecord.fromSnapshot(s));

  static AdminMsgRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminMsgRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminMsgRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminMsgRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminMsgRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminMsgRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminMsgRecordData({
  String? eType,
  String? msg,
  int? svrtyCd,
  String? img,
  DateTime? cAt,
  bool? reviwed,
  String? fromId,
  String? toId,
  bool? adminInd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'e_type': eType,
      'msg': msg,
      'svrty_cd': svrtyCd,
      'img': img,
      'c_at': cAt,
      'reviwed': reviwed,
      'from_id': fromId,
      'to_id': toId,
      'admin_ind': adminInd,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminMsgRecordDocumentEquality implements Equality<AdminMsgRecord> {
  const AdminMsgRecordDocumentEquality();

  @override
  bool equals(AdminMsgRecord? e1, AdminMsgRecord? e2) {
    return e1?.eType == e2?.eType &&
        e1?.msg == e2?.msg &&
        e1?.svrtyCd == e2?.svrtyCd &&
        e1?.img == e2?.img &&
        e1?.cAt == e2?.cAt &&
        e1?.reviwed == e2?.reviwed &&
        e1?.fromId == e2?.fromId &&
        e1?.toId == e2?.toId &&
        e1?.adminInd == e2?.adminInd;
  }

  @override
  int hash(AdminMsgRecord? e) => const ListEquality().hash([
        e?.eType,
        e?.msg,
        e?.svrtyCd,
        e?.img,
        e?.cAt,
        e?.reviwed,
        e?.fromId,
        e?.toId,
        e?.adminInd
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminMsgRecord;
}
