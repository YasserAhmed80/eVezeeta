import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_list_component_model.dart';
export 'empty_list_component_model.dart';

class EmptyListComponentWidget extends StatefulWidget {
  const EmptyListComponentWidget({
    super.key,
    String? desc,
  }) : desc = desc ?? 'لم يتم اختيار';

  final String desc;

  @override
  State<EmptyListComponentWidget> createState() =>
      _EmptyListComponentWidgetState();
}

class _EmptyListComponentWidgetState extends State<EmptyListComponentWidget> {
  late EmptyListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Text(
            widget.desc,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Cairo',
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ),
    );
  }
}
