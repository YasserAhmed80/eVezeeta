import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cat_key" field.
  int? _catKey;
  int get catKey => _catKey ?? 0;
  bool hasCatKey() => _catKey != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "lng_cde" field.
  int? _lngCde;
  int get lngCde => _lngCde ?? 0;
  bool hasLngCde() => _lngCde != null;

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  bool hasSeq() => _seq != null;

  void _initializeFields() {
    _catKey = castToType<int>(snapshotData['cat_key']);
    _desc = snapshotData['desc'] as String?;
    _lngCde = castToType<int>(snapshotData['lng_cde']);
    _seq = castToType<int>(snapshotData['seq']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryRecordData({
  int? catKey,
  String? desc,
  int? lngCde,
  int? seq,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cat_key': catKey,
      'desc': desc,
      'lng_cde': lngCde,
      'seq': seq,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryRecordDocumentEquality implements Equality<CategoryRecord> {
  const CategoryRecordDocumentEquality();

  @override
  bool equals(CategoryRecord? e1, CategoryRecord? e2) {
    return e1?.catKey == e2?.catKey &&
        e1?.desc == e2?.desc &&
        e1?.lngCde == e2?.lngCde &&
        e1?.seq == e2?.seq;
  }

  @override
  int hash(CategoryRecord? e) =>
      const ListEquality().hash([e?.catKey, e?.desc, e?.lngCde, e?.seq]);

  @override
  bool isValidKey(Object? o) => o is CategoryRecord;
}
