import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MsgRecord extends FirestoreRecord {
  MsgRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "from_id" field.
  String? _fromId;
  String get fromId => _fromId ?? '';
  bool hasFromId() => _fromId != null;

  // "to_id" field.
  String? _toId;
  String get toId => _toId ?? '';
  bool hasToId() => _toId != null;

  // "type_cde" field.
  int? _typeCde;
  int get typeCde => _typeCde ?? 0;
  bool hasTypeCde() => _typeCde != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  bool hasMsg() => _msg != null;

  // "e_type" field.
  String? _eType;
  String get eType => _eType ?? '';
  bool hasEType() => _eType != null;

  // "admin_ind" field.
  bool? _adminInd;
  bool get adminInd => _adminInd ?? false;
  bool hasAdminInd() => _adminInd != null;

  // "c_at" field.
  DateTime? _cAt;
  DateTime? get cAt => _cAt;
  bool hasCAt() => _cAt != null;

  // "seen_ind" field.
  bool? _seenInd;
  bool get seenInd => _seenInd ?? false;
  bool hasSeenInd() => _seenInd != null;

  void _initializeFields() {
    _fromId = snapshotData['from_id'] as String?;
    _toId = snapshotData['to_id'] as String?;
    _typeCde = castToType<int>(snapshotData['type_cde']);
    _msg = snapshotData['msg'] as String?;
    _eType = snapshotData['e_type'] as String?;
    _adminInd = snapshotData['admin_ind'] as bool?;
    _cAt = snapshotData['c_at'] as DateTime?;
    _seenInd = snapshotData['seen_ind'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('msg');

  static Stream<MsgRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MsgRecord.fromSnapshot(s));

  static Future<MsgRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MsgRecord.fromSnapshot(s));

  static MsgRecord fromSnapshot(DocumentSnapshot snapshot) => MsgRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MsgRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MsgRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MsgRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MsgRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMsgRecordData({
  String? fromId,
  String? toId,
  int? typeCde,
  String? msg,
  String? eType,
  bool? adminInd,
  DateTime? cAt,
  bool? seenInd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'from_id': fromId,
      'to_id': toId,
      'type_cde': typeCde,
      'msg': msg,
      'e_type': eType,
      'admin_ind': adminInd,
      'c_at': cAt,
      'seen_ind': seenInd,
    }.withoutNulls,
  );

  return firestoreData;
}

class MsgRecordDocumentEquality implements Equality<MsgRecord> {
  const MsgRecordDocumentEquality();

  @override
  bool equals(MsgRecord? e1, MsgRecord? e2) {
    return e1?.fromId == e2?.fromId &&
        e1?.toId == e2?.toId &&
        e1?.typeCde == e2?.typeCde &&
        e1?.msg == e2?.msg &&
        e1?.eType == e2?.eType &&
        e1?.adminInd == e2?.adminInd &&
        e1?.cAt == e2?.cAt &&
        e1?.seenInd == e2?.seenInd;
  }

  @override
  int hash(MsgRecord? e) => const ListEquality().hash([
        e?.fromId,
        e?.toId,
        e?.typeCde,
        e?.msg,
        e?.eType,
        e?.adminInd,
        e?.cAt,
        e?.seenInd
      ]);

  @override
  bool isValidKey(Object? o) => o is MsgRecord;
}
