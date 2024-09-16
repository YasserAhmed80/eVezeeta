import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GovernateRecord extends FirestoreRecord {
  GovernateRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "gov_key" field.
  int? _govKey;
  int get govKey => _govKey ?? 0;
  bool hasGovKey() => _govKey != null;

  // "cntry_cde" field.
  int? _cntryCde;
  int get cntryCde => _cntryCde ?? 0;
  bool hasCntryCde() => _cntryCde != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  bool hasLngCde() => _lngCde != null;

  void _initializeFields() {
    _govKey = castToType<int>(snapshotData['gov_key']);
    _cntryCde = castToType<int>(snapshotData['cntry_cde']);
    _desc = snapshotData['desc'] as String?;
    _lngCde = castToType<int>(snapshotData['lng_cde']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('governate');

  static Stream<GovernateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GovernateRecord.fromSnapshot(s));

  static Future<GovernateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GovernateRecord.fromSnapshot(s));

  static GovernateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GovernateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GovernateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GovernateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GovernateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GovernateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGovernateRecordData({
  int? govKey,
  int? cntryCde,
  String? desc,
  int? lngCde,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gov_key': govKey,
      'cntry_cde': cntryCde,
      'desc': desc,
      'lng_cde': lngCde,
    }.withoutNulls,
  );

  return firestoreData;
}

class GovernateRecordDocumentEquality implements Equality<GovernateRecord> {
  const GovernateRecordDocumentEquality();

  @override
  bool equals(GovernateRecord? e1, GovernateRecord? e2) {
    return e1?.govKey == e2?.govKey &&
        e1?.cntryCde == e2?.cntryCde &&
        e1?.desc == e2?.desc &&
        e1?.lngCde == e2?.lngCde;
  }

  @override
  int hash(GovernateRecord? e) =>
      const ListEquality().hash([e?.govKey, e?.cntryCde, e?.desc, e?.lngCde]);

  @override
  bool isValidKey(Object? o) => o is GovernateRecord;
}
