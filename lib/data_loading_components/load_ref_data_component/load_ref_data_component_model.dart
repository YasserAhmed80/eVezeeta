import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'load_ref_data_component_widget.dart' show LoadRefDataComponentWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class LoadRefDataComponentModel
    extends FlutterFlowModel<LoadRefDataComponentWidget> {
  ///  Local state fields for this component.

  int? loopIndex = 0;

  int? loopMax;

  bool isLoadingCompleted = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }

  /// Action blocks.
  Future loadCategoryAction(BuildContext context) async {
    List<CategoryRecord>? catDocss;
    List<CategorySubRecord>? subCatDocss;

    if ((FFAppState().refCategory.isEmpty) ||
        (FFAppState().lastDataLoading.reLoadCategory == true)) {
      catDocss = await queryCategoryRecordOnce(
        queryBuilder: (categoryRecord) => categoryRecord.orderBy('seq'),
      );
      loopMax = catDocss.length;
      loopIndex = 0;
      FFAppState().refCategory = [];
      FFAppState().refSubCategory = [];
      while (loopIndex! < loopMax!) {
        FFAppState().addToRefCategory(DtCategoryStruct(
          catKey: catDocss[loopIndex!].catKey,
          desc: catDocss[loopIndex!].desc,
          seq: catDocss[loopIndex!].seq,
        ));
        loopIndex = loopIndex! + 1;
      }
      // sub categories
      subCatDocss = await queryCategorySubRecordOnce(
        queryBuilder: (categorySubRecord) => categorySubRecord.orderBy('seq'),
      );
      loopMax = subCatDocss.length;
      loopIndex = 0;
      while (loopIndex! < loopMax!) {
        FFAppState().addToRefSubCategory(DtSubCategoryStruct(
          subKey: subCatDocss[loopIndex!].subKey,
          catCde: subCatDocss[loopIndex!].catCde,
          desc: subCatDocss[loopIndex!].desc,
          seq: subCatDocss[loopIndex!].seq,
        ));
        loopIndex = loopIndex! + 1;
      }
    } else {
      return;
    }

    FFAppState().updateLastDataLoadingStruct(
      (e) => e..reLoadCategory = false,
    );
  }

  Future checkDataLoadingAction(BuildContext context) async {
    LastDataLoadingRecord? returnedLoadingData;

    returnedLoadingData = await queryLastDataLoadingRecordOnce(
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (returnedLoadingData?.cityDate !=
        FFAppState().lastDataLoading.ciityDate) {
      FFAppState().updateLastDataLoadingStruct(
        (e) => e
          ..ciityDate = returnedLoadingData?.cityDate
          ..reLoadCities = true,
      );
    }
    if (returnedLoadingData?.categoryDate !=
        FFAppState().lastDataLoading.categoryDate) {
      FFAppState().updateLastDataLoadingStruct(
        (e) => e
          ..categoryDate = returnedLoadingData?.categoryDate
          ..reLoadCategory = true,
      );
    }
    if (returnedLoadingData?.daysDate !=
        FFAppState().lastDataLoading.daysDate) {
      FFAppState().updateLastDataLoadingStruct(
        (e) => e
          ..daysDate = returnedLoadingData?.daysDate
          ..reLoadDays = true,
      );
    }
  }

  Future loadCityAction(BuildContext context) async {
    List<GovernateRecord>? governateDocs;
    List<GovernZoneRecord>? zoneDocs;
    List<ZoneAreaRecord>? areaDocs;

    if ((FFAppState().refGovernate.isEmpty) ||
        (FFAppState().lastDataLoading.reLoadCities == true)) {
      governateDocs = await queryGovernateRecordOnce();
      loopMax = governateDocs.length;
      loopIndex = 0;
      FFAppState().refGovernate = [];
      while (loopIndex! < loopMax!) {
        FFAppState().addToRefGovernate(DtGovernateStruct(
          govKey: governateDocs[loopIndex!].govKey,
          desc: governateDocs[loopIndex!].desc,
          cntryCde: governateDocs[loopIndex!].cntryCde,
        ));
        loopIndex = loopIndex! + 1;
      }
      zoneDocs = await queryGovernZoneRecordOnce();
      loopMax = zoneDocs.length;
      loopIndex = 0;
      FFAppState().refZone = [];
      while (loopIndex! < loopMax!) {
        FFAppState().addToRefZone(DtZoneStruct(
          zoneKey: zoneDocs[loopIndex!].zoneKey,
          govCde: zoneDocs[loopIndex!].governCde,
          desc: zoneDocs[loopIndex!].desc,
        ));
        loopIndex = loopIndex! + 1;
      }
    } else {
      return;
    }

    areaDocs = await queryZoneAreaRecordOnce();
    loopMax = areaDocs.length;
    loopIndex = 0;
    FFAppState().refArea = [];
    while (loopIndex! < loopMax!) {
      FFAppState().addToRefArea(DtAreaStruct(
        areaKey: areaDocs[loopIndex!].areaKey,
        zoneCde: areaDocs[loopIndex!].zoneCde,
        desc: areaDocs[loopIndex!].desc,
      ));
      loopIndex = loopIndex! + 1;
    }
    FFAppState().updateLastDataLoadingStruct(
      (e) => e..reLoadCities = false,
    );
  }

  Future loadDaysAction(BuildContext context) async {
    List<DayRefRecord>? returnedDays;
    List<HourRefRecord>? returnedHours;

    if ((FFAppState().refDay.isEmpty) ||
        (FFAppState().lastDataLoading.reLoadDays == true)) {
      // day Data
      returnedDays = await queryDayRefRecordOnce(
        queryBuilder: (dayRefRecord) => dayRefRecord.orderBy('seq'),
      );
      loopMax = returnedDays.length;
      loopIndex = 0;
      FFAppState().refDay = [];
      while (loopIndex! < loopMax!) {
        FFAppState().addToRefDay(DtDayStruct(
          dayKey: returnedDays[loopIndex!].dayKey,
          desc: returnedDays[loopIndex!].desc,
          seq: returnedDays[loopIndex!].seq,
          lngCde: returnedDays[loopIndex!].lngCde,
          descEng: returnedDays[loopIndex!].descEng,
        ));
        loopIndex = loopIndex! + 1;
      }
      returnedHours = await queryHourRefRecordOnce(
        queryBuilder: (hourRefRecord) => hourRefRecord.orderBy('seq'),
      );
      loopMax = returnedHours.length;
      loopIndex = 0;
      FFAppState().refHour = [];
      while (loopIndex! < loopMax!) {
        FFAppState().addToRefHour(DtHourStruct(
          hourKey: returnedHours[loopIndex!].hourKey,
          desc: returnedHours[loopIndex!].desc,
          period: returnedHours[loopIndex!].period,
          seq: returnedHours[loopIndex!].seq,
          lngCde: returnedHours[loopIndex!].lngCde,
        ));
        loopIndex = loopIndex! + 1;
      }
    } else {
      return;
    }

    FFAppState().updateLastDataLoadingStruct(
      (e) => e..reLoadDays = false,
    );
  }
}
