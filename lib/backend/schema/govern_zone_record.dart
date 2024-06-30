import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GovernZoneRecord extends FirestoreRecord {
  GovernZoneRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "zone_key" field.
  int? _zoneKey;
  int get zoneKey => _zoneKey ?? 0;
  bool hasZoneKey() => _zoneKey != null;

  // "govern_cde" field.
  int? _governCde;
  int get governCde => _governCde ?? 0;
  bool hasGovernCde() => _governCde != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  bool hasLngCde() => _lngCde != null;

  void _initializeFields() {
    _zoneKey = castToType<int>(snapshotData['zone_key']);
    _governCde = castToType<int>(snapshotData['govern_cde']);
    _desc = snapshotData['desc'] as String?;
    _lngCde = castToType<int>(snapshotData['lng_cde']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('govern_zone');

  static Stream<GovernZoneRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GovernZoneRecord.fromSnapshot(s));

  static Future<GovernZoneRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GovernZoneRecord.fromSnapshot(s));

  static GovernZoneRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GovernZoneRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GovernZoneRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GovernZoneRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GovernZoneRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GovernZoneRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGovernZoneRecordData({
  int? zoneKey,
  int? governCde,
  String? desc,
  int? lngCde,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'zone_key': zoneKey,
      'govern_cde': governCde,
      'desc': desc,
      'lng_cde': lngCde,
    }.withoutNulls,
  );

  return firestoreData;
}

class GovernZoneRecordDocumentEquality implements Equality<GovernZoneRecord> {
  const GovernZoneRecordDocumentEquality();

  @override
  bool equals(GovernZoneRecord? e1, GovernZoneRecord? e2) {
    return e1?.zoneKey == e2?.zoneKey &&
        e1?.governCde == e2?.governCde &&
        e1?.desc == e2?.desc &&
        e1?.lngCde == e2?.lngCde;
  }

  @override
  int hash(GovernZoneRecord? e) =>
      const ListEquality().hash([e?.zoneKey, e?.governCde, e?.desc, e?.lngCde]);

  @override
  bool isValidKey(Object? o) => o is GovernZoneRecord;
}
