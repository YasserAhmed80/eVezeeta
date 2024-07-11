import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'test_appstate_model.dart';
export 'test_appstate_model.dart';

class TestAppstateWidget extends StatefulWidget {
  const TestAppstateWidget({super.key});

  @override
  State<TestAppstateWidget> createState() => _TestAppstateWidgetState();
}

class _TestAppstateWidgetState extends State<TestAppstateWidget> {
  late TestAppstateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestAppstateModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().refCategory.isEmpty) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: const Text('load items'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        _model.catDocss = await queryCategoryRecordOnce();
        _model.loopMax = _model.catDocss?.length;
        setState(() {});
        FFAppState().refCategory = [];
        setState(() {});
        while (_model.loopIndex! < _model.loopMax!) {
          FFAppState().addToRefCategory(DtCategoryStruct(
            catKey: _model.catDocss?[_model.loopIndex!].catKey,
            desc: _model.catDocss?[_model.loopIndex!].desc,
          ));
          setState(() {});
          _model.loopIndex = _model.loopIndex! + 1;
          setState(() {});
        }
      } else {
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              FFButtonWidget(
                onPressed: () async {
                  context.safePop();
                },
                text: FFLocalizations.of(context).getText(
                  'mxas0rf6' /* Button */,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                  borderRadius: BorderRadius.circular(8.0),
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
          child: Builder(
            builder: (context) {
              final catItems = FFAppState().refCategory.toList();

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(catItems.length, (catItemsIndex) {
                  final catItemsItem = catItems[catItemsIndex];
                  return Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      catItemsItem.desc,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Cairo',
                            letterSpacing: 0.0,
                          ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
