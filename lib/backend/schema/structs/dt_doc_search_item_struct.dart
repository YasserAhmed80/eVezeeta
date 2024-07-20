// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtDocSearchItemStruct extends FFFirebaseStruct {
  DtDocSearchItemStruct({
    String? itemType,
    String? itemDesc,
    String? dialogDesc,
    bool? isActive,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemType = itemType,
        _itemDesc = itemDesc,
        _dialogDesc = dialogDesc,
        _isActive = isActive,
        super(firestoreUtilData);

  // "item_type" field.
  String? _itemType;
  String get itemType => _itemType ?? '';
  set itemType(String? val) => _itemType = val;

  bool hasItemType() => _itemType != null;

  // "item_desc" field.
  String? _itemDesc;
  String get itemDesc => _itemDesc ?? '';
  set itemDesc(String? val) => _itemDesc = val;

  bool hasItemDesc() => _itemDesc != null;

  // "dialog_desc" field.
  String? _dialogDesc;
  String get dialogDesc => _dialogDesc ?? '';
  set dialogDesc(String? val) => _dialogDesc = val;

  bool hasDialogDesc() => _dialogDesc != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  set isActive(bool? val) => _isActive = val;

  bool hasIsActive() => _isActive != null;

  static DtDocSearchItemStruct fromMap(Map<String, dynamic> data) =>
      DtDocSearchItemStruct(
        itemType: data['item_type'] as String?,
        itemDesc: data['item_desc'] as String?,
        dialogDesc: data['dialog_desc'] as String?,
        isActive: data['isActive'] as bool?,
      );

  static DtDocSearchItemStruct? maybeFromMap(dynamic data) => data is Map
      ? DtDocSearchItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'item_type': _itemType,
        'item_desc': _itemDesc,
        'dialog_desc': _dialogDesc,
        'isActive': _isActive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'item_type': serializeParam(
          _itemType,
          ParamType.String,
        ),
        'item_desc': serializeParam(
          _itemDesc,
          ParamType.String,
        ),
        'dialog_desc': serializeParam(
          _dialogDesc,
          ParamType.String,
        ),
        'isActive': serializeParam(
          _isActive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DtDocSearchItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtDocSearchItemStruct(
        itemType: deserializeParam(
          data['item_type'],
          ParamType.String,
          false,
        ),
        itemDesc: deserializeParam(
          data['item_desc'],
          ParamType.String,
          false,
        ),
        dialogDesc: deserializeParam(
          data['dialog_desc'],
          ParamType.String,
          false,
        ),
        isActive: deserializeParam(
          data['isActive'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DtDocSearchItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtDocSearchItemStruct &&
        itemType == other.itemType &&
        itemDesc == other.itemDesc &&
        dialogDesc == other.dialogDesc &&
        isActive == other.isActive;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([itemType, itemDesc, dialogDesc, isActive]);
}

DtDocSearchItemStruct createDtDocSearchItemStruct({
  String? itemType,
  String? itemDesc,
  String? dialogDesc,
  bool? isActive,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtDocSearchItemStruct(
      itemType: itemType,
      itemDesc: itemDesc,
      dialogDesc: dialogDesc,
      isActive: isActive,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtDocSearchItemStruct? updateDtDocSearchItemStruct(
  DtDocSearchItemStruct? dtDocSearchItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtDocSearchItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtDocSearchItemStructData(
  Map<String, dynamic> firestoreData,
  DtDocSearchItemStruct? dtDocSearchItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtDocSearchItem == null) {
    return;
  }
  if (dtDocSearchItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtDocSearchItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtDocSearchItemData =
      getDtDocSearchItemFirestoreData(dtDocSearchItem, forFieldValue);
  final nestedData =
      dtDocSearchItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtDocSearchItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtDocSearchItemFirestoreData(
  DtDocSearchItemStruct? dtDocSearchItem, [
  bool forFieldValue = false,
]) {
  if (dtDocSearchItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtDocSearchItem.toMap());

  // Add any Firestore field values
  dtDocSearchItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtDocSearchItemListFirestoreData(
  List<DtDocSearchItemStruct>? dtDocSearchItems,
) =>
    dtDocSearchItems
        ?.map((e) => getDtDocSearchItemFirestoreData(e, true))
        .toList() ??
    [];
