import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefDataRecord extends FirestoreRecord {
  RefDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "lng" field.
  int? _lng;
  int get lng => _lng ?? 0;
  bool hasLng() => _lng != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  void _initializeFields() {
    _desc = snapshotData['desc'] as String?;
    _lng = castToType<int>(snapshotData['lng']);
    _code = castToType<int>(snapshotData['code']);
    _source = snapshotData['source'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ref_data');

  static Stream<RefDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefDataRecord.fromSnapshot(s));

  static Future<RefDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RefDataRecord.fromSnapshot(s));

  static RefDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RefDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RefDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRefDataRecordData({
  String? desc,
  int? lng,
  int? code,
  String? source,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'desc': desc,
      'lng': lng,
      'code': code,
      'source': source,
    }.withoutNulls,
  );

  return firestoreData;
}

class RefDataRecordDocumentEquality implements Equality<RefDataRecord> {
  const RefDataRecordDocumentEquality();

  @override
  bool equals(RefDataRecord? e1, RefDataRecord? e2) {
    return e1?.desc == e2?.desc &&
        e1?.lng == e2?.lng &&
        e1?.code == e2?.code &&
        e1?.source == e2?.source;
  }

  @override
  int hash(RefDataRecord? e) =>
      const ListEquality().hash([e?.desc, e?.lng, e?.code, e?.source]);

  @override
  bool isValidKey(Object? o) => o is RefDataRecord;
}
