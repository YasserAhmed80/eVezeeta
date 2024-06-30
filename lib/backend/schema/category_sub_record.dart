import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategorySubRecord extends FirestoreRecord {
  CategorySubRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sub_key" field.
  int? _subKey;
  int get subKey => _subKey ?? 0;
  bool hasSubKey() => _subKey != null;

  // "cat_cde" field.
  int? _catCde;
  int get catCde => _catCde ?? 0;
  bool hasCatCde() => _catCde != null;

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
    _subKey = castToType<int>(snapshotData['sub_key']);
    _catCde = castToType<int>(snapshotData['cat_cde']);
    _desc = snapshotData['desc'] as String?;
    _lngCde = castToType<int>(snapshotData['lng_cde']);
    _seq = castToType<int>(snapshotData['seq']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category_sub');

  static Stream<CategorySubRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategorySubRecord.fromSnapshot(s));

  static Future<CategorySubRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategorySubRecord.fromSnapshot(s));

  static CategorySubRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategorySubRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategorySubRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategorySubRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategorySubRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategorySubRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategorySubRecordData({
  int? subKey,
  int? catCde,
  String? desc,
  int? lngCde,
  int? seq,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sub_key': subKey,
      'cat_cde': catCde,
      'desc': desc,
      'lng_cde': lngCde,
      'seq': seq,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategorySubRecordDocumentEquality implements Equality<CategorySubRecord> {
  const CategorySubRecordDocumentEquality();

  @override
  bool equals(CategorySubRecord? e1, CategorySubRecord? e2) {
    return e1?.subKey == e2?.subKey &&
        e1?.catCde == e2?.catCde &&
        e1?.desc == e2?.desc &&
        e1?.lngCde == e2?.lngCde &&
        e1?.seq == e2?.seq;
  }

  @override
  int hash(CategorySubRecord? e) => const ListEquality()
      .hash([e?.subKey, e?.catCde, e?.desc, e?.lngCde, e?.seq]);

  @override
  bool isValidKey(Object? o) => o is CategorySubRecord;
}
