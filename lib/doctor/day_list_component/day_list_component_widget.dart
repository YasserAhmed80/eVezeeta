import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'day_list_component_model.dart';
export 'day_list_component_model.dart';

class DayListComponentWidget extends StatefulWidget {
  const DayListComponentWidget({
    super.key,
    required this.dayHoursAction,
    required this.docDocument,
  });

  final Future Function(List<int> dayHourse, DtDaysListStruct dayItemBook,
      List<int> bookedHoursList)? dayHoursAction;
  final DocRecord? docDocument;

  @override
  State<DayListComponentWidget> createState() => _DayListComponentWidgetState();
}

class _DayListComponentWidgetState extends State<DayListComponentWidget> {
  late DayListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DayListComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.returnedDocTime = await queryDocTimeRecordOnce(
        queryBuilder: (docTimeRecord) => docTimeRecord.where(
          'doc_ref',
          isEqualTo: widget.docDocument?.reference,
        ),
      );
      _model.docActiveDays = _model.returnedDocTime!
          .map((e) => e.dayId)
          .toList()
          .toList()
          .cast<int>();
      safeSetState(() {});
      await _model.getDaysList(context);
      _model.selectedDate = _model.refDayList
          .where((e) => e.isActive == true)
          .toList()
          .first
          .dayValue;
      _model.selectedDayBook =
          _model.refDayList.where((e) => e.isActive == true).toList().first;
      safeSetState(() {});
      await _model.getHrsFromDbAction(context);
      await widget.dayHoursAction?.call(
        _model.selectedDayHours,
        _model.selectedDayBook!,
        _model.bookedHoursList,
      );
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
    return Container(
      height: 500.0,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
        child: Builder(
          builder: (context) {
            final dayList = _model.refDayList.toList();

            return SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(dayList.length, (dayListIndex) {
                  final dayListItem = dayList[dayListIndex];
                  return Builder(
                    builder: (context) {
                      if (dayListItem.isActive == true) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.selectedDate = dayListItem.dayValue;
                            safeSetState(() {});
                            _model.selectedDayBook = dayListItem;
                            safeSetState(() {});
                            await _model.getHrsFromDbAction(context);
                            await widget.dayHoursAction?.call(
                              _model.selectedDayHours,
                              dayListItem,
                              _model.bookedHoursList,
                            );
                          },
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: _model.selectedDate == dayListItem.dayValue
                                  ? FlutterFlowTheme.of(context).secondary
                                  : FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    dateTimeFormat(
                                      "d/M/y",
                                      dayListItem.dayValue!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    dayListItem.dayItem.desc,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  dateTimeFormat(
                                    "d/M/y",
                                    dayListItem.dayValue!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  dayListItem.dayItem.desc,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                }).divide(const SizedBox(height: 5.0)),
              ),
            );
          },
        ),
      ),
    );
  }
}
