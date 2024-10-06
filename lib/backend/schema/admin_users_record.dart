import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminUsersRecord extends FirestoreRecord {
  AdminUsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "key" field.
  int? _key;
  int get key => _key ?? 0;
  bool hasKey() => _key != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "log_user_id" field.
  String? _logUserId;
  String get logUserId => _logUserId ?? '';
  bool hasLogUserId() => _logUserId != null;

  // "role_key" field.
  int? _roleKey;
  int get roleKey => _roleKey ?? 0;
  bool hasRoleKey() => _roleKey != null;

  // "active_ind" field.
  bool? _activeInd;
  bool get activeInd => _activeInd ?? false;
  bool hasActiveInd() => _activeInd != null;

  // "c_at" field.
  DateTime? _cAt;
  DateTime? get cAt => _cAt;
  bool hasCAt() => _cAt != null;

  void _initializeFields() {
    _key = castToType<int>(snapshotData['key']);
    _name = snapshotData['name'] as String?;
    _logUserId = snapshotData['log_user_id'] as String?;
    _roleKey = castToType<int>(snapshotData['role_key']);
    _activeInd = snapshotData['active_ind'] as bool?;
    _cAt = snapshotData['c_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admin_users');

  static Stream<AdminUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminUsersRecord.fromSnapshot(s));

  static Future<AdminUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminUsersRecord.fromSnapshot(s));

  static AdminUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminUsersRecordData({
  int? key,
  String? name,
  String? logUserId,
  int? roleKey,
  bool? activeInd,
  DateTime? cAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'key': key,
      'name': name,
      'log_user_id': logUserId,
      'role_key': roleKey,
      'active_ind': activeInd,
      'c_at': cAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminUsersRecordDocumentEquality implements Equality<AdminUsersRecord> {
  const AdminUsersRecordDocumentEquality();

  @override
  bool equals(AdminUsersRecord? e1, AdminUsersRecord? e2) {
    return e1?.key == e2?.key &&
        e1?.name == e2?.name &&
        e1?.logUserId == e2?.logUserId &&
        e1?.roleKey == e2?.roleKey &&
        e1?.activeInd == e2?.activeInd &&
        e1?.cAt == e2?.cAt;
  }

  @override
  int hash(AdminUsersRecord? e) => const ListEquality()
      .hash([e?.key, e?.name, e?.logUserId, e?.roleKey, e?.activeInd, e?.cAt]);

  @override
  bool isValidKey(Object? o) => o is AdminUsersRecord;
}
