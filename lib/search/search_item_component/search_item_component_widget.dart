import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'search_item_component_model.dart';
export 'search_item_component_model.dart';

class SearchItemComponentWidget extends StatefulWidget {
  const SearchItemComponentWidget({
    super.key,
    String? dataSource,
    required this.sheetTitle,
    required this.inputList,
  }) : dataSource = dataSource ?? 'n';

  final String dataSource;
  final String? sheetTitle;
  final List<int>? inputList;

  @override
  State<SearchItemComponentWidget> createState() =>
      _SearchItemComponentWidgetState();
}

class _SearchItemComponentWidgetState extends State<SearchItemComponentWidget> {
  late SearchItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchItemComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.returnedData = await actions.copyToList(
        widget.dataSource,
        0,
      );
      _model.dataList =
          _model.returnedData!.toList().cast<DtGeneralListStruct>();
      _model.selectedList = widget.inputList!.toList().cast<int>();
      safeSetState(() {});
      if ((widget.dataSource == 'price') &&
          (FFAppState().searchParameters.filterPriceCheck == true)) {
        _model.fromValue = valueOrDefault<double>(
          FFAppState().searchParameters.priceFrom,
          0.0,
        );
        _model.toValue = valueOrDefault<double>(
          FFAppState().searchParameters.priceTo,
          3000.0,
        );
        safeSetState(() {});
      }
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 30.0,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.sheetTitle,
                                    'nnnn',
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
                                    _model.selectedList = [];
                                    safeSetState(() {});
                                    _model.addToSelectedList(-1);
                                    safeSetState(() {});
                                    if (widget.dataSource == 'price') {
                                      FFAppState().updateSearchParametersStruct(
                                        (e) => e..filterPriceCheck = false,
                                      );
                                      safeSetState(() {});
                                      _model.fromValue = 0.0;
                                      _model.toValue = 3000.0;
                                      safeSetState(() {});
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '909hr4d3' /* حذف التصفية */,
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
                                    if ((widget.dataSource == 'type') ||
                                        (widget.dataSource == 'title')) {
                                      if (functions.checkItemInList(-1,
                                              _model.selectedList.toList()) ==
                                          true) {
                                        _model.selectedList = [];
                                        safeSetState(() {});
                                      }
                                      if (widget.dataSource == 'type') {
                                        FFAppState()
                                            .updateSearchParametersStruct(
                                          (e) => e
                                            ..docTypeCde =
                                                _model.selectedList.toList(),
                                        );
                                        safeSetState(() {});
                                      } else {
                                        if (widget.dataSource == 'title') {
                                          FFAppState()
                                              .updateSearchParametersStruct(
                                            (e) => e
                                              ..docTitleCde =
                                                  _model.selectedList.toList(),
                                          );
                                          safeSetState(() {});
                                        }
                                      }
                                    } else {
                                      if (widget.dataSource == 'price') {
                                        if ((_model.fromValue! > 0.0) ||
                                            (_model.toValue! < 3000.0)) {
                                          FFAppState()
                                              .updateSearchParametersStruct(
                                            (e) => e
                                              ..priceFrom = _model.fromValue
                                              ..priceTo = _model.toValue
                                              ..filterPriceCheck = true,
                                          );
                                          safeSetState(() {});
                                        } else {
                                          FFAppState()
                                              .updateSearchParametersStruct(
                                            (e) => e..filterPriceCheck = false,
                                          );
                                          safeSetState(() {});
                                        }
                                      }
                                    }

                                    Navigator.pop(context);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'xhib85h7' /* حفظ التصفية */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 35.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
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
          Expanded(
            child: Builder(
              builder: (context) {
                if (widget.dataSource != 'price') {
                  return Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Builder(
                              builder: (context) {
                                final listItem = _model.dataList.toList();

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(listItem.length,
                                            (listItemIndex) {
                                      final listItemItem =
                                          listItem[listItemIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (functions.checkItemInList(
                                                  listItemItem.key,
                                                  _model.selectedList
                                                      .toList()) ==
                                              true) {
                                            _model.removeFromSelectedList(
                                                listItemItem.key);
                                            safeSetState(() {});
                                            if (_model.selectedList.isEmpty) {
                                              _model.addToSelectedList(-1);
                                              safeSetState(() {});
                                            }
                                          } else {
                                            _model.addToSelectedList(
                                                listItemItem.key);
                                            safeSetState(() {});
                                            if (listItemItem.key > 0) {
                                              _model.removeFromSelectedList(-1);
                                              safeSetState(() {});
                                            } else {
                                              _model.selectedList = [];
                                              safeSetState(() {});
                                              _model.addToSelectedList(-1);
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: functions.checkItemInList(
                                                        listItemItem.key,
                                                        _model.selectedList
                                                            .toList()) ==
                                                    true
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 2.0, 2.0, 2.0),
                                            child: Text(
                                              listItemItem.desc,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                  );
                } else {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ip5583wu' /* من */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Expanded(
                                child: Slider(
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  min: 0.0,
                                  max: 3000.0,
                                  value: _model.sliderFromValue ??=
                                      valueOrDefault<double>(
                                    _model.fromValue,
                                    0.0,
                                  ),
                                  label: _model.sliderFromValue
                                      ?.toStringAsFixed(0),
                                  divisions: 60,
                                  onChanged: (newValue) async {
                                    newValue = double.parse(
                                        newValue.toStringAsFixed(0));
                                    safeSetState(() =>
                                        _model.sliderFromValue = newValue);
                                    _model.fromValue = _model.sliderFromValue;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                              Container(
                                width: 50.0,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.fromValue?.toString(),
                                    '0',
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'kse66a1z' /* الي */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Expanded(
                                child: Slider(
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  min: 0.0,
                                  max: 3000.0,
                                  value: _model.sliderToValue ??=
                                      valueOrDefault<double>(
                                    _model.toValue,
                                    3000.0,
                                  ),
                                  label:
                                      _model.sliderToValue?.toStringAsFixed(0),
                                  divisions: 60,
                                  onChanged: (newValue) async {
                                    newValue = double.parse(
                                        newValue.toStringAsFixed(0));
                                    safeSetState(
                                        () => _model.sliderToValue = newValue);
                                    _model.toValue = _model.sliderToValue;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                              Container(
                                width: 50.0,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.toValue?.toString(),
                                    '3000',
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
                            ],
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 20.0))
                          .around(const SizedBox(height: 20.0)),
                    ),
                  );
                }
              },
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
