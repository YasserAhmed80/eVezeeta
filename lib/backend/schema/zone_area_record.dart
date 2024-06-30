import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ZoneAreaRecord extends FirestoreRecord {
  ZoneAreaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "area_key" field.
  int? _areaKey;
  int get areaKey => _areaKey ?? 0;
  bool hasAreaKey() => _areaKey != null;

  // "zone_cde" field.
  int? _zoneCde;
  int get zoneCde => _zoneCde ?? 0;
  bool hasZoneCde() => _zoneCde != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  bool hasLngCde() => _lngCde != null;

  void _initializeFields() {
    _areaKey = castToType<int>(snapshotData['area_key']);
    _zoneCde = castToType<int>(snapshotData['zone_cde']);
    _desc = snapshotData['desc'] as String?;
    _lngCde = castToType<int>(snapshotData['lng_cde']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('zone_area');

  static Stream<ZoneAreaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ZoneAreaRecord.fromSnapshot(s));

  static Future<ZoneAreaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ZoneAreaRecord.fromSnapshot(s));

  static ZoneAreaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ZoneAreaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ZoneAreaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ZoneAreaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ZoneAreaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ZoneAreaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createZoneAreaRecordData({
  int? areaKey,
  int? zoneCde,
  String? desc,
  int? lngCde,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'area_key': areaKey,
      'zone_cde': zoneCde,
      'desc': desc,
      'lng_cde': lngCde,
    }.withoutNulls,
  );

  return firestoreData;
}

class ZoneAreaRecordDocumentEquality implements Equality<ZoneAreaRecord> {
  const ZoneAreaRecordDocumentEquality();

  @override
  bool equals(ZoneAreaRecord? e1, ZoneAreaRecord? e2) {
    return e1?.areaKey == e2?.areaKey &&
        e1?.zoneCde == e2?.zoneCde &&
        e1?.desc == e2?.desc &&
        e1?.lngCde == e2?.lngCde;
  }

  @override
  int hash(ZoneAreaRecord? e) =>
      const ListEquality().hash([e?.areaKey, e?.zoneCde, e?.desc, e?.lngCde]);

  @override
  bool isValidKey(Object? o) => o is ZoneAreaRecord;
}
