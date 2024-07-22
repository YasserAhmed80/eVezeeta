import '/backend/backend.dart';
import '/data_loading_components/load_day_list_component/load_day_list_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/doctor/day_booking_component/day_booking_component_widget.dart';
import '/pages/doctor/day_list_component/day_list_component_widget.dart';
import 'package:flutter/material.dart';
import 'doctor_book_visit_model.dart';
export 'doctor_book_visit_model.dart';

class DoctorBookVisitWidget extends StatefulWidget {
  const DoctorBookVisitWidget({
    super.key,
    required this.docDocument,
  });

  final DocRecord? docDocument;

  @override
  State<DoctorBookVisitWidget> createState() => _DoctorBookVisitWidgetState();
}

class _DoctorBookVisitWidgetState extends State<DoctorBookVisitWidget> {
  late DoctorBookVisitModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoctorBookVisitModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'mu62r1ss' /* Page Title */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Cairo',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 24.0,
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      height: 44.0,
                      decoration: const BoxDecoration(),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'jjcwgkrh' /* book a day */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Cairo',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.dayListComponentModel,
                                  updateCallback: () => setState(() {}),
                                  child: DayListComponentWidget(
                                    docID: widget.docDocument!.reference.id,
                                    dayHoursAction:
                                        (dayHourse, dayItemBook) async {
                                      _model.selectedDayHours =
                                          dayHourse.toList().cast<int>();
                                      _model.selectedDaybook = dayItemBook;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 100.0,
                              height: 431.0,
                              decoration: const BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.dayBookingComponentModel,
                                updateCallback: () => setState(() {}),
                                child: DayBookingComponentWidget(
                                  dayBookItem: _model.selectedDaybook,
                                  dayAvilableHrs: _model.selectedDayHours,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: wrapWithModel(
                      model: _model.loadDayListComponentModel,
                      updateCallback: () => setState(() {}),
                      child: const LoadDayListComponentWidget(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
