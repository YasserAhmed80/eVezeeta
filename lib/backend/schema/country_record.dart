import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountryRecord extends FirestoreRecord {
  CountryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "c_key" field.
  int? _cKey;
  int get cKey => _cKey ?? 0;
  bool hasCKey() => _cKey != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  bool hasLngCde() => _lngCde != null;

  void _initializeFields() {
    _cKey = castToType<int>(snapshotData['c_key']);
    _desc = snapshotData['desc'] as String?;
    _lngCde = castToType<int>(snapshotData['lng_cde']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('country');

  static Stream<CountryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountryRecord.fromSnapshot(s));

  static Future<CountryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountryRecord.fromSnapshot(s));

  static CountryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountryRecordData({
  int? cKey,
  String? desc,
  int? lngCde,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'c_key': cKey,
      'desc': desc,
      'lng_cde': lngCde,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountryRecordDocumentEquality implements Equality<CountryRecord> {
  const CountryRecordDocumentEquality();

  @override
  bool equals(CountryRecord? e1, CountryRecord? e2) {
    return e1?.cKey == e2?.cKey &&
        e1?.desc == e2?.desc &&
        e1?.lngCde == e2?.lngCde;
  }

  @override
  int hash(CountryRecord? e) =>
      const ListEquality().hash([e?.cKey, e?.desc, e?.lngCde]);

  @override
  bool isValidKey(Object? o) => o is CountryRecord;
}
