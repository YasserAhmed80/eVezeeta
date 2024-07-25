import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocBookedTimeRecord extends FirestoreRecord {
  DocBookedTimeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "doc_id" field.
  String? _docId;
  String get docId => _docId ?? '';
  bool hasDocId() => _docId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "hour" field.
  int? _hour;
  int get hour => _hour ?? 0;
  bool hasHour() => _hour != null;

  // "cus_id" field.
  String? _cusId;
  String get cusId => _cusId ?? '';
  bool hasCusId() => _cusId != null;

  // "hour_seq" field.
  int? _hourSeq;
  int get hourSeq => _hourSeq ?? 0;
  bool hasHourSeq() => _hourSeq != null;

  // "day_time" field.
  DateTime? _dayTime;
  DateTime? get dayTime => _dayTime;
  bool hasDayTime() => _dayTime != null;

  void _initializeFields() {
    _docId = snapshotData['doc_id'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _hour = castToType<int>(snapshotData['hour']);
    _cusId = snapshotData['cus_id'] as String?;
    _hourSeq = castToType<int>(snapshotData['hour_seq']);
    _dayTime = snapshotData['day_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doc_booked_time');

  static Stream<DocBookedTimeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocBookedTimeRecord.fromSnapshot(s));

  static Future<DocBookedTimeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocBookedTimeRecord.fromSnapshot(s));

  static DocBookedTimeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocBookedTimeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocBookedTimeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocBookedTimeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocBookedTimeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocBookedTimeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocBookedTimeRecordData({
  String? docId,
  DateTime? date,
  int? hour,
  String? cusId,
  int? hourSeq,
  DateTime? dayTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doc_id': docId,
      'date': date,
      'hour': hour,
      'cus_id': cusId,
      'hour_seq': hourSeq,
      'day_time': dayTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocBookedTimeRecordDocumentEquality
    implements Equality<DocBookedTimeRecord> {
  const DocBookedTimeRecordDocumentEquality();

  @override
  bool equals(DocBookedTimeRecord? e1, DocBookedTimeRecord? e2) {
    return e1?.docId == e2?.docId &&
        e1?.date == e2?.date &&
        e1?.hour == e2?.hour &&
        e1?.cusId == e2?.cusId &&
        e1?.hourSeq == e2?.hourSeq &&
        e1?.dayTime == e2?.dayTime;
  }

  @override
  int hash(DocBookedTimeRecord? e) => const ListEquality()
      .hash([e?.docId, e?.date, e?.hour, e?.cusId, e?.hourSeq, e?.dayTime]);

  @override
  bool isValidKey(Object? o) => o is DocBookedTimeRecord;
}
