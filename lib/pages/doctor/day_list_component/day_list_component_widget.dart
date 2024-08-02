import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'day_list_component_model.dart';
export 'day_list_component_model.dart';

class DayListComponentWidget extends StatefulWidget {
  const DayListComponentWidget({
    super.key,
    String? docID,
    required this.dayHoursAction,
  }) : docID = docID ?? '0';

  final String docID;
  final Future Function(List<int> dayHourse, DtDaysListStruct dayItemBook)?
      dayHoursAction;

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
          'doc_id',
          isEqualTo: widget.docID,
        ),
      );
      _model.docActiveDays = _model.returnedDocTime!
          .map((e) => e.dayId)
          .toList()
          .toList()
          .cast<int>();
      setState(() {});
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
      height: 500.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Builder(
        builder: (context) {
          final dayList = FFAppState().refDayList.toList();

          return SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(dayList.length, (dayListIndex) {
                final dayListItem = dayList[dayListIndex];
                return Builder(
                  builder: (context) {
                    if (functions.checkItemInList(dayListItem.dayItem.dayKey,
                            _model.docActiveDays.toList()) ==
                        true) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.selectedDate = dayListItem.dayValue;
                          setState(() {});
                          _model.selectedDayBook = dayListItem;
                          setState(() {});
                          _model.returnedHours = await queryDocTimeRecordOnce(
                            queryBuilder: (docTimeRecord) => docTimeRecord
                                .where(
                                  'doc_id',
                                  isEqualTo: widget.docID,
                                )
                                .where(
                                  'day_id',
                                  isEqualTo: dayListItem.dayItem.dayKey,
                                ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _model.selectedDayHours =
                              _model.returnedHours!.hrsId.toList().cast<int>();
                          setState(() {});
                          await widget.dayHoursAction?.call(
                            _model.selectedDayHours,
                            dayListItem,
                          );

                          setState(() {});
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
                                    'd/M/y',
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                  'd/M/y',
                                  dayListItem.dayValue!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
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
    );
  }
}
