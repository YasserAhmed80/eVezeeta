import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocNotifyRecord extends FirestoreRecord {
  DocNotifyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "notify_cnt" field.
  int? _notifyCnt;
  int get notifyCnt => _notifyCnt ?? 0;
  bool hasNotifyCnt() => _notifyCnt != null;

  // "msg_cnt" field.
  int? _msgCnt;
  int get msgCnt => _msgCnt ?? 0;
  bool hasMsgCnt() => _msgCnt != null;

  // "news_cnt" field.
  int? _newsCnt;
  int get newsCnt => _newsCnt ?? 0;
  bool hasNewsCnt() => _newsCnt != null;

  // "book_cnt" field.
  int? _bookCnt;
  int get bookCnt => _bookCnt ?? 0;
  bool hasBookCnt() => _bookCnt != null;

  // "last_seen" field.
  DateTime? _lastSeen;
  DateTime? get lastSeen => _lastSeen;
  bool hasLastSeen() => _lastSeen != null;

  // "l_seen_news" field.
  DateTime? _lSeenNews;
  DateTime? get lSeenNews => _lSeenNews;
  bool hasLSeenNews() => _lSeenNews != null;

  // "doc_ref" field.
  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  bool hasDocRef() => _docRef != null;

  void _initializeFields() {
    _notifyCnt = castToType<int>(snapshotData['notify_cnt']);
    _msgCnt = castToType<int>(snapshotData['msg_cnt']);
    _newsCnt = castToType<int>(snapshotData['news_cnt']);
    _bookCnt = castToType<int>(snapshotData['book_cnt']);
    _lastSeen = snapshotData['last_seen'] as DateTime?;
    _lSeenNews = snapshotData['l_seen_news'] as DateTime?;
    _docRef = snapshotData['doc_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doc_notify');

  static Stream<DocNotifyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocNotifyRecord.fromSnapshot(s));

  static Future<DocNotifyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocNotifyRecord.fromSnapshot(s));

  static DocNotifyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocNotifyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocNotifyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocNotifyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocNotifyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocNotifyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocNotifyRecordData({
  int? notifyCnt,
  int? msgCnt,
  int? newsCnt,
  int? bookCnt,
  DateTime? lastSeen,
  DateTime? lSeenNews,
  DocumentReference? docRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notify_cnt': notifyCnt,
      'msg_cnt': msgCnt,
      'news_cnt': newsCnt,
      'book_cnt': bookCnt,
      'last_seen': lastSeen,
      'l_seen_news': lSeenNews,
      'doc_ref': docRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocNotifyRecordDocumentEquality implements Equality<DocNotifyRecord> {
  const DocNotifyRecordDocumentEquality();

  @override
  bool equals(DocNotifyRecord? e1, DocNotifyRecord? e2) {
    return e1?.notifyCnt == e2?.notifyCnt &&
        e1?.msgCnt == e2?.msgCnt &&
        e1?.newsCnt == e2?.newsCnt &&
        e1?.bookCnt == e2?.bookCnt &&
        e1?.lastSeen == e2?.lastSeen &&
        e1?.lSeenNews == e2?.lSeenNews &&
        e1?.docRef == e2?.docRef;
  }

  @override
  int hash(DocNotifyRecord? e) => const ListEquality().hash([
        e?.notifyCnt,
        e?.msgCnt,
        e?.newsCnt,
        e?.bookCnt,
        e?.lastSeen,
        e?.lSeenNews,
        e?.docRef
      ]);

  @override
  bool isValidKey(Object? o) => o is DocNotifyRecord;
}
