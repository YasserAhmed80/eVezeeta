import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'day_schedule_component_model.dart';
export 'day_schedule_component_model.dart';

class DayScheduleComponentWidget extends StatefulWidget {
  const DayScheduleComponentWidget({
    super.key,
    required this.dayIteam,
  });

  final DtDayStruct? dayIteam;

  @override
  State<DayScheduleComponentWidget> createState() =>
      _DayScheduleComponentWidgetState();
}

class _DayScheduleComponentWidgetState
    extends State<DayScheduleComponentWidget> {
  late DayScheduleComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DayScheduleComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.savedDayRef = await queryDocTimeRecordOnce(
        queryBuilder: (docTimeRecord) => docTimeRecord.where(Filter.or(
          Filter(
            'doc_id',
            isEqualTo: FFAppState().currentDoctor.dbDocRef?.id,
          ),
          Filter(
            'day_id',
            isEqualTo: widget.dayIteam?.dayKey,
          ),
        )),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.savedDayRef != null) {
        _model.selectedHours = _model.savedDayRef!.hrsId.toList().cast<int>();
        _model.currentDay = _model.savedDayRef?.reference;
        _model.isActiveDay = true;
        setState(() {});
      } else {
        _model.isActiveDay = false;
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).tertiary,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 52.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SwitchListTile.adaptive(
                    value: _model.switchListTileValue ??= _model.isActiveDay,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue = newValue);
                      if (newValue) {
                        _model.isActiveDay = true;
                        setState(() {});
                      } else {
                        _model.isActiveDay = false;
                        setState(() {});
                        await _model.currentDay!.delete();
                        _model.currentDay = null;
                        setState(() {});
                      }
                    },
                    title: Text(
                      widget.dayIteam!.desc,
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Cairo',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    activeColor: FlutterFlowTheme.of(context).primaryBackground,
                    activeTrackColor: FlutterFlowTheme.of(context).tertiary,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
              ],
            ),
          ),
          Builder(
            builder: (context) {
              if ((_model.currentDay != null) || _model.isActiveDay) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: Builder(
                            builder: (context) {
                              final hourItem = FFAppState().refHour.toList();

                              return Wrap(
                                spacing: 5.0,
                                runSpacing: 5.0,
                                alignment: WrapAlignment.spaceBetween,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.spaceBetween,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(hourItem.length,
                                    (hourItemIndex) {
                                  final hourItemItem = hourItem[hourItemIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 2.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (functions.checkItemInList(
                                            hourItemItem.hourKey,
                                            _model.selectedHours.toList())!) {
                                          _model.removeFromSelectedHours(
                                              hourItemItem.hourKey);
                                          setState(() {});
                                        } else {
                                          _model.addToSelectedHours(
                                              hourItemItem.hourKey);
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          color: functions.checkItemInList(
                                                  hourItemItem.hourKey,
                                                  _model.selectedHours
                                                      .toList())!
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              hourItemItem.desc,
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            Text(
                                              hourItemItem.period,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Cairo',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'o3hh004v' /* يمكنك تحديد و حفظ  ساعات العمل... */,
                            ),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Cairo',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  icon: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 24.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: () async {
                                    if (_model.currentDay != null) {
                                      if (_model.selectedHours.isNotEmpty
                                          ? true
                                          : false) {
                                        await _model.currentDay!.update({
                                          ...mapToFirestore(
                                            {
                                              'hrs_id': _model.selectedHours,
                                            },
                                          ),
                                        });
                                      } else {
                                        // not housrs selected
                                        await _model.currentDay!.delete();
                                      }

                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('حفظ البيانات'),
                                            content:
                                                const Text('تم تعديل البيانات بنجاح'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      var docTimeRecordReference =
                                          DocTimeRecord.collection.doc();
                                      await docTimeRecordReference.set({
                                        ...createDocTimeRecordData(
                                          docId: FFAppState()
                                              .currentDoctor
                                              .dbDocRef
                                              ?.id,
                                          dayId: widget.dayIteam?.dayKey,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'hrs_id': _model.selectedHours,
                                          },
                                        ),
                                      });
                                      _model.createdDay =
                                          DocTimeRecord.getDocumentFromData({
                                        ...createDocTimeRecordData(
                                          docId: FFAppState()
                                              .currentDoctor
                                              .dbDocRef
                                              ?.id,
                                          dayId: widget.dayIteam?.dayKey,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'hrs_id': _model.selectedHours,
                                          },
                                        ),
                                      }, docTimeRecordReference);
                                      _model.currentDay =
                                          _model.createdDay?.reference;
                                      setState(() {});
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('حفظ البيانات'),
                                            content:
                                                const Text('تم حفظ البيانات بنجاح'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ]
                            .divide(const SizedBox(width: 10.0))
                            .around(const SizedBox(width: 10.0)),
                      ),
                    ),
                  ],
                );
              } else {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 88.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'oz3ag78l' /* لم يتم اخيار هذا اليوم */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Cairo',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
