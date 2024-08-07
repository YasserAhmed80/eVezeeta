import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocSubRecord extends FirestoreRecord {
  DocSubRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "doc_id" field.
  String? _docId;
  String get docId => _docId ?? '';
  bool hasDocId() => _docId != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "fee" field.
  int? _fee;
  int get fee => _fee ?? 0;
  bool hasFee() => _fee != null;

  // "f_date" field.
  DateTime? _fDate;
  DateTime? get fDate => _fDate;
  bool hasFDate() => _fDate != null;

  // "t_date" field.
  DateTime? _tDate;
  DateTime? get tDate => _tDate;
  bool hasTDate() => _tDate != null;

  // "method" field.
  int? _method;
  int get method => _method ?? 0;
  bool hasMethod() => _method != null;

  // "capoun" field.
  String? _capoun;
  String get capoun => _capoun ?? '';
  bool hasCapoun() => _capoun != null;

  // "pay_ref" field.
  String? _payRef;
  String get payRef => _payRef ?? '';
  bool hasPayRef() => _payRef != null;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  bool hasDiscount() => _discount != null;

  void _initializeFields() {
    _docId = snapshotData['doc_id'] as String?;
    _amount = castToType<int>(snapshotData['amount']);
    _fee = castToType<int>(snapshotData['fee']);
    _fDate = snapshotData['f_date'] as DateTime?;
    _tDate = snapshotData['t_date'] as DateTime?;
    _method = castToType<int>(snapshotData['method']);
    _capoun = snapshotData['capoun'] as String?;
    _payRef = snapshotData['pay_ref'] as String?;
    _discount = castToType<int>(snapshotData['discount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doc_sub');

  static Stream<DocSubRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocSubRecord.fromSnapshot(s));

  static Future<DocSubRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocSubRecord.fromSnapshot(s));

  static DocSubRecord fromSnapshot(DocumentSnapshot snapshot) => DocSubRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocSubRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocSubRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocSubRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocSubRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocSubRecordData({
  String? docId,
  int? amount,
  int? fee,
  DateTime? fDate,
  DateTime? tDate,
  int? method,
  String? capoun,
  String? payRef,
  int? discount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doc_id': docId,
      'amount': amount,
      'fee': fee,
      'f_date': fDate,
      't_date': tDate,
      'method': method,
      'capoun': capoun,
      'pay_ref': payRef,
      'discount': discount,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocSubRecordDocumentEquality implements Equality<DocSubRecord> {
  const DocSubRecordDocumentEquality();

  @override
  bool equals(DocSubRecord? e1, DocSubRecord? e2) {
    return e1?.docId == e2?.docId &&
        e1?.amount == e2?.amount &&
        e1?.fee == e2?.fee &&
        e1?.fDate == e2?.fDate &&
        e1?.tDate == e2?.tDate &&
        e1?.method == e2?.method &&
        e1?.capoun == e2?.capoun &&
        e1?.payRef == e2?.payRef &&
        e1?.discount == e2?.discount;
  }

  @override
  int hash(DocSubRecord? e) => const ListEquality().hash([
        e?.docId,
        e?.amount,
        e?.fee,
        e?.fDate,
        e?.tDate,
        e?.method,
        e?.capoun,
        e?.payRef,
        e?.discount
      ]);

  @override
  bool isValidKey(Object? o) => o is DocSubRecord;
}
