import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
                                    setState(() {});
                                    _model.addToSelectedList(-1);
                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'urcreeft' /* حذف التصفية */,
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
                                    if (functions.checkItemInList(
                                            -1, _model.selectedList.toList()) ==
                                        true) {
                                      _model.selectedList = [];
                                      setState(() {});
                                    }
                                    if (widget.dataSource == 'type') {
                                      FFAppState().updateSearchParametersStruct(
                                        (e) => e
                                          ..docTypeCde =
                                              _model.selectedList.toList(),
                                      );
                                      setState(() {});
                                    } else {
                                      if (widget.dataSource == 'title') {
                                        FFAppState()
                                            .updateSearchParametersStruct(
                                          (e) => e
                                            ..docTitleCde =
                                                _model.selectedList.toList(),
                                        );
                                        setState(() {});
                                      }
                                    }

                                    Navigator.pop(context);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '909hr4d3' /* حفظ التصفية */,
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
                      flex: 1,
                      child: Builder(
                        builder: (context) {
                          final listItem = _model.dataList.toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(listItem.length,
                                      (listItemIndex) {
                                final listItemItem = listItem[listItemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (functions.checkItemInList(
                                            listItemItem.key,
                                            _model.selectedList.toList()) ==
                                        true) {
                                      _model.removeFromSelectedList(
                                          listItemItem.key);
                                      setState(() {});
                                      if (_model.selectedList.isEmpty) {
                                        _model.addToSelectedList(-1);
                                        setState(() {});
                                      }
                                    } else {
                                      _model
                                          .addToSelectedList(listItemItem.key);
                                      setState(() {});
                                      if (listItemItem.key > 0) {
                                        _model.removeFromSelectedList(-1);
                                        setState(() {});
                                      } else {
                                        _model.selectedList = [];
                                        setState(() {});
                                        _model.addToSelectedList(-1);
                                        setState(() {});
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
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: Text(
                                        listItemItem.desc,
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
