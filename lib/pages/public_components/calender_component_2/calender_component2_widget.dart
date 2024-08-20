import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'calender_component2_model.dart';
export 'calender_component2_model.dart';

class CalenderComponent2Widget extends StatefulWidget {
  const CalenderComponent2Widget({
    super.key,
    required this.inputDate,
    required this.dateSelectedAction,
  });

  final DateTime? inputDate;
  final Future Function(DateTime actionReturnedDate)? dateSelectedAction;

  @override
  State<CalenderComponent2Widget> createState() =>
      _CalenderComponent2WidgetState();
}

class _CalenderComponent2WidgetState extends State<CalenderComponent2Widget> {
  late CalenderComponent2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderComponent2Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.nDay = functions.getDatePart(widget.inputDate, 'd');
      _model.nMonth = functions.getDatePart(widget.inputDate, 'm');
      _model.nYear = functions.getDatePart(widget.inputDate, 'y');
      _model.selectedDate = widget.inputDate;
      setState(() {});
      await _model.fillYearsAction(context);
      setState(() {});
      await _model.fillMonthAction(context);
      setState(() {});
      await _model.fillDaysAction(context);
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
      constraints: const BoxConstraints(
        maxWidth: 700.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
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
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Cairo',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
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
                    'y8ryd57z' /* Ok */,
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
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FlutterFlowDropDown<String>(
                      controller: _model.cboYearValueController ??=
                          FormFieldController<String>(null),
                      options: _model.yearList,
                      onChanged: (val) async {
                        setState(() => _model.cboYearValue = val);
                        _model.nYear =
                            functions.stringToInteger(_model.cboYearValue);
                        setState(() {});
                        await _model.fillDaysAction(context);
                        await _model.createDateAction(context);
                      },
                      width: 300.0,
                      height: 56.0,
                      maxHeight: 250.0,
                      searchHintTextStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Cairo',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      searchTextStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Cairo',
                                letterSpacing: 0.0,
                              ),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Cairo',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        '2ablvt8b' /* السنة */,
                      ),
                      searchHintText: FFLocalizations.of(context).getText(
                        '9vlwcx76' /* السنة */,
                      ),
                      icon: Icon(
                        Icons.calendar_month_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: true,
                      isMultiSelect: false,
                    ),
                  ),
                  Expanded(
                    child: FlutterFlowDropDown<String>(
                      controller: _model.cboMonthValueController ??=
                          FormFieldController<String>(null),
                      options: _model.monthList,
                      onChanged: (val) async {
                        setState(() => _model.cboMonthValue = val);
                        _model.nMonth =
                            functions.stringToInteger(_model.cboMonthValue);
                        setState(() {});
                        await _model.fillDaysAction(context);
                        await _model.createDateAction(context);
                      },
                      width: 300.0,
                      height: 56.0,
                      maxHeight: 250.0,
                      searchHintTextStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Cairo',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      searchTextStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Cairo',
                                letterSpacing: 0.0,
                              ),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Cairo',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        'hhl8qq33' /* الشهر */,
                      ),
                      searchHintText: FFLocalizations.of(context).getText(
                        'oapzu05w' /* الشهر */,
                      ),
                      icon: Icon(
                        Icons.calendar_month_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: true,
                      isMultiSelect: false,
                    ),
                  ),
                  Expanded(
                    child: FlutterFlowDropDown<String>(
                      controller: _model.cboDayValueController ??=
                          FormFieldController<String>(null),
                      options: _model.dayList,
                      onChanged: (val) async {
                        setState(() => _model.cboDayValue = val);
                        _model.nDay =
                            functions.stringToInteger(_model.cboDayValue);
                        setState(() {});
                        await _model.createDateAction(context);
                      },
                      width: 300.0,
                      height: 56.0,
                      maxHeight: 250.0,
                      searchHintTextStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Cairo',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      searchTextStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Cairo',
                                letterSpacing: 0.0,
                              ),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Cairo',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        'x2bdc5go' /* اليوم */,
                      ),
                      searchHintText: FFLocalizations.of(context).getText(
                        'd2hst4z8' /* اليوم */,
                      ),
                      icon: Icon(
                        Icons.calendar_month_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: true,
                      isMultiSelect: false,
                    ),
                  ),
                ].divide(const SizedBox(width: 5.0)).around(const SizedBox(width: 5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
