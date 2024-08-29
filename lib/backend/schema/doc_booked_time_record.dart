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

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "hour" field.
  int? _hour;
  int get hour => _hour ?? 0;
  bool hasHour() => _hour != null;

  // "hour_seq" field.
  int? _hourSeq;
  int get hourSeq => _hourSeq ?? 0;
  bool hasHourSeq() => _hourSeq != null;

  // "day_time" field.
  DateTime? _dayTime;
  DateTime? get dayTime => _dayTime;
  bool hasDayTime() => _dayTime != null;

  // "status_cde" field.
  int? _statusCde;
  int get statusCde => _statusCde ?? 0;
  bool hasStatusCde() => _statusCde != null;

  // "c_reason" field.
  String? _cReason;
  String get cReason => _cReason ?? '';
  bool hasCReason() => _cReason != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "fee" field.
  int? _fee;
  int get fee => _fee ?? 0;
  bool hasFee() => _fee != null;

  // "cus_ref" field.
  DocumentReference? _cusRef;
  DocumentReference? get cusRef => _cusRef;
  bool hasCusRef() => _cusRef != null;

  // "doc_ref" field.
  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  bool hasDocRef() => _docRef != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _hour = castToType<int>(snapshotData['hour']);
    _hourSeq = castToType<int>(snapshotData['hour_seq']);
    _dayTime = snapshotData['day_time'] as DateTime?;
    _statusCde = castToType<int>(snapshotData['status_cde']);
    _cReason = snapshotData['c_reason'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _fee = castToType<int>(snapshotData['fee']);
    _cusRef = snapshotData['cus_ref'] as DocumentReference?;
    _docRef = snapshotData['doc_ref'] as DocumentReference?;
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
  DateTime? date,
  int? hour,
  int? hourSeq,
  DateTime? dayTime,
  int? statusCde,
  String? cReason,
  int? price,
  int? fee,
  DocumentReference? cusRef,
  DocumentReference? docRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'hour': hour,
      'hour_seq': hourSeq,
      'day_time': dayTime,
      'status_cde': statusCde,
      'c_reason': cReason,
      'price': price,
      'fee': fee,
      'cus_ref': cusRef,
      'doc_ref': docRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocBookedTimeRecordDocumentEquality
    implements Equality<DocBookedTimeRecord> {
  const DocBookedTimeRecordDocumentEquality();

  @override
  bool equals(DocBookedTimeRecord? e1, DocBookedTimeRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.hour == e2?.hour &&
        e1?.hourSeq == e2?.hourSeq &&
        e1?.dayTime == e2?.dayTime &&
        e1?.statusCde == e2?.statusCde &&
        e1?.cReason == e2?.cReason &&
        e1?.price == e2?.price &&
        e1?.fee == e2?.fee &&
        e1?.cusRef == e2?.cusRef &&
        e1?.docRef == e2?.docRef;
  }

  @override
  int hash(DocBookedTimeRecord? e) => const ListEquality().hash([
        e?.date,
        e?.hour,
        e?.hourSeq,
        e?.dayTime,
        e?.statusCde,
        e?.cReason,
        e?.price,
        e?.fee,
        e?.cusRef,
        e?.docRef
      ]);

  @override
  bool isValidKey(Object? o) => o is DocBookedTimeRecord;
}
