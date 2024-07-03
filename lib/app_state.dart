import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _currentLanguage = prefs.getInt('ff_currentLanguage') ?? _currentLanguage;
    });
    _safeInit(() {
      _flags = prefs
              .getStringList('ff_flags')
              ?.map((x) {
                try {
                  return DtFlagsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _flags;
    });
    _safeInit(() {
      _refGovernate = prefs
              .getStringList('ff_refGovernate')
              ?.map((x) {
                try {
                  return DtGovernateStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refGovernate;
    });
    _safeInit(() {
      _refZone = prefs
              .getStringList('ff_refZone')
              ?.map((x) {
                try {
                  return DtZoneStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refZone;
    });
    _safeInit(() {
      _refArea = prefs
              .getStringList('ff_refArea')
              ?.map((x) {
                try {
                  return DtAreaStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refArea;
    });
    _safeInit(() {
      _refCategory = prefs
              .getStringList('ff_refCategory')
              ?.map((x) {
                try {
                  return DtCategoryStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refCategory;
    });
    _safeInit(() {
      _refSubCategory = prefs
              .getStringList('ff_refSubCategory')
              ?.map((x) {
                try {
                  return DtSubCategoryStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refSubCategory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DtRefTableStruct> _appStateRefData = [];
  List<DtRefTableStruct> get appStateRefData => _appStateRefData;
  set appStateRefData(List<DtRefTableStruct> value) {
    _appStateRefData = value;
  }

  void addToAppStateRefData(DtRefTableStruct value) {
    appStateRefData.add(value);
  }

  void removeFromAppStateRefData(DtRefTableStruct value) {
    appStateRefData.remove(value);
  }

  void removeAtIndexFromAppStateRefData(int index) {
    appStateRefData.removeAt(index);
  }

  void updateAppStateRefDataAtIndex(
    int index,
    DtRefTableStruct Function(DtRefTableStruct) updateFn,
  ) {
    appStateRefData[index] = updateFn(_appStateRefData[index]);
  }

  void insertAtIndexInAppStateRefData(int index, DtRefTableStruct value) {
    appStateRefData.insert(index, value);
  }

  int _currentLanguage = 1;
  int get currentLanguage => _currentLanguage;
  set currentLanguage(int value) {
    _currentLanguage = value;
    prefs.setInt('ff_currentLanguage', value);
  }

  List<DtFlagsStruct> _flags = [];
  List<DtFlagsStruct> get flags => _flags;
  set flags(List<DtFlagsStruct> value) {
    _flags = value;
    prefs.setStringList('ff_flags', value.map((x) => x.serialize()).toList());
  }

  void addToFlags(DtFlagsStruct value) {
    flags.add(value);
    prefs.setStringList('ff_flags', _flags.map((x) => x.serialize()).toList());
  }

  void removeFromFlags(DtFlagsStruct value) {
    flags.remove(value);
    prefs.setStringList('ff_flags', _flags.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFlags(int index) {
    flags.removeAt(index);
    prefs.setStringList('ff_flags', _flags.map((x) => x.serialize()).toList());
  }

  void updateFlagsAtIndex(
    int index,
    DtFlagsStruct Function(DtFlagsStruct) updateFn,
  ) {
    flags[index] = updateFn(_flags[index]);
    prefs.setStringList('ff_flags', _flags.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFlags(int index, DtFlagsStruct value) {
    flags.insert(index, value);
    prefs.setStringList('ff_flags', _flags.map((x) => x.serialize()).toList());
  }

  List<DtRefCitiesStruct> _refCities = [];
  List<DtRefCitiesStruct> get refCities => _refCities;
  set refCities(List<DtRefCitiesStruct> value) {
    _refCities = value;
  }

  void addToRefCities(DtRefCitiesStruct value) {
    refCities.add(value);
  }

  void removeFromRefCities(DtRefCitiesStruct value) {
    refCities.remove(value);
  }

  void removeAtIndexFromRefCities(int index) {
    refCities.removeAt(index);
  }

  void updateRefCitiesAtIndex(
    int index,
    DtRefCitiesStruct Function(DtRefCitiesStruct) updateFn,
  ) {
    refCities[index] = updateFn(_refCities[index]);
  }

  void insertAtIndexInRefCities(int index, DtRefCitiesStruct value) {
    refCities.insert(index, value);
  }

  int _selectedNavTab = 0;
  int get selectedNavTab => _selectedNavTab;
  set selectedNavTab(int value) {
    _selectedNavTab = value;
  }

  List<DtGovernateStruct> _refGovernate = [];
  List<DtGovernateStruct> get refGovernate => _refGovernate;
  set refGovernate(List<DtGovernateStruct> value) {
    _refGovernate = value;
    prefs.setStringList(
        'ff_refGovernate', value.map((x) => x.serialize()).toList());
  }

  void addToRefGovernate(DtGovernateStruct value) {
    refGovernate.add(value);
    prefs.setStringList(
        'ff_refGovernate', _refGovernate.map((x) => x.serialize()).toList());
  }

  void removeFromRefGovernate(DtGovernateStruct value) {
    refGovernate.remove(value);
    prefs.setStringList(
        'ff_refGovernate', _refGovernate.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefGovernate(int index) {
    refGovernate.removeAt(index);
    prefs.setStringList(
        'ff_refGovernate', _refGovernate.map((x) => x.serialize()).toList());
  }

  void updateRefGovernateAtIndex(
    int index,
    DtGovernateStruct Function(DtGovernateStruct) updateFn,
  ) {
    refGovernate[index] = updateFn(_refGovernate[index]);
    prefs.setStringList(
        'ff_refGovernate', _refGovernate.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefGovernate(int index, DtGovernateStruct value) {
    refGovernate.insert(index, value);
    prefs.setStringList(
        'ff_refGovernate', _refGovernate.map((x) => x.serialize()).toList());
  }

  List<DtZoneStruct> _refZone = [];
  List<DtZoneStruct> get refZone => _refZone;
  set refZone(List<DtZoneStruct> value) {
    _refZone = value;
    prefs.setStringList('ff_refZone', value.map((x) => x.serialize()).toList());
  }

  void addToRefZone(DtZoneStruct value) {
    refZone.add(value);
    prefs.setStringList(
        'ff_refZone', _refZone.map((x) => x.serialize()).toList());
  }

  void removeFromRefZone(DtZoneStruct value) {
    refZone.remove(value);
    prefs.setStringList(
        'ff_refZone', _refZone.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefZone(int index) {
    refZone.removeAt(index);
    prefs.setStringList(
        'ff_refZone', _refZone.map((x) => x.serialize()).toList());
  }

  void updateRefZoneAtIndex(
    int index,
    DtZoneStruct Function(DtZoneStruct) updateFn,
  ) {
    refZone[index] = updateFn(_refZone[index]);
    prefs.setStringList(
        'ff_refZone', _refZone.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefZone(int index, DtZoneStruct value) {
    refZone.insert(index, value);
    prefs.setStringList(
        'ff_refZone', _refZone.map((x) => x.serialize()).toList());
  }

  List<DtAreaStruct> _refArea = [];
  List<DtAreaStruct> get refArea => _refArea;
  set refArea(List<DtAreaStruct> value) {
    _refArea = value;
    prefs.setStringList('ff_refArea', value.map((x) => x.serialize()).toList());
  }

  void addToRefArea(DtAreaStruct value) {
    refArea.add(value);
    prefs.setStringList(
        'ff_refArea', _refArea.map((x) => x.serialize()).toList());
  }

  void removeFromRefArea(DtAreaStruct value) {
    refArea.remove(value);
    prefs.setStringList(
        'ff_refArea', _refArea.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefArea(int index) {
    refArea.removeAt(index);
    prefs.setStringList(
        'ff_refArea', _refArea.map((x) => x.serialize()).toList());
  }

  void updateRefAreaAtIndex(
    int index,
    DtAreaStruct Function(DtAreaStruct) updateFn,
  ) {
    refArea[index] = updateFn(_refArea[index]);
    prefs.setStringList(
        'ff_refArea', _refArea.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefArea(int index, DtAreaStruct value) {
    refArea.insert(index, value);
    prefs.setStringList(
        'ff_refArea', _refArea.map((x) => x.serialize()).toList());
  }

  List<DtCategoryStruct> _refCategory = [];
  List<DtCategoryStruct> get refCategory => _refCategory;
  set refCategory(List<DtCategoryStruct> value) {
    _refCategory = value;
    prefs.setStringList(
        'ff_refCategory', value.map((x) => x.serialize()).toList());
  }

  void addToRefCategory(DtCategoryStruct value) {
    refCategory.add(value);
    prefs.setStringList(
        'ff_refCategory', _refCategory.map((x) => x.serialize()).toList());
  }

  void removeFromRefCategory(DtCategoryStruct value) {
    refCategory.remove(value);
    prefs.setStringList(
        'ff_refCategory', _refCategory.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefCategory(int index) {
    refCategory.removeAt(index);
    prefs.setStringList(
        'ff_refCategory', _refCategory.map((x) => x.serialize()).toList());
  }

  void updateRefCategoryAtIndex(
    int index,
    DtCategoryStruct Function(DtCategoryStruct) updateFn,
  ) {
    refCategory[index] = updateFn(_refCategory[index]);
    prefs.setStringList(
        'ff_refCategory', _refCategory.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefCategory(int index, DtCategoryStruct value) {
    refCategory.insert(index, value);
    prefs.setStringList(
        'ff_refCategory', _refCategory.map((x) => x.serialize()).toList());
  }

  List<DtSubCategoryStruct> _refSubCategory = [];
  List<DtSubCategoryStruct> get refSubCategory => _refSubCategory;
  set refSubCategory(List<DtSubCategoryStruct> value) {
    _refSubCategory = value;
    prefs.setStringList(
        'ff_refSubCategory', value.map((x) => x.serialize()).toList());
  }

  void addToRefSubCategory(DtSubCategoryStruct value) {
    refSubCategory.add(value);
    prefs.setStringList('ff_refSubCategory',
        _refSubCategory.map((x) => x.serialize()).toList());
  }

  void removeFromRefSubCategory(DtSubCategoryStruct value) {
    refSubCategory.remove(value);
    prefs.setStringList('ff_refSubCategory',
        _refSubCategory.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefSubCategory(int index) {
    refSubCategory.removeAt(index);
    prefs.setStringList('ff_refSubCategory',
        _refSubCategory.map((x) => x.serialize()).toList());
  }

  void updateRefSubCategoryAtIndex(
    int index,
    DtSubCategoryStruct Function(DtSubCategoryStruct) updateFn,
  ) {
    refSubCategory[index] = updateFn(_refSubCategory[index]);
    prefs.setStringList('ff_refSubCategory',
        _refSubCategory.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefSubCategory(int index, DtSubCategoryStruct value) {
    refSubCategory.insert(index, value);
    prefs.setStringList('ff_refSubCategory',
        _refSubCategory.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
