import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/search/search_item_component/search_item_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doc_search_item_list_component_model.dart';
export 'doc_search_item_list_component_model.dart';

class DocSearchItemListComponentWidget extends StatefulWidget {
  const DocSearchItemListComponentWidget({super.key});

  @override
  State<DocSearchItemListComponentWidget> createState() =>
      _DocSearchItemListComponentWidgetState();
}

class _DocSearchItemListComponentWidgetState
    extends State<DocSearchItemListComponentWidget> {
  late DocSearchItemListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocSearchItemListComponentModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
        child: Builder(
          builder: (context) {
            final searchItem = FFAppState().docSearchItems.toList();

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(searchItem.length, (searchItemIndex) {
                  final searchItemItem = searchItem[searchItemIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (searchItemItem.itemType == 'type') {
                        _model.selectedItemData = FFAppState()
                            .searchParameters
                            .docTypeCde
                            .toList()
                            .cast<int>();
                        safeSetState(() {});
                      } else {
                        if (searchItemItem.itemType == 'title') {
                          _model.selectedItemData = FFAppState()
                              .searchParameters
                              .docTitleCde
                              .toList()
                              .cast<int>();
                          safeSetState(() {});
                        }
                      }

                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: 600.0,
                              child: SearchItemComponentWidget(
                                dataSource: searchItemItem.itemType,
                                sheetTitle: searchItemItem.dialogDesc,
                                inputList: _model.selectedItemData,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: 60.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          if (functions.checkSearchItemActive(
                                  valueOrDefault<String>(
                                    searchItemItem.itemType,
                                    'n',
                                  ),
                                  FFAppState().searchParameters) ==
                              true) {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    minWidth: 60.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 5.0),
                                        child: Text(
                                          searchItemItem.itemDesc,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Cairo',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 5.0),
                                        child: Text(
                                          searchItemItem.itemDesc,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Cairo',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  );
                }).divide(SizedBox(width: 5.0)).around(SizedBox(width: 5.0)),
              ),
            );
          },
        ),
      ),
    );
  }
}
