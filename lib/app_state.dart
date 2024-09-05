import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
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
    _safeInit(() {
      _isLightMode = prefs.getBool('ff_isLightMode') ?? _isLightMode;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_searchParameters')) {
        try {
          final serializedData = prefs.getString('ff_searchParameters') ?? '{}';
          _searchParameters = DtSearchParametersStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _docSearchItems = prefs
              .getStringList('ff_docSearchItems')
              ?.map((x) {
                try {
                  return DtDocSearchItemStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _docSearchItems;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_lastDataLoading')) {
        try {
          final serializedData = prefs.getString('ff_lastDataLoading') ?? '{}';
          _lastDataLoading = DtLastLoadingStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _refBookStatus = prefs
              .getStringList('ff_refBookStatus')
              ?.map((x) {
                try {
                  return DtBookStatusStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refBookStatus;
    });
    _safeInit(() {
      _refBookingType = prefs
              .getStringList('ff_refBookingType')
              ?.map((x) {
                try {
                  return DtGeneralListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refBookingType;
    });
    _safeInit(() {
      _refGender = prefs
              .getStringList('ff_refGender')
              ?.map((x) {
                try {
                  return DtGeneralListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refGender;
    });
    _safeInit(() {
      _currentProfileType =
          prefs.getInt('ff_currentProfileType') ?? _currentProfileType;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentCustomer')) {
        try {
          final serializedData = prefs.getString('ff_currentCustomer') ?? '{}';
          _currentCustomer =
              DtCusStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _selectedNavTab = prefs.containsKey('ff_selectedNavTab')
          ? deserializeEnum<EnumSelectedTab>(
              prefs.getString('ff_selectedNavTab'))
          : _selectedNavTab;
    });
    _safeInit(() {
      _refDoctorStatus = prefs
              .getStringList('ff_refDoctorStatus')
              ?.map((x) {
                try {
                  return DtGeneralListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refDoctorStatus;
    });
    _safeInit(() {
      _refCustomerFiles = prefs
              .getStringList('ff_refCustomerFiles')
              ?.map((x) {
                try {
                  return DtGeneralListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _refCustomerFiles;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentFileCustomer')) {
        try {
          final serializedData =
              prefs.getString('ff_currentFileCustomer') ?? '{}';
          _currentFileCustomer = DtCustomerFileStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
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

  bool _isLightMode = true;
  bool get isLightMode => _isLightMode;
  set isLightMode(bool value) {
    _isLightMode = value;
    prefs.setBool('ff_isLightMode', value);
  }

  DtSearchParametersStruct _searchParameters = DtSearchParametersStruct();
  DtSearchParametersStruct get searchParameters => _searchParameters;
  set searchParameters(DtSearchParametersStruct value) {
    _searchParameters = value;
    prefs.setString('ff_searchParameters', value.serialize());
  }

  void updateSearchParametersStruct(
      Function(DtSearchParametersStruct) updateFn) {
    updateFn(_searchParameters);
    prefs.setString('ff_searchParameters', _searchParameters.serialize());
  }

  List<DtDocSearchItemStruct> _docSearchItems = [
    DtDocSearchItemStruct.fromSerializableMap(jsonDecode(
        '{\"item_type\":\"type\",\"item_desc\":\"النوع\",\"dialog_desc\":\"اختار النوع\",\"isActive\":\"false\"}')),
    DtDocSearchItemStruct.fromSerializableMap(jsonDecode(
        '{\"item_type\":\"title\",\"item_desc\":\"اللقب\",\"dialog_desc\":\"اختار اللقب\"}')),
    DtDocSearchItemStruct.fromSerializableMap(jsonDecode(
        '{\"item_type\":\"price\",\"item_desc\":\"سعر الكشف\",\"dialog_desc\":\"اختار السعر\"}')),
    DtDocSearchItemStruct.fromSerializableMap(jsonDecode(
        '{\"item_type\":\"time\",\"item_desc\":\"المواعيد\",\"dialog_desc\":\"اختار المواعيد\"}')),
    DtDocSearchItemStruct.fromSerializableMap(jsonDecode(
        '{\"item_type\":\"filter\",\"item_desc\":\"التصفية\",\"dialog_desc\":\"التصفية\",\"isActive\":\"false\"}'))
  ];
  List<DtDocSearchItemStruct> get docSearchItems => _docSearchItems;
  set docSearchItems(List<DtDocSearchItemStruct> value) {
    _docSearchItems = value;
    prefs.setStringList(
        'ff_docSearchItems', value.map((x) => x.serialize()).toList());
  }

  void addToDocSearchItems(DtDocSearchItemStruct value) {
    docSearchItems.add(value);
    prefs.setStringList('ff_docSearchItems',
        _docSearchItems.map((x) => x.serialize()).toList());
  }

  void removeFromDocSearchItems(DtDocSearchItemStruct value) {
    docSearchItems.remove(value);
    prefs.setStringList('ff_docSearchItems',
        _docSearchItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDocSearchItems(int index) {
    docSearchItems.removeAt(index);
    prefs.setStringList('ff_docSearchItems',
        _docSearchItems.map((x) => x.serialize()).toList());
  }

  void updateDocSearchItemsAtIndex(
    int index,
    DtDocSearchItemStruct Function(DtDocSearchItemStruct) updateFn,
  ) {
    docSearchItems[index] = updateFn(_docSearchItems[index]);
    prefs.setStringList('ff_docSearchItems',
        _docSearchItems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDocSearchItems(int index, DtDocSearchItemStruct value) {
    docSearchItems.insert(index, value);
    prefs.setStringList('ff_docSearchItems',
        _docSearchItems.map((x) => x.serialize()).toList());
  }

  DtLastLoadingStruct _lastDataLoading =
      DtLastLoadingStruct.fromSerializableMap(jsonDecode(
          '{\"ciity_date\":\"1722493140000\",\"category_date\":\"1722493140000\",\"days_date\":\"1722493140000\"}'));
  DtLastLoadingStruct get lastDataLoading => _lastDataLoading;
  set lastDataLoading(DtLastLoadingStruct value) {
    _lastDataLoading = value;
    prefs.setString('ff_lastDataLoading', value.serialize());
  }

  void updateLastDataLoadingStruct(Function(DtLastLoadingStruct) updateFn) {
    updateFn(_lastDataLoading);
    prefs.setString('ff_lastDataLoading', _lastDataLoading.serialize());
  }

  List<DtBookStatusStruct> _refBookStatus = [
    DtBookStatusStruct.fromSerializableMap(
        jsonDecode('{\"code\":\"1\",\"color\":\"#4caf50\",\"desc\":\"جديد\"}')),
    DtBookStatusStruct.fromSerializableMap(
        jsonDecode('{\"code\":\"2\",\"color\":\"#2257f9\",\"desc\":\"مؤكد\"}')),
    DtBookStatusStruct.fromSerializableMap(
        jsonDecode('{\"code\":\"4\",\"color\":\"#f44336\",\"desc\":\"ملغي\"}')),
    DtBookStatusStruct.fromSerializableMap(jsonDecode(
        '{\"code\":\"3\",\"color\":\"#8bc34a\",\"desc\":\"تم الكشف\"}'))
  ];
  List<DtBookStatusStruct> get refBookStatus => _refBookStatus;
  set refBookStatus(List<DtBookStatusStruct> value) {
    _refBookStatus = value;
    prefs.setStringList(
        'ff_refBookStatus', value.map((x) => x.serialize()).toList());
  }

  void addToRefBookStatus(DtBookStatusStruct value) {
    refBookStatus.add(value);
    prefs.setStringList(
        'ff_refBookStatus', _refBookStatus.map((x) => x.serialize()).toList());
  }

  void removeFromRefBookStatus(DtBookStatusStruct value) {
    refBookStatus.remove(value);
    prefs.setStringList(
        'ff_refBookStatus', _refBookStatus.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefBookStatus(int index) {
    refBookStatus.removeAt(index);
    prefs.setStringList(
        'ff_refBookStatus', _refBookStatus.map((x) => x.serialize()).toList());
  }

  void updateRefBookStatusAtIndex(
    int index,
    DtBookStatusStruct Function(DtBookStatusStruct) updateFn,
  ) {
    refBookStatus[index] = updateFn(_refBookStatus[index]);
    prefs.setStringList(
        'ff_refBookStatus', _refBookStatus.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefBookStatus(int index, DtBookStatusStruct value) {
    refBookStatus.insert(index, value);
    prefs.setStringList(
        'ff_refBookStatus', _refBookStatus.map((x) => x.serialize()).toList());
  }

  List<DtGeneralListStruct> _refBookingType = [
    DtGeneralListStruct.fromSerializableMap(jsonDecode(
        '{\"key\":\"1\",\"desc\":\"الحجز مسبقا و الدخول بأسبقية الحضور\"}')),
    DtGeneralListStruct.fromSerializableMap(
        jsonDecode('{\"key\":\"0\",\"desc\":\"Hello World\"}'))
  ];
  List<DtGeneralListStruct> get refBookingType => _refBookingType;
  set refBookingType(List<DtGeneralListStruct> value) {
    _refBookingType = value;
    prefs.setStringList(
        'ff_refBookingType', value.map((x) => x.serialize()).toList());
  }

  void addToRefBookingType(DtGeneralListStruct value) {
    refBookingType.add(value);
    prefs.setStringList('ff_refBookingType',
        _refBookingType.map((x) => x.serialize()).toList());
  }

  void removeFromRefBookingType(DtGeneralListStruct value) {
    refBookingType.remove(value);
    prefs.setStringList('ff_refBookingType',
        _refBookingType.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefBookingType(int index) {
    refBookingType.removeAt(index);
    prefs.setStringList('ff_refBookingType',
        _refBookingType.map((x) => x.serialize()).toList());
  }

  void updateRefBookingTypeAtIndex(
    int index,
    DtGeneralListStruct Function(DtGeneralListStruct) updateFn,
  ) {
    refBookingType[index] = updateFn(_refBookingType[index]);
    prefs.setStringList('ff_refBookingType',
        _refBookingType.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefBookingType(int index, DtGeneralListStruct value) {
    refBookingType.insert(index, value);
    prefs.setStringList('ff_refBookingType',
        _refBookingType.map((x) => x.serialize()).toList());
  }

  int _subscrptionFee = 200;
  int get subscrptionFee => _subscrptionFee;
  set subscrptionFee(int value) {
    _subscrptionFee = value;
  }

  List<DtGeneralListStruct> _refGender = [
    DtGeneralListStruct.fromSerializableMap(
        jsonDecode('{\"key\":\"0\",\"desc\":\"انثي\",\"lng_cde\":\"0\"}')),
    DtGeneralListStruct.fromSerializableMap(
        jsonDecode('{\"key\":\"1\",\"desc\":\"ذكر\",\"lng_cde\":\"0\"}'))
  ];
  List<DtGeneralListStruct> get refGender => _refGender;
  set refGender(List<DtGeneralListStruct> value) {
    _refGender = value;
    prefs.setStringList(
        'ff_refGender', value.map((x) => x.serialize()).toList());
  }

  void addToRefGender(DtGeneralListStruct value) {
    refGender.add(value);
    prefs.setStringList(
        'ff_refGender', _refGender.map((x) => x.serialize()).toList());
  }

  void removeFromRefGender(DtGeneralListStruct value) {
    refGender.remove(value);
    prefs.setStringList(
        'ff_refGender', _refGender.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefGender(int index) {
    refGender.removeAt(index);
    prefs.setStringList(
        'ff_refGender', _refGender.map((x) => x.serialize()).toList());
  }

  void updateRefGenderAtIndex(
    int index,
    DtGeneralListStruct Function(DtGeneralListStruct) updateFn,
  ) {
    refGender[index] = updateFn(_refGender[index]);
    prefs.setStringList(
        'ff_refGender', _refGender.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefGender(int index, DtGeneralListStruct value) {
    refGender.insert(index, value);
    prefs.setStringList(
        'ff_refGender', _refGender.map((x) => x.serialize()).toList());
  }

  int _currentProfileType = 1;
  int get currentProfileType => _currentProfileType;
  set currentProfileType(int value) {
    _currentProfileType = value;
    prefs.setInt('ff_currentProfileType', value);
  }

  DtCusStruct _currentCustomer = DtCusStruct();
  DtCusStruct get currentCustomer => _currentCustomer;
  set currentCustomer(DtCusStruct value) {
    _currentCustomer = value;
    prefs.setString('ff_currentCustomer', value.serialize());
  }

  void updateCurrentCustomerStruct(Function(DtCusStruct) updateFn) {
    updateFn(_currentCustomer);
    prefs.setString('ff_currentCustomer', _currentCustomer.serialize());
  }

  EnumSelectedTab? _selectedNavTab = EnumSelectedTab.doctor_search;
  EnumSelectedTab? get selectedNavTab => _selectedNavTab;
  set selectedNavTab(EnumSelectedTab? value) {
    _selectedNavTab = value;
    value != null
        ? prefs.setString('ff_selectedNavTab', value.serialize())
        : prefs.remove('ff_selectedNavTab');
  }

  List<DtGeneralListStruct> _refDoctorStatus = [];
  List<DtGeneralListStruct> get refDoctorStatus => _refDoctorStatus;
  set refDoctorStatus(List<DtGeneralListStruct> value) {
    _refDoctorStatus = value;
    prefs.setStringList(
        'ff_refDoctorStatus', value.map((x) => x.serialize()).toList());
  }

  void addToRefDoctorStatus(DtGeneralListStruct value) {
    refDoctorStatus.add(value);
    prefs.setStringList('ff_refDoctorStatus',
        _refDoctorStatus.map((x) => x.serialize()).toList());
  }

  void removeFromRefDoctorStatus(DtGeneralListStruct value) {
    refDoctorStatus.remove(value);
    prefs.setStringList('ff_refDoctorStatus',
        _refDoctorStatus.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefDoctorStatus(int index) {
    refDoctorStatus.removeAt(index);
    prefs.setStringList('ff_refDoctorStatus',
        _refDoctorStatus.map((x) => x.serialize()).toList());
  }

  void updateRefDoctorStatusAtIndex(
    int index,
    DtGeneralListStruct Function(DtGeneralListStruct) updateFn,
  ) {
    refDoctorStatus[index] = updateFn(_refDoctorStatus[index]);
    prefs.setStringList('ff_refDoctorStatus',
        _refDoctorStatus.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefDoctorStatus(int index, DtGeneralListStruct value) {
    refDoctorStatus.insert(index, value);
    prefs.setStringList('ff_refDoctorStatus',
        _refDoctorStatus.map((x) => x.serialize()).toList());
  }

  List<DtGeneralListStruct> _refCustomerFiles = [
    DtGeneralListStruct.fromSerializableMap(
        jsonDecode('{\"key\":\"1\",\"desc\":\"روشتة\",\"lng_cde\":\"1\"}')),
    DtGeneralListStruct.fromSerializableMap(
        jsonDecode('{\"key\":\"2\",\"desc\":\"تحاليل\",\"lng_cde\":\"1\"}')),
    DtGeneralListStruct.fromSerializableMap(
        jsonDecode('{\"key\":\"3\",\"desc\":\"أشعة\",\"lng_cde\":\"1\"}')),
    DtGeneralListStruct.fromSerializableMap(
        jsonDecode('{\"key\":\"100\",\"desc\":\"اخري\",\"lng_cde\":\"1\"}'))
  ];
  List<DtGeneralListStruct> get refCustomerFiles => _refCustomerFiles;
  set refCustomerFiles(List<DtGeneralListStruct> value) {
    _refCustomerFiles = value;
    prefs.setStringList(
        'ff_refCustomerFiles', value.map((x) => x.serialize()).toList());
  }

  void addToRefCustomerFiles(DtGeneralListStruct value) {
    refCustomerFiles.add(value);
    prefs.setStringList('ff_refCustomerFiles',
        _refCustomerFiles.map((x) => x.serialize()).toList());
  }

  void removeFromRefCustomerFiles(DtGeneralListStruct value) {
    refCustomerFiles.remove(value);
    prefs.setStringList('ff_refCustomerFiles',
        _refCustomerFiles.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRefCustomerFiles(int index) {
    refCustomerFiles.removeAt(index);
    prefs.setStringList('ff_refCustomerFiles',
        _refCustomerFiles.map((x) => x.serialize()).toList());
  }

  void updateRefCustomerFilesAtIndex(
    int index,
    DtGeneralListStruct Function(DtGeneralListStruct) updateFn,
  ) {
    refCustomerFiles[index] = updateFn(_refCustomerFiles[index]);
    prefs.setStringList('ff_refCustomerFiles',
        _refCustomerFiles.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRefCustomerFiles(int index, DtGeneralListStruct value) {
    refCustomerFiles.insert(index, value);
    prefs.setStringList('ff_refCustomerFiles',
        _refCustomerFiles.map((x) => x.serialize()).toList());
  }

  DtCustomerFileStruct _currentFileCustomer = DtCustomerFileStruct();
  DtCustomerFileStruct get currentFileCustomer => _currentFileCustomer;
  set currentFileCustomer(DtCustomerFileStruct value) {
    _currentFileCustomer = value;
    prefs.setString('ff_currentFileCustomer', value.serialize());
  }

  void updateCurrentFileCustomerStruct(
      Function(DtCustomerFileStruct) updateFn) {
    updateFn(_currentFileCustomer);
    prefs.setString('ff_currentFileCustomer', _currentFileCustomer.serialize());
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
