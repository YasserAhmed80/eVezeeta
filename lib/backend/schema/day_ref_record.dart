import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayRefRecord extends FirestoreRecord {
  DayRefRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "day_key" field.
  int? _dayKey;
  int get dayKey => _dayKey ?? 0;
  bool hasDayKey() => _dayKey != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  bool hasSeq() => _seq != null;

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  bool hasLngCde() => _lngCde != null;

  // "desc_eng" field.
  String? _descEng;
  String get descEng => _descEng ?? '';
  bool hasDescEng() => _descEng != null;

  void _initializeFields() {
    _dayKey = castToType<int>(snapshotData['day_key']);
    _desc = snapshotData['desc'] as String?;
    _seq = castToType<int>(snapshotData['seq']);
    _lngCde = castToType<int>(snapshotData['lng_cde']);
    _descEng = snapshotData['desc_eng'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('day_ref');

  static Stream<DayRefRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DayRefRecord.fromSnapshot(s));

  static Future<DayRefRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DayRefRecord.fromSnapshot(s));

  static DayRefRecord fromSnapshot(DocumentSnapshot snapshot) => DayRefRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DayRefRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DayRefRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DayRefRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DayRefRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDayRefRecordData({
  int? dayKey,
  String? desc,
  int? seq,
  int? lngCde,
  String? descEng,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day_key': dayKey,
      'desc': desc,
      'seq': seq,
      'lng_cde': lngCde,
      'desc_eng': descEng,
    }.withoutNulls,
  );

  return firestoreData;
}

class DayRefRecordDocumentEquality implements Equality<DayRefRecord> {
  const DayRefRecordDocumentEquality();

  @override
  bool equals(DayRefRecord? e1, DayRefRecord? e2) {
    return e1?.dayKey == e2?.dayKey &&
        e1?.desc == e2?.desc &&
        e1?.seq == e2?.seq &&
        e1?.lngCde == e2?.lngCde &&
        e1?.descEng == e2?.descEng;
  }

  @override
  int hash(DayRefRecord? e) => const ListEquality()
      .hash([e?.dayKey, e?.desc, e?.seq, e?.lngCde, e?.descEng]);

  @override
  bool isValidKey(Object? o) => o is DayRefRecord;
}
