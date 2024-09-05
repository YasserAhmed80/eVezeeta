import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'load_day_hours_data_model.dart';
export 'load_day_hours_data_model.dart';

class LoadDayHoursDataWidget extends StatefulWidget {
  const LoadDayHoursDataWidget({super.key});

  @override
  State<LoadDayHoursDataWidget> createState() => _LoadDayHoursDataWidgetState();
}

class _LoadDayHoursDataWidgetState extends State<LoadDayHoursDataWidget> {
  late LoadDayHoursDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadDayHoursDataModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().refDay.isEmpty) ||
          (FFAppState().lastDataLoading.reLoadDays == true)) {
        // day Data
        _model.dayData = await queryDayRefRecordOnce(
          queryBuilder: (dayRefRecord) => dayRefRecord.orderBy('seq'),
        );
        _model.loopMax = _model.dayData?.length;
        safeSetState(() {});
        FFAppState().refDay = [];
        safeSetState(() {});
        while (_model.loopIndex! < _model.loopMax!) {
          FFAppState().addToRefDay(DtDayStruct(
            dayKey: _model.dayData?[_model.loopIndex!].dayKey,
            desc: _model.dayData?[_model.loopIndex!].desc,
            seq: _model.dayData?[_model.loopIndex!].seq,
            lngCde: _model.dayData?[_model.loopIndex!].lngCde,
            descEng: _model.dayData?[_model.loopIndex!].descEng,
          ));
          safeSetState(() {});
          _model.loopIndex = _model.loopIndex! + 1;
          safeSetState(() {});
        }
        _model.hourData = await queryHourRefRecordOnce(
          queryBuilder: (hourRefRecord) => hourRefRecord.orderBy('seq'),
        );
        _model.loopMax = _model.hourData?.length;
        _model.loopIndex = 0;
        safeSetState(() {});
        FFAppState().refHour = [];
        safeSetState(() {});
        while (_model.loopIndex! < _model.loopMax!) {
          FFAppState().addToRefHour(DtHourStruct(
            hourKey: _model.hourData?[_model.loopIndex!].hourKey,
            desc: _model.hourData?[_model.loopIndex!].desc,
            period: _model.hourData?[_model.loopIndex!].period,
            seq: _model.hourData?[_model.loopIndex!].seq,
            lngCde: _model.hourData?[_model.loopIndex!].lngCde,
          ));
          safeSetState(() {});
          _model.loopIndex = _model.loopIndex! + 1;
          safeSetState(() {});
        }
      } else {
        return;
      }

      FFAppState().updateLastDataLoadingStruct(
        (e) => e..reLoadDays = false,
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
