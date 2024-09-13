import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
      _model.nDay = functions.getDatePart(widget!.inputDate, 'd');
      _model.nMonth = functions.getDatePart(widget!.inputDate, 'm');
      _model.nYear = functions.getDatePart(widget!.inputDate, 'y');
      _model.selectedDate = widget!.inputDate;
      safeSetState(() {});
      await _model.fillYearsAction(context);
      safeSetState(() {});
      await _model.fillMonthAction(context);
      safeSetState(() {});
      await _model.fillDaysAction(context);
      safeSetState(() {});
      safeSetState(() {
        _model.cboYearValueController?.value = valueOrDefault<String>(
          _model.nYear?.toString(),
          '0',
        );
      });
      safeSetState(() {
        _model.cboMonthValueController?.value = valueOrDefault<String>(
          _model.nMonth?.toString(),
          '0',
        );
      });
      safeSetState(() {
        _model.cboDayValueController?.value = valueOrDefault<String>(
          _model.nDay?.toString(),
          '0',
        );
      });
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
    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(14.0),
          topRight: Radius.circular(14.0),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 700.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(14.0),
            topRight: Radius.circular(14.0),
          ),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              dateTimeFormat(
                                "d/M/y",
                                _model.selectedDate,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              'd',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 30.0, 10.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FlutterFlowDropDown<String>(
                          controller: _model.cboYearValueController ??=
                              FormFieldController<String>(null),
                          options: _model.yearList,
                          onChanged: (val) async {
                            safeSetState(() => _model.cboYearValue = val);
                            _model.nYear =
                                functions.stringToInteger(_model.cboYearValue);
                            safeSetState(() {});
                            await _model.fillDaysAction(context);
                            await _model.createDateAction(context);
                          },
                          width: 300.0,
                          height: 56.0,
                          maxHeight: 250.0,
                          searchHintTextStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
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
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
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
                            safeSetState(() => _model.cboMonthValue = val);
                            _model.nMonth =
                                functions.stringToInteger(_model.cboMonthValue);
                            safeSetState(() {});
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
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
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
                            safeSetState(() => _model.cboDayValue = val);
                            _model.nDay =
                                functions.stringToInteger(_model.cboDayValue);
                            safeSetState(() {});
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
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      ),
                    ].divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
                  ),
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
                '679fcb8i' /* موافق */,
              ),
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Cairo',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
