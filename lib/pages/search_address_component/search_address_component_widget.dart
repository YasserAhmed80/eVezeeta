import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'search_address_component_model.dart';
export 'search_address_component_model.dart';

class SearchAddressComponentWidget extends StatefulWidget {
  const SearchAddressComponentWidget({super.key});

  @override
  State<SearchAddressComponentWidget> createState() =>
      _SearchAddressComponentWidgetState();
}

class _SearchAddressComponentWidgetState
    extends State<SearchAddressComponentWidget> {
  late SearchAddressComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchAddressComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.returnedListGov = await actions.copyToList(
        'gov',
        0,
      );
      _model.returnedListZone = await actions.copyToList(
        'zone',
        FFAppState().searchParameters.govCde,
      );
      _model.returnedListArea = await actions.copyToList(
        'area',
        FFAppState().searchParameters.zoneCde,
      );
      _model.zoneList =
          _model.returnedListZone!.toList().cast<DtGeneralListStruct>();
      _model.areaList =
          _model.returnedListArea!.toList().cast<DtGeneralListStruct>();
      _model.govList =
          _model.returnedListGov!.toList().cast<DtGeneralListStruct>();
      _model.selectedGov = FFAppState().searchParameters.govCde;
      _model.selectedZone = FFAppState().searchParameters.zoneCde;
      _model.selectedArea = FFAppState().searchParameters.areaCde;
      _model.selectedGovDesc = FFAppState().searchParameters.govDesc;
      _model.selectedZoneDesc = FFAppState().searchParameters.zoneDesc;
      _model.selectedAreaDesc = FFAppState().searchParameters.areaDesc;
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: 100.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
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
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context).accent3,
                                  size: 30.0,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'btjw459l' /* اختار العنوان */,
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
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.selectedGov = -1;
                                    _model.selectedZone = -1;
                                    _model.selectedArea = -1;
                                    _model.selectedGovDesc = 'الكل';
                                    _model.selectedZoneDesc = 'الكل';
                                    _model.selectedAreaDesc = 'الكل';
                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '7afu9atg' /* حذف التصفية */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 35.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    FFAppState().updateSearchParametersStruct(
                                      (e) => e
                                        ..govCde = _model.selectedGov
                                        ..zoneCde = _model.selectedZone
                                        ..areaCde = _model.selectedArea
                                        ..govDesc = _model.selectedGovDesc
                                        ..zoneDesc = _model.selectedZoneDesc
                                        ..areaDesc = _model.selectedAreaDesc,
                                    );
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'pbi9jm7j' /* حفظ التصفية */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 35.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    borderSide: const BorderSide(
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ]
                                .divide(const SizedBox(width: 5.0))
                                .around(const SizedBox(width: 5.0)),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              2.0, 2.0, 2.0, 2.0),
                          child: Text(
                            _model.selectedGovDesc,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Cairo',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .around(const SizedBox(height: 5.0)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              2.0, 2.0, 2.0, 2.0),
                          child: Text(
                            _model.selectedZoneDesc,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Cairo',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .around(const SizedBox(height: 5.0)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              2.0, 2.0, 2.0, 2.0),
                          child: Text(
                            _model.selectedAreaDesc,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Cairo',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .around(const SizedBox(height: 5.0)),
                  ),
                ),
              ]
                  .divide(const SizedBox(width: 10.0))
                  .addToStart(const SizedBox(width: 5.0))
                  .addToEnd(const SizedBox(width: 5.0)),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Builder(
                        builder: (context) {
                          final govItem = _model.govList.toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(govItem.length, (govItemIndex) {
                                final govItemItem = govItem[govItemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selectedGov = govItemItem.key;
                                    _model.selectedGovDesc = govItemItem.desc;
                                    setState(() {});
                                    // load zones
                                    _model.returendZones =
                                        await actions.copyToList(
                                      'zone',
                                      _model.selectedGov,
                                    );
                                    // load area
                                    _model.returendAreas =
                                        await actions.copyToList(
                                      'area',
                                      -1,
                                    );
                                    _model.zoneList = _model.returendZones!
                                        .toList()
                                        .cast<DtGeneralListStruct>();
                                    _model.areaList = _model.returendAreas!
                                        .toList()
                                        .cast<DtGeneralListStruct>();
                                    _model.selectedZone = -1;
                                    _model.selectedArea = -1;
                                    _model.selectedZoneDesc = 'الكل';
                                    _model.selectedAreaDesc = 'الكل';
                                    setState(() {});
                                    if (_model.returendZones?.length == 0) {
                                      _model.selectedZone = 0;
                                      _model.selectedArea = 0;
                                      setState(() {});
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          govItemItem.key == _model.selectedGov
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: Text(
                                        govItemItem.desc,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Cairo',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                );
                              })
                                      .divide(const SizedBox(height: 5.0))
                                      .around(const SizedBox(height: 5.0)),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Builder(
                        builder: (context) {
                          final zoneItem = _model.zoneList.toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(zoneItem.length,
                                      (zoneItemIndex) {
                                final zoneItemItem = zoneItem[zoneItemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selectedZone = zoneItemItem.key;
                                    _model.selectedZoneDesc = zoneItemItem.desc;
                                    setState(() {});
                                    // load zones
                                    _model.returnedArea =
                                        await actions.copyToList(
                                      'area',
                                      _model.selectedZone,
                                    );
                                    _model.areaList = _model.returnedArea!
                                        .toList()
                                        .cast<DtGeneralListStruct>();
                                    _model.selectedArea = -1;
                                    _model.selectedAreaDesc = 'الكل';
                                    setState(() {});
                                    if (_model.returnedArea?.length == 1) {
                                      _model.selectedArea =
                                          _model.returnedArea?.first.key;
                                      _model.selectedAreaDesc =
                                          _model.returnedArea!.first.desc;
                                      setState(() {});
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: zoneItemItem.key ==
                                              _model.selectedZone
                                          ? FlutterFlowTheme.of(context)
                                              .tertiary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: Text(
                                        zoneItemItem.desc,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Cairo',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                );
                              })
                                  .divide(const SizedBox(height: 5.0))
                                  .around(const SizedBox(height: 5.0)),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Builder(
                        builder: (context) {
                          final areaItem = _model.areaList.toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(areaItem.length,
                                      (areaItemIndex) {
                                final areaItemItem = areaItem[areaItemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selectedArea = areaItemItem.key;
                                    _model.selectedAreaDesc = areaItemItem.desc;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: areaItemItem.key ==
                                              _model.selectedArea
                                          ? FlutterFlowTheme.of(context)
                                              .tertiary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: Text(
                                        areaItemItem.desc,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Cairo',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                );
                              })
                                  .divide(const SizedBox(height: 5.0))
                                  .around(const SizedBox(height: 5.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ]
                      .divide(const SizedBox(width: 10.0))
                      .addToStart(const SizedBox(width: 5.0))
                      .addToEnd(const SizedBox(width: 5.0)),
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Container(
                    width: double.infinity,
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
