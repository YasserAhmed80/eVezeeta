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
    _safeInit(() {
      _refDocTitle = prefs
              .getStringList('ff_refDocTitle')
              ?.map((x) {
                try {
                  return DtDocTitleStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refDocTitle;
    });
    _safeInit(() {
      _refDocType = prefs
              .getStringList('ff_refDocType')
              ?.map((x) {
                try {
                  return DtDocTypeStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refDocType;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentDoctor')) {
        try {
          final serializedData = prefs.getString('ff_currentDoctor') ?? '{}';
          _currentDoctor =
              DtDoctorStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _refDay = prefs
              .getStringList('ff_refDay')
              ?.map((x) {
                try {
                  return DtDayStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refDay;
    });
    _safeInit(() {
      _refHour = prefs
              .getStringList('ff_refHour')
              ?.map((x) {
                try {
                  return DtHourStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refHour;
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

  List<DtDocTitleStruct> _refDocTitle = [
    DtDocTitleStruct.fromSerializableMap(jsonDecode(
        '{\"title_key\":\"1\",\"desc\":\"أستاذ\",\"lng_cde\":\"1\"}')),
    DtDocTitleStruct.fromSerializableMap(jsonDecode(
        '{\"title_key\":\"2\",\"desc\":\"مدرس\",\"lng_cde\":\"1\"}')),
    DtDocTitleStruct.fromSerializableMap(jsonDecode(
        '{\"title_key\":\"3\",\"desc\":\"أخصائي\",\"lng_cde\":\"1\"}')),
    DtDocTitleStruct.fromSerializableMap(jsonDecode(
        '{\"title_key\":\"4\",\"desc\":\"استشاري\",\"lng_cde\":\"1\"}'))
  ];
  List<DtDocTitleStruct> get refDocTitle => _refDocTitle;
  set refDocTitle(List<DtDocTitleStruct> value) {
    _refDocTitle = value;
    prefs.setStringList(
        'ff_refDocTitle', value.map((x) => x.serialize()).toList());
  }

  void addToRefDocTitle(DtDocTitleStruct value) {
    refDocTitle.add(value);
    prefs.setStringList(
        'ff_refDocTitle', _refDocTitle.map((x) => x.serialize()).toList());
  }

  void removeFromRefDocTitle(DtDocTitleStruct value) {
    refDocTitle.remove(value);
    prefs.setStringList(
        'ff_refDocTitle', _refDocTitle.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefDocTitle(int index) {
    refDocTitle.removeAt(index);
    prefs.setStringList(
        'ff_refDocTitle', _refDocTitle.map((x) => x.serialize()).toList());
  }

  void updateRefDocTitleAtIndex(
    int index,
    DtDocTitleStruct Function(DtDocTitleStruct) updateFn,
  ) {
    refDocTitle[index] = updateFn(_refDocTitle[index]);
    prefs.setStringList(
        'ff_refDocTitle', _refDocTitle.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefDocTitle(int index, DtDocTitleStruct value) {
    refDocTitle.insert(index, value);
    prefs.setStringList(
        'ff_refDocTitle', _refDocTitle.map((x) => x.serialize()).toList());
  }

  List<DtDocTypeStruct> _refDocType = [
    DtDocTypeStruct.fromSerializableMap(jsonDecode(
        '{\"type_key\":\"0\",\"desc\":\"دكتورة\",\"lng_cde\":\"1\"}')),
    DtDocTypeStruct.fromSerializableMap(
        jsonDecode('{\"type_key\":\"1\",\"desc\":\"دكتور\",\"lng_cde\":\"1\"}'))
  ];
  List<DtDocTypeStruct> get refDocType => _refDocType;
  set refDocType(List<DtDocTypeStruct> value) {
    _refDocType = value;
    prefs.setStringList(
        'ff_refDocType', value.map((x) => x.serialize()).toList());
  }

  void addToRefDocType(DtDocTypeStruct value) {
    refDocType.add(value);
    prefs.setStringList(
        'ff_refDocType', _refDocType.map((x) => x.serialize()).toList());
  }

  void removeFromRefDocType(DtDocTypeStruct value) {
    refDocType.remove(value);
    prefs.setStringList(
        'ff_refDocType', _refDocType.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefDocType(int index) {
    refDocType.removeAt(index);
    prefs.setStringList(
        'ff_refDocType', _refDocType.map((x) => x.serialize()).toList());
  }

  void updateRefDocTypeAtIndex(
    int index,
    DtDocTypeStruct Function(DtDocTypeStruct) updateFn,
  ) {
    refDocType[index] = updateFn(_refDocType[index]);
    prefs.setStringList(
        'ff_refDocType', _refDocType.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefDocType(int index, DtDocTypeStruct value) {
    refDocType.insert(index, value);
    prefs.setStringList(
        'ff_refDocType', _refDocType.map((x) => x.serialize()).toList());
  }

  DtDoctorStruct _currentDoctor = DtDoctorStruct();
  DtDoctorStruct get currentDoctor => _currentDoctor;
  set currentDoctor(DtDoctorStruct value) {
    _currentDoctor = value;
    prefs.setString('ff_currentDoctor', value.serialize());
  }

  void updateCurrentDoctorStruct(Function(DtDoctorStruct) updateFn) {
    updateFn(_currentDoctor);
    prefs.setString('ff_currentDoctor', _currentDoctor.serialize());
  }

  List<DtDayStruct> _refDay = [];
  List<DtDayStruct> get refDay => _refDay;
  set refDay(List<DtDayStruct> value) {
    _refDay = value;
    prefs.setStringList('ff_refDay', value.map((x) => x.serialize()).toList());
  }

  void addToRefDay(DtDayStruct value) {
    refDay.add(value);
    prefs.setStringList(
        'ff_refDay', _refDay.map((x) => x.serialize()).toList());
  }

  void removeFromRefDay(DtDayStruct value) {
    refDay.remove(value);
    prefs.setStringList(
        'ff_refDay', _refDay.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefDay(int index) {
    refDay.removeAt(index);
    prefs.setStringList(
        'ff_refDay', _refDay.map((x) => x.serialize()).toList());
  }

  void updateRefDayAtIndex(
    int index,
    DtDayStruct Function(DtDayStruct) updateFn,
  ) {
    refDay[index] = updateFn(_refDay[index]);
    prefs.setStringList(
        'ff_refDay', _refDay.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefDay(int index, DtDayStruct value) {
    refDay.insert(index, value);
    prefs.setStringList(
        'ff_refDay', _refDay.map((x) => x.serialize()).toList());
  }

  List<DtHourStruct> _refHour = [];
  List<DtHourStruct> get refHour => _refHour;
  set refHour(List<DtHourStruct> value) {
    _refHour = value;
    prefs.setStringList('ff_refHour', value.map((x) => x.serialize()).toList());
  }

  void addToRefHour(DtHourStruct value) {
    refHour.add(value);
    prefs.setStringList(
        'ff_refHour', _refHour.map((x) => x.serialize()).toList());
  }

  void removeFromRefHour(DtHourStruct value) {
    refHour.remove(value);
    prefs.setStringList(
        'ff_refHour', _refHour.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefHour(int index) {
    refHour.removeAt(index);
    prefs.setStringList(
        'ff_refHour', _refHour.map((x) => x.serialize()).toList());
  }

  void updateRefHourAtIndex(
    int index,
    DtHourStruct Function(DtHourStruct) updateFn,
  ) {
    refHour[index] = updateFn(_refHour[index]);
    prefs.setStringList(
        'ff_refHour', _refHour.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefHour(int index, DtHourStruct value) {
    refHour.insert(index, value);
    prefs.setStringList(
        'ff_refHour', _refHour.map((x) => x.serialize()).toList());
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
