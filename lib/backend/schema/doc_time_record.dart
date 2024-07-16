import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocTimeRecord extends FirestoreRecord {
  DocTimeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "doc_id" field.
  String? _docId;
  String get docId => _docId ?? '';
  bool hasDocId() => _docId != null;

  // "day_id" field.
  int? _dayId;
  int get dayId => _dayId ?? 0;
  bool hasDayId() => _dayId != null;

  // "hrs_id" field.
  List<int>? _hrsId;
  List<int> get hrsId => _hrsId ?? const [];
  bool hasHrsId() => _hrsId != null;

  void _initializeFields() {
    _docId = snapshotData['doc_id'] as String?;
    _dayId = castToType<int>(snapshotData['day_id']);
    _hrsId = getDataList(snapshotData['hrs_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doc_time');

  static Stream<DocTimeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocTimeRecord.fromSnapshot(s));

  static Future<DocTimeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocTimeRecord.fromSnapshot(s));

  static DocTimeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocTimeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocTimeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocTimeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocTimeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocTimeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocTimeRecordData({
  String? docId,
  int? dayId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doc_id': docId,
      'day_id': dayId,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocTimeRecordDocumentEquality implements Equality<DocTimeRecord> {
  const DocTimeRecordDocumentEquality();

  @override
  bool equals(DocTimeRecord? e1, DocTimeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.docId == e2?.docId &&
        e1?.dayId == e2?.dayId &&
        listEquality.equals(e1?.hrsId, e2?.hrsId);
  }

  @override
  int hash(DocTimeRecord? e) =>
      const ListEquality().hash([e?.docId, e?.dayId, e?.hrsId]);

  @override
  bool isValidKey(Object? o) => o is DocTimeRecord;
}
