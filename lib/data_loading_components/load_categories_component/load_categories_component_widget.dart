import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'load_categories_component_model.dart';
export 'load_categories_component_model.dart';

class LoadCategoriesComponentWidget extends StatefulWidget {
  const LoadCategoriesComponentWidget({super.key});

  @override
  State<LoadCategoriesComponentWidget> createState() =>
      _LoadCategoriesComponentWidgetState();
}

class _LoadCategoriesComponentWidgetState
    extends State<LoadCategoriesComponentWidget> {
  late LoadCategoriesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadCategoriesComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().refCategory.isEmpty) ||
          (FFAppState().lastDataLoading.reLoadCategory == true)) {
        _model.catDocss = await queryCategoryRecordOnce(
          queryBuilder: (categoryRecord) => categoryRecord.orderBy('seq'),
        );
        _model.loopMax = _model.catDocss?.length;
        setState(() {});
        FFAppState().refCategory = [];
        FFAppState().refSubCategory = [];
        setState(() {});
        while (_model.loopIndex! < _model.loopMax!) {
          FFAppState().addToRefCategory(DtCategoryStruct(
            catKey: _model.catDocss?[_model.loopIndex!].catKey,
            desc: _model.catDocss?[_model.loopIndex!].desc,
            seq: _model.catDocss?[_model.loopIndex!].seq,
          ));
          setState(() {});
          _model.loopIndex = _model.loopIndex! + 1;
          setState(() {});
        }
        // sub categories
        _model.subCatDocss = await queryCategorySubRecordOnce(
          queryBuilder: (categorySubRecord) => categorySubRecord.orderBy('seq'),
        );
        _model.loopMax = _model.subCatDocss?.length;
        _model.loopIndex = 0;
        setState(() {});
        while (_model.loopIndex! < _model.loopMax!) {
          FFAppState().addToRefSubCategory(DtSubCategoryStruct(
            subKey: _model.subCatDocss?[_model.loopIndex!].subKey,
            catCde: _model.subCatDocss?[_model.loopIndex!].catCde,
            desc: _model.subCatDocss?[_model.loopIndex!].desc,
            seq: _model.subCatDocss?[_model.loopIndex!].seq,
          ));
          setState(() {});
          _model.loopIndex = _model.loopIndex! + 1;
          setState(() {});
        }
      } else {
        return;
      }

      FFAppState().updateLastDataLoadingStruct(
        (e) => e..reLoadCategory = false,
      );
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
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
