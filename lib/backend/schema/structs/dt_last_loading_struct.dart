// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtLastLoadingStruct extends FFFirebaseStruct {
  DtLastLoadingStruct({
    DateTime? ciityDate,
    DateTime? categoryDate,
    DateTime? daysDate,
    DateTime? refData,
    bool? reLoadCities,
    bool? reLoadCategory,
    bool? reLoadDays,
    bool? reLoadRefData,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ciityDate = ciityDate,
        _categoryDate = categoryDate,
        _daysDate = daysDate,
        _refData = refData,
        _reLoadCities = reLoadCities,
        _reLoadCategory = reLoadCategory,
        _reLoadDays = reLoadDays,
        _reLoadRefData = reLoadRefData,
        super(firestoreUtilData);

  // "ciity_date" field.
  DateTime? _ciityDate;
  DateTime get ciityDate =>
      _ciityDate ?? DateTime.fromMicrosecondsSinceEpoch(1721595600000000);
  set ciityDate(DateTime? val) => _ciityDate = val;

  bool hasCiityDate() => _ciityDate != null;

  // "category_date" field.
  DateTime? _categoryDate;
  DateTime get categoryDate =>
      _categoryDate ?? DateTime.fromMicrosecondsSinceEpoch(1719781200000000);
  set categoryDate(DateTime? val) => _categoryDate = val;

  bool hasCategoryDate() => _categoryDate != null;

  // "days_date" field.
  DateTime? _daysDate;
  DateTime get daysDate =>
      _daysDate ?? DateTime.fromMicrosecondsSinceEpoch(1720386000000000);
  set daysDate(DateTime? val) => _daysDate = val;

  bool hasDaysDate() => _daysDate != null;

  // "ref_data" field.
  DateTime? _refData;
  DateTime get refData =>
      _refData ?? DateTime.fromMicrosecondsSinceEpoch(1727816400000000);
  set refData(DateTime? val) => _refData = val;

  bool hasRefData() => _refData != null;

  // "reLoadCities" field.
  bool? _reLoadCities;
  bool get reLoadCities => _reLoadCities ?? true;
  set reLoadCities(bool? val) => _reLoadCities = val;

  bool hasReLoadCities() => _reLoadCities != null;

  // "reLoadCategory" field.
  bool? _reLoadCategory;
  bool get reLoadCategory => _reLoadCategory ?? true;
  set reLoadCategory(bool? val) => _reLoadCategory = val;

  bool hasReLoadCategory() => _reLoadCategory != null;

  // "reLoadDays" field.
  bool? _reLoadDays;
  bool get reLoadDays => _reLoadDays ?? true;
  set reLoadDays(bool? val) => _reLoadDays = val;

  bool hasReLoadDays() => _reLoadDays != null;

  // "reLoadRefData" field.
  bool? _reLoadRefData;
  bool get reLoadRefData => _reLoadRefData ?? true;
  set reLoadRefData(bool? val) => _reLoadRefData = val;

  bool hasReLoadRefData() => _reLoadRefData != null;

  static DtLastLoadingStruct fromMap(Map<String, dynamic> data) =>
      DtLastLoadingStruct(
        ciityDate: data['ciity_date'] as DateTime?,
        categoryDate: data['category_date'] as DateTime?,
        daysDate: data['days_date'] as DateTime?,
        refData: data['ref_data'] as DateTime?,
        reLoadCities: data['reLoadCities'] as bool?,
        reLoadCategory: data['reLoadCategory'] as bool?,
        reLoadDays: data['reLoadDays'] as bool?,
        reLoadRefData: data['reLoadRefData'] as bool?,
      );

  static DtLastLoadingStruct? maybeFromMap(dynamic data) => data is Map
      ? DtLastLoadingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ciity_date': _ciityDate,
        'category_date': _categoryDate,
        'days_date': _daysDate,
        'ref_data': _refData,
        'reLoadCities': _reLoadCities,
        'reLoadCategory': _reLoadCategory,
        'reLoadDays': _reLoadDays,
        'reLoadRefData': _reLoadRefData,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ciity_date': serializeParam(
          _ciityDate,
          ParamType.DateTime,
        ),
        'category_date': serializeParam(
          _categoryDate,
          ParamType.DateTime,
        ),
        'days_date': serializeParam(
          _daysDate,
          ParamType.DateTime,
        ),
        'ref_data': serializeParam(
          _refData,
          ParamType.DateTime,
        ),
        'reLoadCities': serializeParam(
          _reLoadCities,
          ParamType.bool,
        ),
        'reLoadCategory': serializeParam(
          _reLoadCategory,
          ParamType.bool,
        ),
        'reLoadDays': serializeParam(
          _reLoadDays,
          ParamType.bool,
        ),
        'reLoadRefData': serializeParam(
          _reLoadRefData,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DtLastLoadingStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtLastLoadingStruct(
        ciityDate: deserializeParam(
          data['ciity_date'],
          ParamType.DateTime,
          false,
        ),
        categoryDate: deserializeParam(
          data['category_date'],
          ParamType.DateTime,
          false,
        ),
        daysDate: deserializeParam(
          data['days_date'],
          ParamType.DateTime,
          false,
        ),
        refData: deserializeParam(
          data['ref_data'],
          ParamType.DateTime,
          false,
        ),
        reLoadCities: deserializeParam(
          data['reLoadCities'],
          ParamType.bool,
          false,
        ),
        reLoadCategory: deserializeParam(
          data['reLoadCategory'],
          ParamType.bool,
          false,
        ),
        reLoadDays: deserializeParam(
          data['reLoadDays'],
          ParamType.bool,
          false,
        ),
        reLoadRefData: deserializeParam(
          data['reLoadRefData'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DtLastLoadingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtLastLoadingStruct &&
        ciityDate == other.ciityDate &&
        categoryDate == other.categoryDate &&
        daysDate == other.daysDate &&
        refData == other.refData &&
        reLoadCities == other.reLoadCities &&
        reLoadCategory == other.reLoadCategory &&
        reLoadDays == other.reLoadDays &&
        reLoadRefData == other.reLoadRefData;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ciityDate,
        categoryDate,
        daysDate,
        refData,
        reLoadCities,
        reLoadCategory,
        reLoadDays,
        reLoadRefData
      ]);
}

DtLastLoadingStruct createDtLastLoadingStruct({
  DateTime? ciityDate,
  DateTime? categoryDate,
  DateTime? daysDate,
  DateTime? refData,
  bool? reLoadCities,
  bool? reLoadCategory,
  bool? reLoadDays,
  bool? reLoadRefData,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtLastLoadingStruct(
      ciityDate: ciityDate,
      categoryDate: categoryDate,
      daysDate: daysDate,
      refData: refData,
      reLoadCities: reLoadCities,
      reLoadCategory: reLoadCategory,
      reLoadDays: reLoadDays,
      reLoadRefData: reLoadRefData,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtLastLoadingStruct? updateDtLastLoadingStruct(
  DtLastLoadingStruct? dtLastLoading, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtLastLoading
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtLastLoadingStructData(
  Map<String, dynamic> firestoreData,
  DtLastLoadingStruct? dtLastLoading,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtLastLoading == null) {
    return;
  }
  if (dtLastLoading.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtLastLoading.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtLastLoadingData =
      getDtLastLoadingFirestoreData(dtLastLoading, forFieldValue);
  final nestedData =
      dtLastLoadingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtLastLoading.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtLastLoadingFirestoreData(
  DtLastLoadingStruct? dtLastLoading, [
  bool forFieldValue = false,
]) {
  if (dtLastLoading == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtLastLoading.toMap());

  // Add any Firestore field values
  dtLastLoading.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtLastLoadingListFirestoreData(
  List<DtLastLoadingStruct>? dtLastLoadings,
) =>
    dtLastLoadings
        ?.map((e) => getDtLastLoadingFirestoreData(e, true))
        .toList() ??
    [];
