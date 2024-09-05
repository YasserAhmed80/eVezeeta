import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'booked_status_component_model.dart';
export 'booked_status_component_model.dart';

class BookedStatusComponentWidget extends StatefulWidget {
  const BookedStatusComponentWidget({
    super.key,
    required this.bookedStatus,
  });

  final int? bookedStatus;

  @override
  State<BookedStatusComponentWidget> createState() =>
      _BookedStatusComponentWidgetState();
}

class _BookedStatusComponentWidgetState
    extends State<BookedStatusComponentWidget> {
  late BookedStatusComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookedStatusComponentModel());

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

    return Opacity(
      opacity: 0.8,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 40.0,
          ),
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              FFAppState()
                  .refBookStatus
                  .where((e) => e.code == widget.bookedStatus)
                  .toList()
                  .first
                  .color,
              FlutterFlowTheme.of(context).tertiary,
            ),
            borderRadius: BorderRadius.circular(14.0),
          ),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                FFAppState()
                    .refBookStatus
                    .where((e) => e.code == widget.bookedStatus)
                    .toList()
                    .first
                    .desc,
                'status',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Cairo',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
