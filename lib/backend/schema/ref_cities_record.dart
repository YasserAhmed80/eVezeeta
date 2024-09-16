import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefCitiesRecord extends FirestoreRecord {
  RefCitiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "lng" field.
  int? _lng;
  int get lng => _lng ?? 0;
  bool hasLng() => _lng != null;

  // "country_cde" field.
  int? _countryCde;
  int get countryCde => _countryCde ?? 0;
  bool hasCountryCde() => _countryCde != null;

  void _initializeFields() {
    _code = castToType<int>(snapshotData['code']);
    _desc = snapshotData['desc'] as String?;
    _lng = castToType<int>(snapshotData['lng']);
    _countryCde = castToType<int>(snapshotData['country_cde']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ref_cities');

  static Stream<RefCitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefCitiesRecord.fromSnapshot(s));

  static Future<RefCitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RefCitiesRecord.fromSnapshot(s));

  static RefCitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RefCitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefCitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefCitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefCitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RefCitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRefCitiesRecordData({
  int? code,
  String? desc,
  int? lng,
  int? countryCde,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'desc': desc,
      'lng': lng,
      'country_cde': countryCde,
    }.withoutNulls,
  );

  return firestoreData;
}

class RefCitiesRecordDocumentEquality implements Equality<RefCitiesRecord> {
  const RefCitiesRecordDocumentEquality();

  @override
  bool equals(RefCitiesRecord? e1, RefCitiesRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.desc == e2?.desc &&
        e1?.lng == e2?.lng &&
        e1?.countryCde == e2?.countryCde;
  }

  @override
  int hash(RefCitiesRecord? e) =>
      const ListEquality().hash([e?.code, e?.desc, e?.lng, e?.countryCde]);

  @override
  bool isValidKey(Object? o) => o is RefCitiesRecord;
}
