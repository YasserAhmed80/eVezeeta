import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'load_cities_coponent_model.dart';
export 'load_cities_coponent_model.dart';

class LoadCitiesCoponentWidget extends StatefulWidget {
  const LoadCitiesCoponentWidget({super.key});

  @override
  State<LoadCitiesCoponentWidget> createState() =>
      _LoadCitiesCoponentWidgetState();
}

class _LoadCitiesCoponentWidgetState extends State<LoadCitiesCoponentWidget> {
  late LoadCitiesCoponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadCitiesCoponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().refGovernate.isEmpty) ||
          (FFAppState().lastDataLoading.reLoadCities == true)) {
        _model.governateDocs = await queryGovernateRecordOnce();
        _model.loopMax = _model.governateDocs?.length;
        safeSetState(() {});
        FFAppState().refGovernate = [];
        safeSetState(() {});
        while (_model.loopIndex! < _model.loopMax!) {
          FFAppState().addToRefGovernate(DtGovernateStruct(
            govKey: _model.governateDocs?[_model.loopIndex!].govKey,
            desc: _model.governateDocs?[_model.loopIndex!].desc,
            cntryCde: _model.governateDocs?[_model.loopIndex!].cntryCde,
          ));
          safeSetState(() {});
          _model.loopIndex = _model.loopIndex! + 1;
          safeSetState(() {});
        }
        _model.zoneDocs = await queryGovernZoneRecordOnce();
        _model.loopMax = _model.zoneDocs?.length;
        _model.loopIndex = 0;
        safeSetState(() {});
        FFAppState().refZone = [];
        safeSetState(() {});
        while (_model.loopIndex! < _model.loopMax!) {
          FFAppState().addToRefZone(DtZoneStruct(
            zoneKey: _model.zoneDocs?[_model.loopIndex!].zoneKey,
            govCde: _model.zoneDocs?[_model.loopIndex!].governCde,
            desc: _model.zoneDocs?[_model.loopIndex!].desc,
          ));
          safeSetState(() {});
          _model.loopIndex = _model.loopIndex! + 1;
          safeSetState(() {});
        }
      } else {
        return;
      }

      _model.areaDocs = await queryZoneAreaRecordOnce();
      _model.loopMax = _model.areaDocs?.length;
      _model.loopIndex = 0;
      safeSetState(() {});
      FFAppState().refArea = [];
      safeSetState(() {});
      while (_model.loopIndex! < _model.loopMax!) {
        FFAppState().addToRefArea(DtAreaStruct(
          areaKey: _model.areaDocs?[_model.loopIndex!].areaKey,
          zoneCde: _model.areaDocs?[_model.loopIndex!].zoneCde,
          desc: _model.areaDocs?[_model.loopIndex!].desc,
        ));
        safeSetState(() {});
        _model.loopIndex = _model.loopIndex! + 1;
        safeSetState(() {});
      }
      FFAppState().updateLastDataLoadingStruct(
        (e) => e..reLoadCities = false,
      );
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
