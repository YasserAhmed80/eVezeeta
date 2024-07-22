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
import 'search_category_component_model.dart';
export 'search_category_component_model.dart';

class SearchCategoryComponentWidget extends StatefulWidget {
  const SearchCategoryComponentWidget({super.key});

  @override
  State<SearchCategoryComponentWidget> createState() =>
      _SearchCategoryComponentWidgetState();
}

class _SearchCategoryComponentWidgetState
    extends State<SearchCategoryComponentWidget> {
  late SearchCategoryComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchCategoryComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedCat = valueOrDefault<int>(
        FFAppState().searchParameters.catCde,
        0,
      );
      _model.selectedSubCat =
          FFAppState().searchParameters.subCatCde.toList().cast<int>();
      setState(() {});
      // cophy category
      _model.returnedCat = await actions.copyToList(
        'cat',
        0,
      );
      _model.returnedSubCat = await actions.copyToList(
        'subCat',
        _model.selectedCat,
      );
      _model.catList = _model.returnedCat!.toList().cast<DtGeneralListStruct>();
      _model.subCatList =
          _model.returnedSubCat!.toList().cast<DtGeneralListStruct>();
      setState(() {});
      if (_model.selectedSubCat.isEmpty) {
        _model.addToSelectedSubCat(-1);
        setState(() {});
      }
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
                                    'nsi0q9x1' /* اختار التخصص */,
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
                                    _model.selectedCat = -1;
                                    _model.selectedSubCat = [];
                                    _model.selectedCatDesc = 'الكل';
                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'y7v25toa' /* حذف التصفية */,
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
                                        ..catCde = _model.selectedCat
                                        ..subCatCde =
                                            _model.selectedSubCat.toList()
                                        ..catDesc = valueOrDefault<String>(
                                          _model.selectedCatDesc,
                                          'n',
                                        )
                                        ..subCatDesc =
                                            _model.selectedSubCatDesc,
                                    );
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '77tg89tk' /* حفظ التصفية */,
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
                          final catItem = _model.catList.toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(catItem.length, (catItemIndex) {
                                final catItemItem = catItem[catItemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selectedCat = catItemItem.key;
                                    _model.selectedSubCat = [];
                                    _model.selectedCatDesc = catItemItem.desc;
                                    setState(() {});
                                    _model.filteredSubCat =
                                        await actions.copyToList(
                                      'subCat',
                                      _model.selectedCat,
                                    );
                                    _model.subCatList = _model.filteredSubCat!
                                        .toList()
                                        .cast<DtGeneralListStruct>();
                                    setState(() {});
                                    // add selected all to sub cat
                                    _model.addToSelectedSubCat(-1);
                                    setState(() {});

                                    setState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          catItemItem.key == _model.selectedCat
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
                                        catItemItem.desc,
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
                      flex: 1,
                      child: Builder(
                        builder: (context) {
                          final subCatItem = _model.subCatList.toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(subCatItem.length,
                                      (subCatItemIndex) {
                                final subCatItemItem =
                                    subCatItem[subCatItemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (functions.checkItemInList(
                                            subCatItemItem.key,
                                            _model.selectedSubCat.toList()) ==
                                        true) {
                                      // remove item
                                      _model.removeFromSelectedSubCat(
                                          subCatItemItem.key);
                                      setState(() {});
                                    } else {
                                      // add item
                                      _model.addToSelectedSubCat(
                                          subCatItemItem.key);
                                      setState(() {});
                                      if (subCatItemItem.key != -1) {
                                        // remove all incase of only one item selected
                                        _model.removeFromSelectedSubCat(-1);
                                        setState(() {});
                                      }
                                    }

                                    if (_model.selectedSubCat.isEmpty) {
                                      _model.addToSelectedSubCat(-1);
                                      _model.selectedSubCatDesc = 'الكل';
                                      setState(() {});
                                    } else {
                                      _model.selectedSubCatDesc =
                                          valueOrDefault<String>(
                                        subCatItemItem.desc,
                                        'nnn',
                                      );
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: functions.checkItemInList(
                                                  subCatItemItem.key,
                                                  _model.selectedSubCat
                                                      .toList()) ==
                                              true
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
                                        subCatItemItem.desc,
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
