// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtCusFilesStruct extends FFFirebaseStruct {
  DtCusFilesStruct({
    DocumentReference? fileRef,
    DocumentReference? cusRef,
    DocumentReference? docRef,
    DateTime? fileDate,
    int? typeCde,
    String? fileDesc,
    String? docDesc,
    String? docName,
    int? docGeneder,
    String? docTitleDesc,
    int? docCat,
    String? img,
    String? docImg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fileRef = fileRef,
        _cusRef = cusRef,
        _docRef = docRef,
        _fileDate = fileDate,
        _typeCde = typeCde,
        _fileDesc = fileDesc,
        _docDesc = docDesc,
        _docName = docName,
        _docGeneder = docGeneder,
        _docTitleDesc = docTitleDesc,
        _docCat = docCat,
        _img = img,
        _docImg = docImg,
        super(firestoreUtilData);

  // "file_ref" field.
  DocumentReference? _fileRef;
  DocumentReference? get fileRef => _fileRef;
  set fileRef(DocumentReference? val) => _fileRef = val;

  bool hasFileRef() => _fileRef != null;

  // "cus_ref" field.
  DocumentReference? _cusRef;
  DocumentReference? get cusRef => _cusRef;
  set cusRef(DocumentReference? val) => _cusRef = val;

  bool hasCusRef() => _cusRef != null;

  // "doc_ref" field.
  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  set docRef(DocumentReference? val) => _docRef = val;

  bool hasDocRef() => _docRef != null;

  // "file_date" field.
  DateTime? _fileDate;
  DateTime? get fileDate => _fileDate;
  set fileDate(DateTime? val) => _fileDate = val;

  bool hasFileDate() => _fileDate != null;

  // "type_cde" field.
  int? _typeCde;
  int get typeCde => _typeCde ?? 0;
  set typeCde(int? val) => _typeCde = val;

  void incrementTypeCde(int amount) => typeCde = typeCde + amount;

  bool hasTypeCde() => _typeCde != null;

  // "file_desc" field.
  String? _fileDesc;
  String get fileDesc => _fileDesc ?? '';
  set fileDesc(String? val) => _fileDesc = val;

  bool hasFileDesc() => _fileDesc != null;

  // "doc_desc" field.
  String? _docDesc;
  String get docDesc => _docDesc ?? '';
  set docDesc(String? val) => _docDesc = val;

  bool hasDocDesc() => _docDesc != null;

  // "doc_name" field.
  String? _docName;
  String get docName => _docName ?? '';
  set docName(String? val) => _docName = val;

  bool hasDocName() => _docName != null;

  // "doc_geneder" field.
  int? _docGeneder;
  int get docGeneder => _docGeneder ?? 0;
  set docGeneder(int? val) => _docGeneder = val;

  void incrementDocGeneder(int amount) => docGeneder = docGeneder + amount;

  bool hasDocGeneder() => _docGeneder != null;

  // "doc_titleDesc" field.
  String? _docTitleDesc;
  String get docTitleDesc => _docTitleDesc ?? '';
  set docTitleDesc(String? val) => _docTitleDesc = val;

  bool hasDocTitleDesc() => _docTitleDesc != null;

  // "doc_cat" field.
  int? _docCat;
  int get docCat => _docCat ?? 0;
  set docCat(int? val) => _docCat = val;

  void incrementDocCat(int amount) => docCat = docCat + amount;

  bool hasDocCat() => _docCat != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "doc_img" field.
  String? _docImg;
  String get docImg => _docImg ?? '';
  set docImg(String? val) => _docImg = val;

  bool hasDocImg() => _docImg != null;

  static DtCusFilesStruct fromMap(Map<String, dynamic> data) =>
      DtCusFilesStruct(
        fileRef: data['file_ref'] as DocumentReference?,
        cusRef: data['cus_ref'] as DocumentReference?,
        docRef: data['doc_ref'] as DocumentReference?,
        fileDate: data['file_date'] as DateTime?,
        typeCde: castToType<int>(data['type_cde']),
        fileDesc: data['file_desc'] as String?,
        docDesc: data['doc_desc'] as String?,
        docName: data['doc_name'] as String?,
        docGeneder: castToType<int>(data['doc_geneder']),
        docTitleDesc: data['doc_titleDesc'] as String?,
        docCat: castToType<int>(data['doc_cat']),
        img: data['img'] as String?,
        docImg: data['doc_img'] as String?,
      );

  static DtCusFilesStruct? maybeFromMap(dynamic data) => data is Map
      ? DtCusFilesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'file_ref': _fileRef,
        'cus_ref': _cusRef,
        'doc_ref': _docRef,
        'file_date': _fileDate,
        'type_cde': _typeCde,
        'file_desc': _fileDesc,
        'doc_desc': _docDesc,
        'doc_name': _docName,
        'doc_geneder': _docGeneder,
        'doc_titleDesc': _docTitleDesc,
        'doc_cat': _docCat,
        'img': _img,
        'doc_img': _docImg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'file_ref': serializeParam(
          _fileRef,
          ParamType.DocumentReference,
        ),
        'cus_ref': serializeParam(
          _cusRef,
          ParamType.DocumentReference,
        ),
        'doc_ref': serializeParam(
          _docRef,
          ParamType.DocumentReference,
        ),
        'file_date': serializeParam(
          _fileDate,
          ParamType.DateTime,
        ),
        'type_cde': serializeParam(
          _typeCde,
          ParamType.int,
        ),
        'file_desc': serializeParam(
          _fileDesc,
          ParamType.String,
        ),
        'doc_desc': serializeParam(
          _docDesc,
          ParamType.String,
        ),
        'doc_name': serializeParam(
          _docName,
          ParamType.String,
        ),
        'doc_geneder': serializeParam(
          _docGeneder,
          ParamType.int,
        ),
        'doc_titleDesc': serializeParam(
          _docTitleDesc,
          ParamType.String,
        ),
        'doc_cat': serializeParam(
          _docCat,
          ParamType.int,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'doc_img': serializeParam(
          _docImg,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtCusFilesStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtCusFilesStruct(
        fileRef: deserializeParam(
          data['file_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['cus_files'],
        ),
        cusRef: deserializeParam(
          data['cus_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['cus'],
        ),
        docRef: deserializeParam(
          data['doc_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['doc'],
        ),
        fileDate: deserializeParam(
          data['file_date'],
          ParamType.DateTime,
          false,
        ),
        typeCde: deserializeParam(
          data['type_cde'],
          ParamType.int,
          false,
        ),
        fileDesc: deserializeParam(
          data['file_desc'],
          ParamType.String,
          false,
        ),
        docDesc: deserializeParam(
          data['doc_desc'],
          ParamType.String,
          false,
        ),
        docName: deserializeParam(
          data['doc_name'],
          ParamType.String,
          false,
        ),
        docGeneder: deserializeParam(
          data['doc_geneder'],
          ParamType.int,
          false,
        ),
        docTitleDesc: deserializeParam(
          data['doc_titleDesc'],
          ParamType.String,
          false,
        ),
        docCat: deserializeParam(
          data['doc_cat'],
          ParamType.int,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        docImg: deserializeParam(
          data['doc_img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtCusFilesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtCusFilesStruct &&
        fileRef == other.fileRef &&
        cusRef == other.cusRef &&
        docRef == other.docRef &&
        fileDate == other.fileDate &&
        typeCde == other.typeCde &&
        fileDesc == other.fileDesc &&
        docDesc == other.docDesc &&
        docName == other.docName &&
        docGeneder == other.docGeneder &&
        docTitleDesc == other.docTitleDesc &&
        docCat == other.docCat &&
        img == other.img &&
        docImg == other.docImg;
  }

  @override
  int get hashCode => const ListEquality().hash([
        fileRef,
        cusRef,
        docRef,
        fileDate,
        typeCde,
        fileDesc,
        docDesc,
        docName,
        docGeneder,
        docTitleDesc,
        docCat,
        img,
        docImg
      ]);
}

DtCusFilesStruct createDtCusFilesStruct({
  DocumentReference? fileRef,
  DocumentReference? cusRef,
  DocumentReference? docRef,
  DateTime? fileDate,
  int? typeCde,
  String? fileDesc,
  String? docDesc,
  String? docName,
  int? docGeneder,
  String? docTitleDesc,
  int? docCat,
  String? img,
  String? docImg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtCusFilesStruct(
      fileRef: fileRef,
      cusRef: cusRef,
      docRef: docRef,
      fileDate: fileDate,
      typeCde: typeCde,
      fileDesc: fileDesc,
      docDesc: docDesc,
      docName: docName,
      docGeneder: docGeneder,
      docTitleDesc: docTitleDesc,
      docCat: docCat,
      img: img,
      docImg: docImg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtCusFilesStruct? updateDtCusFilesStruct(
  DtCusFilesStruct? dtCusFiles, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtCusFiles
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtCusFilesStructData(
  Map<String, dynamic> firestoreData,
  DtCusFilesStruct? dtCusFiles,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtCusFiles == null) {
    return;
  }
  if (dtCusFiles.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtCusFiles.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtCusFilesData = getDtCusFilesFirestoreData(dtCusFiles, forFieldValue);
  final nestedData = dtCusFilesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtCusFiles.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtCusFilesFirestoreData(
  DtCusFilesStruct? dtCusFiles, [
  bool forFieldValue = false,
]) {
  if (dtCusFiles == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtCusFiles.toMap());

  // Add any Firestore field values
  dtCusFiles.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtCusFilesListFirestoreData(
  List<DtCusFilesStruct>? dtCusFiless,
) =>
    dtCusFiless?.map((e) => getDtCusFilesFirestoreData(e, true)).toList() ?? [];
