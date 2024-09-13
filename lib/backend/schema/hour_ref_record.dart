import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HourRefRecord extends FirestoreRecord {
  HourRefRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hour_key" field.
  int? _hourKey;
  int get hourKey => _hourKey ?? 0;
  bool hasHourKey() => _hourKey != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "period" field.
  String? _period;
  String get period => _period ?? '';
  bool hasPeriod() => _period != null;

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  bool hasSeq() => _seq != null;

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  bool hasLngCde() => _lngCde != null;

  void _initializeFields() {
    _hourKey = castToType<int>(snapshotData['hour_key']);
    _desc = snapshotData['desc'] as String?;
    _period = snapshotData['period'] as String?;
    _seq = castToType<int>(snapshotData['seq']);
    _lngCde = castToType<int>(snapshotData['lng_cde']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hour_ref');

  static Stream<HourRefRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HourRefRecord.fromSnapshot(s));

  static Future<HourRefRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HourRefRecord.fromSnapshot(s));

  static HourRefRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HourRefRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HourRefRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HourRefRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HourRefRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HourRefRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHourRefRecordData({
  int? hourKey,
  String? desc,
  String? period,
  int? seq,
  int? lngCde,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hour_key': hourKey,
      'desc': desc,
      'period': period,
      'seq': seq,
      'lng_cde': lngCde,
    }.withoutNulls,
  );

  return firestoreData;
}

class HourRefRecordDocumentEquality implements Equality<HourRefRecord> {
  const HourRefRecordDocumentEquality();

  @override
  bool equals(HourRefRecord? e1, HourRefRecord? e2) {
    return e1?.hourKey == e2?.hourKey &&
        e1?.desc == e2?.desc &&
        e1?.period == e2?.period &&
        e1?.seq == e2?.seq &&
        e1?.lngCde == e2?.lngCde;
  }

  @override
  int hash(HourRefRecord? e) => const ListEquality()
      .hash([e?.hourKey, e?.desc, e?.period, e?.seq, e?.lngCde]);

  @override
  bool isValidKey(Object? o) => o is HourRefRecord;
}
