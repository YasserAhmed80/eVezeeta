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
