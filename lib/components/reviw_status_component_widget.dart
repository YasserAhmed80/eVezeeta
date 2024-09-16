import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'reviw_status_component_model.dart';
export 'reviw_status_component_model.dart';

class ReviwStatusComponentWidget extends StatefulWidget {
  const ReviwStatusComponentWidget({
    super.key,
    required this.reviewCode,
    required this.reviewReason,
  });

  final int? reviewCode;
  final String? reviewReason;

  @override
  State<ReviwStatusComponentWidget> createState() =>
      _ReviwStatusComponentWidgetState();
}

class _ReviwStatusComponentWidgetState
    extends State<ReviwStatusComponentWidget> {
  late ReviwStatusComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviwStatusComponentModel());

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
        color: valueOrDefault<Color>(
          FFAppState()
              .refReviewStatus
              .where((e) => e.key == widget.reviewCode)
              .toList()
              .first
              .color,
          FlutterFlowTheme.of(context).secondary,
        ),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'jg8bnvfu' /* حالة ملفك:  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Cairo',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    FFAppState()
                        .refReviewStatus
                        .where((e) => e.key == widget.reviewCode)
                        .toList()
                        .first
                        .desc,
                    'n',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Cairo',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
            ),
            if ((widget.reviewCode == 3) || (widget.reviewCode == 4))
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '1eip84hv' /* سبب: */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                        ),
                  ),
                  AutoSizeText(
                    valueOrDefault<String>(
                      widget.reviewReason,
                      'non',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ].divide(const SizedBox(width: 10.0)).around(const SizedBox(width: 10.0)),
              ),
          ],
        ),
      ),
    );
  }
}
