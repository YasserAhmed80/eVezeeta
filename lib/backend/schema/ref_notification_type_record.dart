import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefNotificationTypeRecord extends FirestoreRecord {
  RefNotificationTypeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "key" field.
  int? _key;
  int get key => _key ?? 0;
  bool hasKey() => _key != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "severty_cde" field.
  int? _severtyCde;
  int get severtyCde => _severtyCde ?? 0;
  bool hasSevertyCde() => _severtyCde != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _key = castToType<int>(snapshotData['key']);
    _desc = snapshotData['desc'] as String?;
    _severtyCde = castToType<int>(snapshotData['severty_cde']);
    _color = getSchemaColor(snapshotData['color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('refNotificationType');

  static Stream<RefNotificationTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefNotificationTypeRecord.fromSnapshot(s));

  static Future<RefNotificationTypeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RefNotificationTypeRecord.fromSnapshot(s));

  static RefNotificationTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RefNotificationTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefNotificationTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefNotificationTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefNotificationTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RefNotificationTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRefNotificationTypeRecordData({
  int? key,
  String? desc,
  int? severtyCde,
  Color? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'key': key,
      'desc': desc,
      'severty_cde': severtyCde,
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class RefNotificationTypeRecordDocumentEquality
    implements Equality<RefNotificationTypeRecord> {
  const RefNotificationTypeRecordDocumentEquality();

  @override
  bool equals(RefNotificationTypeRecord? e1, RefNotificationTypeRecord? e2) {
    return e1?.key == e2?.key &&
        e1?.desc == e2?.desc &&
        e1?.severtyCde == e2?.severtyCde &&
        e1?.color == e2?.color;
  }

  @override
  int hash(RefNotificationTypeRecord? e) =>
      const ListEquality().hash([e?.key, e?.desc, e?.severtyCde, e?.color]);

  @override
  bool isValidKey(Object? o) => o is RefNotificationTypeRecord;
}
