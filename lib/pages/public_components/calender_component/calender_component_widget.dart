import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'calender_component_model.dart';
export 'calender_component_model.dart';

class CalenderComponentWidget extends StatefulWidget {
  const CalenderComponentWidget({
    super.key,
    required this.inputDate,
    required this.dateSelectedAction,
  });

  final DateTime? inputDate;
  final Future Function(DateTime actionReturnedDate)? dateSelectedAction;

  @override
  State<CalenderComponentWidget> createState() =>
      _CalenderComponentWidgetState();
}

class _CalenderComponentWidgetState extends State<CalenderComponentWidget> {
  late CalenderComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedDate = widget.inputDate;
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
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(14.0),
          topRight: Radius.circular(14.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_outlined,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          dateTimeFormat(
                            "d/M/y",
                            _model.selectedDate,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          'd',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Cairo',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await widget.dateSelectedAction?.call(
                      _model.selectedDate!,
                    );
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'c78yp9g1' /* Ok */,
                  ),
                  options: FFButtonOptions(
                    height: 30.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FlutterFlowCalendar(
              color: FlutterFlowTheme.of(context).secondary,
              iconColor: FlutterFlowTheme.of(context).secondaryText,
              weekFormat: false,
              weekStartsMonday: false,
              initialDate: widget.inputDate,
              rowHeight: 64.0,
              onChange: (DateTimeRange? newSelectedDate) async {
                if (_model.calenderControlSelectedDay == newSelectedDate) {
                  return;
                }
                _model.calenderControlSelectedDay = newSelectedDate;
                _model.selectedDate = _model.calenderControlSelectedDay?.start;
                setState(() {});
                setState(() {});
              },
              titleStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Cairo',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
              dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Cairo',
                    color: FlutterFlowTheme.of(context).secondary,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                  ),
              dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Cairo',
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                  ),
              selectedDateStyle:
                  FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Cairo',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                      ),
              inactiveDateStyle:
                  FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Cairo',
                        letterSpacing: 0.0,
                      ),
              locale: FFLocalizations.of(context).languageCode,
            ),
          ),
        ],
      ),
    );
  }
}
