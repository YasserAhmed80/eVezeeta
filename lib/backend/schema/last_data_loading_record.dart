import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LastDataLoadingRecord extends FirestoreRecord {
  LastDataLoadingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "city_date" field.
  DateTime? _cityDate;
  DateTime? get cityDate => _cityDate;
  bool hasCityDate() => _cityDate != null;

  // "category_date" field.
  DateTime? _categoryDate;
  DateTime? get categoryDate => _categoryDate;
  bool hasCategoryDate() => _categoryDate != null;

  // "days_date" field.
  DateTime? _daysDate;
  DateTime? get daysDate => _daysDate;
  bool hasDaysDate() => _daysDate != null;

  void _initializeFields() {
    _cityDate = snapshotData['city_date'] as DateTime?;
    _categoryDate = snapshotData['category_date'] as DateTime?;
    _daysDate = snapshotData['days_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('last_data_loading');

  static Stream<LastDataLoadingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LastDataLoadingRecord.fromSnapshot(s));

  static Future<LastDataLoadingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LastDataLoadingRecord.fromSnapshot(s));

  static LastDataLoadingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LastDataLoadingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LastDataLoadingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LastDataLoadingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LastDataLoadingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LastDataLoadingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLastDataLoadingRecordData({
  DateTime? cityDate,
  DateTime? categoryDate,
  DateTime? daysDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city_date': cityDate,
      'category_date': categoryDate,
      'days_date': daysDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class LastDataLoadingRecordDocumentEquality
    implements Equality<LastDataLoadingRecord> {
  const LastDataLoadingRecordDocumentEquality();

  @override
  bool equals(LastDataLoadingRecord? e1, LastDataLoadingRecord? e2) {
    return e1?.cityDate == e2?.cityDate &&
        e1?.categoryDate == e2?.categoryDate &&
        e1?.daysDate == e2?.daysDate;
  }

  @override
  int hash(LastDataLoadingRecord? e) =>
      const ListEquality().hash([e?.cityDate, e?.categoryDate, e?.daysDate]);

  @override
  bool isValidKey(Object? o) => o is LastDataLoadingRecord;
}
