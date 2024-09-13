import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'calender_component2_widget.dart' show CalenderComponent2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalenderComponent2Model
    extends FlutterFlowModel<CalenderComponent2Widget> {
  ///  Local state fields for this component.

  DateTime? selectedDate;

  List<String> yearList = [];
  void addToYearList(String item) => yearList.add(item);
  void removeFromYearList(String item) => yearList.remove(item);
  void removeAtIndexFromYearList(int index) => yearList.removeAt(index);
  void insertAtIndexInYearList(int index, String item) =>
      yearList.insert(index, item);
  void updateYearListAtIndex(int index, Function(String) updateFn) =>
      yearList[index] = updateFn(yearList[index]);

  List<String> monthList = [];
  void addToMonthList(String item) => monthList.add(item);
  void removeFromMonthList(String item) => monthList.remove(item);
  void removeAtIndexFromMonthList(int index) => monthList.removeAt(index);
  void insertAtIndexInMonthList(int index, String item) =>
      monthList.insert(index, item);
  void updateMonthListAtIndex(int index, Function(String) updateFn) =>
      monthList[index] = updateFn(monthList[index]);

  List<String> dayList = [];
  void addToDayList(String item) => dayList.add(item);
  void removeFromDayList(String item) => dayList.remove(item);
  void removeAtIndexFromDayList(int index) => dayList.removeAt(index);
  void insertAtIndexInDayList(int index, String item) =>
      dayList.insert(index, item);
  void updateDayListAtIndex(int index, Function(String) updateFn) =>
      dayList[index] = updateFn(dayList[index]);

  int? loopIndex = 0;

  int? loopMax = 0;

  int? nDay = 0;

  int? nMonth = 0;

  int? nYear = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for cboYear widget.
  String? cboYearValue;
  FormFieldController<String>? cboYearValueController;
  // State field(s) for cboMonth widget.
  String? cboMonthValue;
  FormFieldController<String>? cboMonthValueController;
  // State field(s) for cboDay widget.
  String? cboDayValue;
  FormFieldController<String>? cboDayValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future fillYearsAction(BuildContext context) async {
    loopIndex = 1950;
    loopMax = 2025;
    yearList = [];
    while (loopIndex! < loopMax!) {
      addToYearList(loopIndex!.toString());
      loopIndex = loopIndex! + 1;
    }
  }

  Future fillMonthAction(BuildContext context) async {
    loopIndex = 1;
    loopMax = 13;
    monthList = [];
    while (loopIndex! < loopMax!) {
      addToMonthList(loopIndex!.toString());
      loopIndex = loopIndex! + 1;
    }
  }

  Future fillDaysAction(BuildContext context) async {
    loopIndex = 1;
    loopMax = valueOrDefault<int>(
      functions.getMonthDayCount(nYear, nMonth),
      0,
    );
    dayList = [];
    while (loopIndex! <= loopMax!) {
      addToDayList(loopIndex!.toString());
      loopIndex = loopIndex! + 1;
    }
  }

  Future createDateAction(BuildContext context) async {
    selectedDate = functions.createDate(nYear, nMonth, nDay);
  }
}
