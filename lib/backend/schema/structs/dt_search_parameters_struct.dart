// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtSearchParametersStruct extends FFFirebaseStruct {
  DtSearchParametersStruct({
    int? govCde,
    int? zoneCde,
    int? areaCde,
    int? catCde,
    List<int>? subCatCde,
    LatLng? latlng,
    String? govDesc,
    String? zoneDesc,
    String? areaDesc,
    String? catDesc,
    String? subCatDesc,
    List<int>? docTypeCde,
    List<int>? docTitleCde,
    double? priceFrom,
    double? priceTo,
    bool? filterPriceCheck,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _govCde = govCde,
        _zoneCde = zoneCde,
        _areaCde = areaCde,
        _catCde = catCde,
        _subCatCde = subCatCde,
        _latlng = latlng,
        _govDesc = govDesc,
        _zoneDesc = zoneDesc,
        _areaDesc = areaDesc,
        _catDesc = catDesc,
        _subCatDesc = subCatDesc,
        _docTypeCde = docTypeCde,
        _docTitleCde = docTitleCde,
        _priceFrom = priceFrom,
        _priceTo = priceTo,
        _filterPriceCheck = filterPriceCheck,
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
  List<int>? _subCatCde;
  List<int> get subCatCde => _subCatCde ?? const [];
  set subCatCde(List<int>? val) => _subCatCde = val;

  void updateSubCatCde(Function(List<int>) updateFn) {
    updateFn(_subCatCde ??= []);
  }

  bool hasSubCatCde() => _subCatCde != null;

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

  // "cat_desc" field.
  String? _catDesc;
  String get catDesc => _catDesc ?? '';
  set catDesc(String? val) => _catDesc = val;

  bool hasCatDesc() => _catDesc != null;

  // "sub_cat_desc" field.
  String? _subCatDesc;
  String get subCatDesc => _subCatDesc ?? '';
  set subCatDesc(String? val) => _subCatDesc = val;

  bool hasSubCatDesc() => _subCatDesc != null;

  // "doc_type_cde" field.
  List<int>? _docTypeCde;
  List<int> get docTypeCde => _docTypeCde ?? const [];
  set docTypeCde(List<int>? val) => _docTypeCde = val;

  void updateDocTypeCde(Function(List<int>) updateFn) {
    updateFn(_docTypeCde ??= []);
  }

  bool hasDocTypeCde() => _docTypeCde != null;

  // "doc_title_cde" field.
  List<int>? _docTitleCde;
  List<int> get docTitleCde => _docTitleCde ?? const [];
  set docTitleCde(List<int>? val) => _docTitleCde = val;

  void updateDocTitleCde(Function(List<int>) updateFn) {
    updateFn(_docTitleCde ??= []);
  }

  bool hasDocTitleCde() => _docTitleCde != null;

  // "price_from" field.
  double? _priceFrom;
  double get priceFrom => _priceFrom ?? 0.0;
  set priceFrom(double? val) => _priceFrom = val;

  void incrementPriceFrom(double amount) => priceFrom = priceFrom + amount;

  bool hasPriceFrom() => _priceFrom != null;

  // "price_to" field.
  double? _priceTo;
  double get priceTo => _priceTo ?? 3000.0;
  set priceTo(double? val) => _priceTo = val;

  void incrementPriceTo(double amount) => priceTo = priceTo + amount;

  bool hasPriceTo() => _priceTo != null;

  // "filter_price_check" field.
  bool? _filterPriceCheck;
  bool get filterPriceCheck => _filterPriceCheck ?? false;
  set filterPriceCheck(bool? val) => _filterPriceCheck = val;

  bool hasFilterPriceCheck() => _filterPriceCheck != null;

  static DtSearchParametersStruct fromMap(Map<String, dynamic> data) =>
      DtSearchParametersStruct(
        govCde: castToType<int>(data['gov_cde']),
        zoneCde: castToType<int>(data['zone_cde']),
        areaCde: castToType<int>(data['area_cde']),
        catCde: castToType<int>(data['cat_cde']),
        subCatCde: getDataList(data['sub_cat_cde']),
        latlng: data['latlng'] as LatLng?,
        govDesc: data['gov_desc'] as String?,
        zoneDesc: data['zone_desc'] as String?,
        areaDesc: data['area_desc'] as String?,
        catDesc: data['cat_desc'] as String?,
        subCatDesc: data['sub_cat_desc'] as String?,
        docTypeCde: getDataList(data['doc_type_cde']),
        docTitleCde: getDataList(data['doc_title_cde']),
        priceFrom: castToType<double>(data['price_from']),
        priceTo: castToType<double>(data['price_to']),
        filterPriceCheck: data['filter_price_check'] as bool?,
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
        'latlng': _latlng,
        'gov_desc': _govDesc,
        'zone_desc': _zoneDesc,
        'area_desc': _areaDesc,
        'cat_desc': _catDesc,
        'sub_cat_desc': _subCatDesc,
        'doc_type_cde': _docTypeCde,
        'doc_title_cde': _docTitleCde,
        'price_from': _priceFrom,
        'price_to': _priceTo,
        'filter_price_check': _filterPriceCheck,
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
          isList: true,
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
        'cat_desc': serializeParam(
          _catDesc,
          ParamType.String,
        ),
        'sub_cat_desc': serializeParam(
          _subCatDesc,
          ParamType.String,
        ),
        'doc_type_cde': serializeParam(
          _docTypeCde,
          ParamType.int,
          isList: true,
        ),
        'doc_title_cde': serializeParam(
          _docTitleCde,
          ParamType.int,
          isList: true,
        ),
        'price_from': serializeParam(
          _priceFrom,
          ParamType.double,
        ),
        'price_to': serializeParam(
          _priceTo,
          ParamType.double,
        ),
        'filter_price_check': serializeParam(
          _filterPriceCheck,
          ParamType.bool,
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
        subCatCde: deserializeParam<int>(
          data['sub_cat_cde'],
          ParamType.int,
          true,
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
        catDesc: deserializeParam(
          data['cat_desc'],
          ParamType.String,
          false,
        ),
        subCatDesc: deserializeParam(
          data['sub_cat_desc'],
          ParamType.String,
          false,
        ),
        docTypeCde: deserializeParam<int>(
          data['doc_type_cde'],
          ParamType.int,
          true,
        ),
        docTitleCde: deserializeParam<int>(
          data['doc_title_cde'],
          ParamType.int,
          true,
        ),
        priceFrom: deserializeParam(
          data['price_from'],
          ParamType.double,
          false,
        ),
        priceTo: deserializeParam(
          data['price_to'],
          ParamType.double,
          false,
        ),
        filterPriceCheck: deserializeParam(
          data['filter_price_check'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DtSearchParametersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DtSearchParametersStruct &&
        govCde == other.govCde &&
        zoneCde == other.zoneCde &&
        areaCde == other.areaCde &&
        catCde == other.catCde &&
        listEquality.equals(subCatCde, other.subCatCde) &&
        latlng == other.latlng &&
        govDesc == other.govDesc &&
        zoneDesc == other.zoneDesc &&
        areaDesc == other.areaDesc &&
        catDesc == other.catDesc &&
        subCatDesc == other.subCatDesc &&
        listEquality.equals(docTypeCde, other.docTypeCde) &&
        listEquality.equals(docTitleCde, other.docTitleCde) &&
        priceFrom == other.priceFrom &&
        priceTo == other.priceTo &&
        filterPriceCheck == other.filterPriceCheck;
  }

  @override
  int get hashCode => const ListEquality().hash([
        govCde,
        zoneCde,
        areaCde,
        catCde,
        subCatCde,
        latlng,
        govDesc,
        zoneDesc,
        areaDesc,
        catDesc,
        subCatDesc,
        docTypeCde,
        docTitleCde,
        priceFrom,
        priceTo,
        filterPriceCheck
      ]);
}

DtSearchParametersStruct createDtSearchParametersStruct({
  int? govCde,
  int? zoneCde,
  int? areaCde,
  int? catCde,
  LatLng? latlng,
  String? govDesc,
  String? zoneDesc,
  String? areaDesc,
  String? catDesc,
  String? subCatDesc,
  double? priceFrom,
  double? priceTo,
  bool? filterPriceCheck,
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
      latlng: latlng,
      govDesc: govDesc,
      zoneDesc: zoneDesc,
      areaDesc: areaDesc,
      catDesc: catDesc,
      subCatDesc: subCatDesc,
      priceFrom: priceFrom,
      priceTo: priceTo,
      filterPriceCheck: filterPriceCheck,
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
