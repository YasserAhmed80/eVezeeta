import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SequencesRefRecord extends FirestoreRecord {
  SequencesRefRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "doc_seq" field.
  int? _docSeq;
  int get docSeq => _docSeq ?? 0;
  bool hasDocSeq() => _docSeq != null;

  // "cus_seq" field.
  int? _cusSeq;
  int get cusSeq => _cusSeq ?? 0;
  bool hasCusSeq() => _cusSeq != null;

  void _initializeFields() {
    _docSeq = castToType<int>(snapshotData['doc_seq']);
    _cusSeq = castToType<int>(snapshotData['cus_seq']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sequencesRef');

  static Stream<SequencesRefRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SequencesRefRecord.fromSnapshot(s));

  static Future<SequencesRefRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SequencesRefRecord.fromSnapshot(s));

  static SequencesRefRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SequencesRefRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SequencesRefRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SequencesRefRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SequencesRefRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SequencesRefRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSequencesRefRecordData({
  int? docSeq,
  int? cusSeq,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doc_seq': docSeq,
      'cus_seq': cusSeq,
    }.withoutNulls,
  );

  return firestoreData;
}

class SequencesRefRecordDocumentEquality
    implements Equality<SequencesRefRecord> {
  const SequencesRefRecordDocumentEquality();

  @override
  bool equals(SequencesRefRecord? e1, SequencesRefRecord? e2) {
    return e1?.docSeq == e2?.docSeq && e1?.cusSeq == e2?.cusSeq;
  }

  @override
  int hash(SequencesRefRecord? e) =>
      const ListEquality().hash([e?.docSeq, e?.cusSeq]);

  @override
  bool isValidKey(Object? o) => o is SequencesRefRecord;
}
