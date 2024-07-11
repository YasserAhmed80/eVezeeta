// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtDoctorStruct extends FFFirebaseStruct {
  DtDoctorStruct({
    String? name,
    int? gender,
    int? titleId,
    String? titleDesc,
    int? catId,
    List<int>? subCatId,
    String? about,
    int? aCon,
    int? aGov,
    int? aZone,
    int? aArea,
    String? aAddr,
    LatLng? aLatlng,
    String? tel1,
    String? tel2,
    String? img,
    DocumentReference? dbDocRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _gender = gender,
        _titleId = titleId,
        _titleDesc = titleDesc,
        _catId = catId,
        _subCatId = subCatId,
        _about = about,
        _aCon = aCon,
        _aGov = aGov,
        _aZone = aZone,
        _aArea = aArea,
        _aAddr = aAddr,
        _aLatlng = aLatlng,
        _tel1 = tel1,
        _tel2 = tel2,
        _img = img,
        _dbDocRef = dbDocRef,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "gender" field.
  int? _gender;
  int get gender => _gender ?? 0;
  set gender(int? val) => _gender = val;

  void incrementGender(int amount) => gender = gender + amount;

  bool hasGender() => _gender != null;

  // "title_id" field.
  int? _titleId;
  int get titleId => _titleId ?? 0;
  set titleId(int? val) => _titleId = val;

  void incrementTitleId(int amount) => titleId = titleId + amount;

  bool hasTitleId() => _titleId != null;

  // "title_desc" field.
  String? _titleDesc;
  String get titleDesc => _titleDesc ?? '';
  set titleDesc(String? val) => _titleDesc = val;

  bool hasTitleDesc() => _titleDesc != null;

  // "cat_id" field.
  int? _catId;
  int get catId => _catId ?? 0;
  set catId(int? val) => _catId = val;

  void incrementCatId(int amount) => catId = catId + amount;

  bool hasCatId() => _catId != null;

  // "sub_cat_id" field.
  List<int>? _subCatId;
  List<int> get subCatId => _subCatId ?? const [];
  set subCatId(List<int>? val) => _subCatId = val;

  void updateSubCatId(Function(List<int>) updateFn) {
    updateFn(_subCatId ??= []);
  }

  bool hasSubCatId() => _subCatId != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  set about(String? val) => _about = val;

  bool hasAbout() => _about != null;

  // "a_con" field.
  int? _aCon;
  int get aCon => _aCon ?? 0;
  set aCon(int? val) => _aCon = val;

  void incrementACon(int amount) => aCon = aCon + amount;

  bool hasACon() => _aCon != null;

  // "a_gov" field.
  int? _aGov;
  int get aGov => _aGov ?? 0;
  set aGov(int? val) => _aGov = val;

  void incrementAGov(int amount) => aGov = aGov + amount;

  bool hasAGov() => _aGov != null;

  // "a_zone" field.
  int? _aZone;
  int get aZone => _aZone ?? 0;
  set aZone(int? val) => _aZone = val;

  void incrementAZone(int amount) => aZone = aZone + amount;

  bool hasAZone() => _aZone != null;

  // "a_area" field.
  int? _aArea;
  int get aArea => _aArea ?? 0;
  set aArea(int? val) => _aArea = val;

  void incrementAArea(int amount) => aArea = aArea + amount;

  bool hasAArea() => _aArea != null;

  // "a_addr" field.
  String? _aAddr;
  String get aAddr => _aAddr ?? '';
  set aAddr(String? val) => _aAddr = val;

  bool hasAAddr() => _aAddr != null;

  // "a_latlng" field.
  LatLng? _aLatlng;
  LatLng? get aLatlng => _aLatlng;
  set aLatlng(LatLng? val) => _aLatlng = val;

  bool hasALatlng() => _aLatlng != null;

  // "tel_1" field.
  String? _tel1;
  String get tel1 => _tel1 ?? '';
  set tel1(String? val) => _tel1 = val;

  bool hasTel1() => _tel1 != null;

  // "tel_2" field.
  String? _tel2;
  String get tel2 => _tel2 ?? '';
  set tel2(String? val) => _tel2 = val;

  bool hasTel2() => _tel2 != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "db_doc_ref" field.
  DocumentReference? _dbDocRef;
  DocumentReference? get dbDocRef => _dbDocRef;
  set dbDocRef(DocumentReference? val) => _dbDocRef = val;

  bool hasDbDocRef() => _dbDocRef != null;

  static DtDoctorStruct fromMap(Map<String, dynamic> data) => DtDoctorStruct(
        name: data['name'] as String?,
        gender: castToType<int>(data['gender']),
        titleId: castToType<int>(data['title_id']),
        titleDesc: data['title_desc'] as String?,
        catId: castToType<int>(data['cat_id']),
        subCatId: getDataList(data['sub_cat_id']),
        about: data['about'] as String?,
        aCon: castToType<int>(data['a_con']),
        aGov: castToType<int>(data['a_gov']),
        aZone: castToType<int>(data['a_zone']),
        aArea: castToType<int>(data['a_area']),
        aAddr: data['a_addr'] as String?,
        aLatlng: data['a_latlng'] as LatLng?,
        tel1: data['tel_1'] as String?,
        tel2: data['tel_2'] as String?,
        img: data['img'] as String?,
        dbDocRef: data['db_doc_ref'] as DocumentReference?,
      );

  static DtDoctorStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtDoctorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'gender': _gender,
        'title_id': _titleId,
        'title_desc': _titleDesc,
        'cat_id': _catId,
        'sub_cat_id': _subCatId,
        'about': _about,
        'a_con': _aCon,
        'a_gov': _aGov,
        'a_zone': _aZone,
        'a_area': _aArea,
        'a_addr': _aAddr,
        'a_latlng': _aLatlng,
        'tel_1': _tel1,
        'tel_2': _tel2,
        'img': _img,
        'db_doc_ref': _dbDocRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.int,
        ),
        'title_id': serializeParam(
          _titleId,
          ParamType.int,
        ),
        'title_desc': serializeParam(
          _titleDesc,
          ParamType.String,
        ),
        'cat_id': serializeParam(
          _catId,
          ParamType.int,
        ),
        'sub_cat_id': serializeParam(
          _subCatId,
          ParamType.int,
          isList: true,
        ),
        'about': serializeParam(
          _about,
          ParamType.String,
        ),
        'a_con': serializeParam(
          _aCon,
          ParamType.int,
        ),
        'a_gov': serializeParam(
          _aGov,
          ParamType.int,
        ),
        'a_zone': serializeParam(
          _aZone,
          ParamType.int,
        ),
        'a_area': serializeParam(
          _aArea,
          ParamType.int,
        ),
        'a_addr': serializeParam(
          _aAddr,
          ParamType.String,
        ),
        'a_latlng': serializeParam(
          _aLatlng,
          ParamType.LatLng,
        ),
        'tel_1': serializeParam(
          _tel1,
          ParamType.String,
        ),
        'tel_2': serializeParam(
          _tel2,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'db_doc_ref': serializeParam(
          _dbDocRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static DtDoctorStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtDoctorStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.int,
          false,
        ),
        titleId: deserializeParam(
          data['title_id'],
          ParamType.int,
          false,
        ),
        titleDesc: deserializeParam(
          data['title_desc'],
          ParamType.String,
          false,
        ),
        catId: deserializeParam(
          data['cat_id'],
          ParamType.int,
          false,
        ),
        subCatId: deserializeParam<int>(
          data['sub_cat_id'],
          ParamType.int,
          true,
        ),
        about: deserializeParam(
          data['about'],
          ParamType.String,
          false,
        ),
        aCon: deserializeParam(
          data['a_con'],
          ParamType.int,
          false,
        ),
        aGov: deserializeParam(
          data['a_gov'],
          ParamType.int,
          false,
        ),
        aZone: deserializeParam(
          data['a_zone'],
          ParamType.int,
          false,
        ),
        aArea: deserializeParam(
          data['a_area'],
          ParamType.int,
          false,
        ),
        aAddr: deserializeParam(
          data['a_addr'],
          ParamType.String,
          false,
        ),
        aLatlng: deserializeParam(
          data['a_latlng'],
          ParamType.LatLng,
          false,
        ),
        tel1: deserializeParam(
          data['tel_1'],
          ParamType.String,
          false,
        ),
        tel2: deserializeParam(
          data['tel_2'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        dbDocRef: deserializeParam(
          data['db_doc_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['doc'],
        ),
      );

  @override
  String toString() => 'DtDoctorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DtDoctorStruct &&
        name == other.name &&
        gender == other.gender &&
        titleId == other.titleId &&
        titleDesc == other.titleDesc &&
        catId == other.catId &&
        listEquality.equals(subCatId, other.subCatId) &&
        about == other.about &&
        aCon == other.aCon &&
        aGov == other.aGov &&
        aZone == other.aZone &&
        aArea == other.aArea &&
        aAddr == other.aAddr &&
        aLatlng == other.aLatlng &&
        tel1 == other.tel1 &&
        tel2 == other.tel2 &&
        img == other.img &&
        dbDocRef == other.dbDocRef;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        gender,
        titleId,
        titleDesc,
        catId,
        subCatId,
        about,
        aCon,
        aGov,
        aZone,
        aArea,
        aAddr,
        aLatlng,
        tel1,
        tel2,
        img,
        dbDocRef
      ]);
}

DtDoctorStruct createDtDoctorStruct({
  String? name,
  int? gender,
  int? titleId,
  String? titleDesc,
  int? catId,
  String? about,
  int? aCon,
  int? aGov,
  int? aZone,
  int? aArea,
  String? aAddr,
  LatLng? aLatlng,
  String? tel1,
  String? tel2,
  String? img,
  DocumentReference? dbDocRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtDoctorStruct(
      name: name,
      gender: gender,
      titleId: titleId,
      titleDesc: titleDesc,
      catId: catId,
      about: about,
      aCon: aCon,
      aGov: aGov,
      aZone: aZone,
      aArea: aArea,
      aAddr: aAddr,
      aLatlng: aLatlng,
      tel1: tel1,
      tel2: tel2,
      img: img,
      dbDocRef: dbDocRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtDoctorStruct? updateDtDoctorStruct(
  DtDoctorStruct? dtDoctor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtDoctor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtDoctorStructData(
  Map<String, dynamic> firestoreData,
  DtDoctorStruct? dtDoctor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtDoctor == null) {
    return;
  }
  if (dtDoctor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtDoctor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtDoctorData = getDtDoctorFirestoreData(dtDoctor, forFieldValue);
  final nestedData = dtDoctorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtDoctor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtDoctorFirestoreData(
  DtDoctorStruct? dtDoctor, [
  bool forFieldValue = false,
]) {
  if (dtDoctor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtDoctor.toMap());

  // Add any Firestore field values
  dtDoctor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtDoctorListFirestoreData(
  List<DtDoctorStruct>? dtDoctors,
) =>
    dtDoctors?.map((e) => getDtDoctorFirestoreData(e, true)).toList() ?? [];
