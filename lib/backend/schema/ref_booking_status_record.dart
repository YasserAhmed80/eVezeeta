import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefBookingStatusRecord extends FirestoreRecord {
  RefBookingStatusRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  bool hasLngCde() => _lngCde != null;

  void _initializeFields() {
    _key = castToType<int>(snapshotData['key']);
    _desc = snapshotData['desc'] as String?;
    _lngCde = castToType<int>(snapshotData['lng_cde']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ref_booking_status');

  static Stream<RefBookingStatusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefBookingStatusRecord.fromSnapshot(s));

  static Future<RefBookingStatusRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RefBookingStatusRecord.fromSnapshot(s));

  static RefBookingStatusRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RefBookingStatusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefBookingStatusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefBookingStatusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefBookingStatusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RefBookingStatusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRefBookingStatusRecordData({
  int? key,
  String? desc,
  int? lngCde,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'key': key,
      'desc': desc,
      'lng_cde': lngCde,
    }.withoutNulls,
  );

  return firestoreData;
}

class RefBookingStatusRecordDocumentEquality
    implements Equality<RefBookingStatusRecord> {
  const RefBookingStatusRecordDocumentEquality();

  @override
  bool equals(RefBookingStatusRecord? e1, RefBookingStatusRecord? e2) {
    return e1?.key == e2?.key &&
        e1?.desc == e2?.desc &&
        e1?.lngCde == e2?.lngCde;
  }

  @override
  int hash(RefBookingStatusRecord? e) =>
      const ListEquality().hash([e?.key, e?.desc, e?.lngCde]);

  @override
  bool isValidKey(Object? o) => o is RefBookingStatusRecord;
}
