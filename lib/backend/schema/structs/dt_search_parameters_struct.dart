// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtSearchParametersStruct extends FFFirebaseStruct {
  DtSearchParametersStruct({
    int? govCde,
    int? zoneCde,
    int? areaCde,
    int? catCde,
    int? subCatCde,
    int? docTypeCde,
    int? docTitleCde,
    LatLng? latlng,
    String? govDesc,
    String? zoneDesc,
    String? areaDesc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _govCde = govCde,
        _zoneCde = zoneCde,
        _areaCde = areaCde,
        _catCde = catCde,
        _subCatCde = subCatCde,
        _docTypeCde = docTypeCde,
        _docTitleCde = docTitleCde,
        _latlng = latlng,
        _govDesc = govDesc,
        _zoneDesc = zoneDesc,
        _areaDesc = areaDesc,
        super(firestoreUtilData);

  // "gov_cde" field.
  int? _govCde;
  int get govCde => _govCde ?? 0;
  set govCde(int? val) => _govCde = val;

  void incrementGovCde(int amount) => govCde = govCde + amount;

  bool hasGovCde() => _govCde != null;

  // "zone_cde" field.
  int? _zoneCde;
  int get zoneCde => _zoneCde ?? 0;
  set zoneCde(int? val) => _zoneCde = val;

  void incrementZoneCde(int amount) => zoneCde = zoneCde + amount;

  bool hasZoneCde() => _zoneCde != null;

  // "area_cde" field.
  int? _areaCde;
  int get areaCde => _areaCde ?? 0;
  set areaCde(int? val) => _areaCde = val;

  void incrementAreaCde(int amount) => areaCde = areaCde + amount;

  bool hasAreaCde() => _areaCde != null;

  // "cat_cde" field.
  int? _catCde;
  int get catCde => _catCde ?? 0;
  set catCde(int? val) => _catCde = val;

  void incrementCatCde(int amount) => catCde = catCde + amount;

  bool hasCatCde() => _catCde != null;

  // "sub_cat_cde" field.
  int? _subCatCde;
  int get subCatCde => _subCatCde ?? 0;
  set subCatCde(int? val) => _subCatCde = val;

  void incrementSubCatCde(int amount) => subCatCde = subCatCde + amount;

  bool hasSubCatCde() => _subCatCde != null;

  // "doc_type_cde" field.
  int? _docTypeCde;
  int get docTypeCde => _docTypeCde ?? 0;
  set docTypeCde(int? val) => _docTypeCde = val;

  void incrementDocTypeCde(int amount) => docTypeCde = docTypeCde + amount;

  bool hasDocTypeCde() => _docTypeCde != null;

  // "doc_title_cde" field.
  int? _docTitleCde;
  int get docTitleCde => _docTitleCde ?? 0;
  set docTitleCde(int? val) => _docTitleCde = val;

  void incrementDocTitleCde(int amount) => docTitleCde = docTitleCde + amount;

  bool hasDocTitleCde() => _docTitleCde != null;

  // "latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  set latlng(LatLng? val) => _latlng = val;

  bool hasLatlng() => _latlng != null;

  // "gov_desc" field.
  String? _govDesc;
  String get govDesc => _govDesc ?? '';
  set govDesc(String? val) => _govDesc = val;

  bool hasGovDesc() => _govDesc != null;

  // "zone_desc" field.
  String? _zoneDesc;
  String get zoneDesc => _zoneDesc ?? '';
  set zoneDesc(String? val) => _zoneDesc = val;

  bool hasZoneDesc() => _zoneDesc != null;

  // "area_desc" field.
  String? _areaDesc;
  String get areaDesc => _areaDesc ?? '';
  set areaDesc(String? val) => _areaDesc = val;

  bool hasAreaDesc() => _areaDesc != null;

  static DtSearchParametersStruct fromMap(Map<String, dynamic> data) =>
      DtSearchParametersStruct(
        govCde: castToType<int>(data['gov_cde']),
        zoneCde: castToType<int>(data['zone_cde']),
        areaCde: castToType<int>(data['area_cde']),
        catCde: castToType<int>(data['cat_cde']),
        subCatCde: castToType<int>(data['sub_cat_cde']),
        docTypeCde: castToType<int>(data['doc_type_cde']),
        docTitleCde: castToType<int>(data['doc_title_cde']),
        latlng: data['latlng'] as LatLng?,
        govDesc: data['gov_desc'] as String?,
        zoneDesc: data['zone_desc'] as String?,
        areaDesc: data['area_desc'] as String?,
      );

  static DtSearchParametersStruct? maybeFromMap(dynamic data) => data is Map
      ? DtSearchParametersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'gov_cde': _govCde,
        'zone_cde': _zoneCde,
        'area_cde': _areaCde,
        'cat_cde': _catCde,
        'sub_cat_cde': _subCatCde,
        'doc_type_cde': _docTypeCde,
        'doc_title_cde': _docTitleCde,
        'latlng': _latlng,
        'gov_desc': _govDesc,
        'zone_desc': _zoneDesc,
        'area_desc': _areaDesc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gov_cde': serializeParam(
          _govCde,
          ParamType.int,
        ),
        'zone_cde': serializeParam(
          _zoneCde,
          ParamType.int,
        ),
        'area_cde': serializeParam(
          _areaCde,
          ParamType.int,
        ),
        'cat_cde': serializeParam(
          _catCde,
          ParamType.int,
        ),
        'sub_cat_cde': serializeParam(
          _subCatCde,
          ParamType.int,
        ),
        'doc_type_cde': serializeParam(
          _docTypeCde,
          ParamType.int,
        ),
        'doc_title_cde': serializeParam(
          _docTitleCde,
          ParamType.int,
        ),
        'latlng': serializeParam(
          _latlng,
          ParamType.LatLng,
        ),
        'gov_desc': serializeParam(
          _govDesc,
          ParamType.String,
        ),
        'zone_desc': serializeParam(
          _zoneDesc,
          ParamType.String,
        ),
        'area_desc': serializeParam(
          _areaDesc,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtSearchParametersStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtSearchParametersStruct(
        govCde: deserializeParam(
          data['gov_cde'],
          ParamType.int,
          false,
        ),
        zoneCde: deserializeParam(
          data['zone_cde'],
          ParamType.int,
          false,
        ),
        areaCde: deserializeParam(
          data['area_cde'],
          ParamType.int,
          false,
        ),
        catCde: deserializeParam(
          data['cat_cde'],
          ParamType.int,
          false,
        ),
        subCatCde: deserializeParam(
          data['sub_cat_cde'],
          ParamType.int,
          false,
        ),
        docTypeCde: deserializeParam(
          data['doc_type_cde'],
          ParamType.int,
          false,
        ),
        docTitleCde: deserializeParam(
          data['doc_title_cde'],
          ParamType.int,
          false,
        ),
        latlng: deserializeParam(
          data['latlng'],
          ParamType.LatLng,
          false,
        ),
        govDesc: deserializeParam(
          data['gov_desc'],
          ParamType.String,
          false,
        ),
        zoneDesc: deserializeParam(
          data['zone_desc'],
          ParamType.String,
          false,
        ),
        areaDesc: deserializeParam(
          data['area_desc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtSearchParametersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtSearchParametersStruct &&
        govCde == other.govCde &&
        zoneCde == other.zoneCde &&
        areaCde == other.areaCde &&
        catCde == other.catCde &&
        subCatCde == other.subCatCde &&
        docTypeCde == other.docTypeCde &&
        docTitleCde == other.docTitleCde &&
        latlng == other.latlng &&
        govDesc == other.govDesc &&
        zoneDesc == other.zoneDesc &&
        areaDesc == other.areaDesc;
  }

  @override
  int get hashCode => const ListEquality().hash([
        govCde,
        zoneCde,
        areaCde,
        catCde,
        subCatCde,
        docTypeCde,
        docTitleCde,
        latlng,
        govDesc,
        zoneDesc,
        areaDesc
      ]);
}

DtSearchParametersStruct createDtSearchParametersStruct({
  int? govCde,
  int? zoneCde,
  int? areaCde,
  int? catCde,
  int? subCatCde,
  int? docTypeCde,
  int? docTitleCde,
  LatLng? latlng,
  String? govDesc,
  String? zoneDesc,
  String? areaDesc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtSearchParametersStruct(
      govCde: govCde,
      zoneCde: zoneCde,
      areaCde: areaCde,
      catCde: catCde,
      subCatCde: subCatCde,
      docTypeCde: docTypeCde,
      docTitleCde: docTitleCde,
      latlng: latlng,
      govDesc: govDesc,
      zoneDesc: zoneDesc,
      areaDesc: areaDesc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtSearchParametersStruct? updateDtSearchParametersStruct(
  DtSearchParametersStruct? dtSearchParameters, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtSearchParameters
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtSearchParametersStructData(
  Map<String, dynamic> firestoreData,
  DtSearchParametersStruct? dtSearchParameters,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtSearchParameters == null) {
    return;
  }
  if (dtSearchParameters.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtSearchParameters.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtSearchParametersData =
      getDtSearchParametersFirestoreData(dtSearchParameters, forFieldValue);
  final nestedData =
      dtSearchParametersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dtSearchParameters.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtSearchParametersFirestoreData(
  DtSearchParametersStruct? dtSearchParameters, [
  bool forFieldValue = false,
]) {
  if (dtSearchParameters == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtSearchParameters.toMap());

  // Add any Firestore field values
  dtSearchParameters.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtSearchParametersListFirestoreData(
  List<DtSearchParametersStruct>? dtSearchParameterss,
) =>
    dtSearchParameterss
        ?.map((e) => getDtSearchParametersFirestoreData(e, true))
        .toList() ??
    [];
