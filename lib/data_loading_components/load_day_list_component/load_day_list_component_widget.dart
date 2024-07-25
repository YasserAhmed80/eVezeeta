import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'load_day_list_component_model.dart';
export 'load_day_list_component_model.dart';

class LoadDayListComponentWidget extends StatefulWidget {
  const LoadDayListComponentWidget({super.key});

  @override
  State<LoadDayListComponentWidget> createState() =>
      _LoadDayListComponentWidgetState();
}

class _LoadDayListComponentWidgetState
    extends State<LoadDayListComponentWidget> {
  late LoadDayListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadDayListComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentDate = functions.dateOnly(getCurrentTimestamp);
      setState(() {});
      FFAppState().refDayList = [];
      setState(() {});
      while (_model.loopIndex! < _model.loopMax!) {
        FFAppState().addToRefDayList(DtDaysListStruct(
          dayValue: _model.currentDate,
          dayItem: functions.getDayCode(
              _model.currentDate!, FFAppState().refDay.toList()),
        ));
        setState(() {});
        _model.loopIndex = _model.loopIndex! + 1;
        _model.currentDate = functions.dateAdd(_model.currentDate);
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      decoration: const BoxDecoration(),
    );
  }
}
