import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionFeesRecord extends FirestoreRecord {
  SubscriptionFeesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "monthly_cost" field.
  int? _monthlyCost;
  int get monthlyCost => _monthlyCost ?? 0;
  bool hasMonthlyCost() => _monthlyCost != null;

  // "book_fee" field.
  int? _bookFee;
  int get bookFee => _bookFee ?? 0;
  bool hasBookFee() => _bookFee != null;

  void _initializeFields() {
    _monthlyCost = castToType<int>(snapshotData['monthly_cost']);
    _bookFee = castToType<int>(snapshotData['book_fee']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscription_fees');

  static Stream<SubscriptionFeesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionFeesRecord.fromSnapshot(s));

  static Future<SubscriptionFeesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SubscriptionFeesRecord.fromSnapshot(s));

  static SubscriptionFeesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionFeesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionFeesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionFeesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionFeesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionFeesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionFeesRecordData({
  int? monthlyCost,
  int? bookFee,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'monthly_cost': monthlyCost,
      'book_fee': bookFee,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionFeesRecordDocumentEquality
    implements Equality<SubscriptionFeesRecord> {
  const SubscriptionFeesRecordDocumentEquality();

  @override
  bool equals(SubscriptionFeesRecord? e1, SubscriptionFeesRecord? e2) {
    return e1?.monthlyCost == e2?.monthlyCost && e1?.bookFee == e2?.bookFee;
  }

  @override
  int hash(SubscriptionFeesRecord? e) =>
      const ListEquality().hash([e?.monthlyCost, e?.bookFee]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionFeesRecord;
}
