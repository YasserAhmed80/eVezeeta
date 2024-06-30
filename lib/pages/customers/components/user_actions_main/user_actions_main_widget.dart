import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'user_actions_main_model.dart';
export 'user_actions_main_model.dart';

class UserActionsMainWidget extends StatefulWidget {
  const UserActionsMainWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.status,
  });

  final Widget? icon;
  final String? text;
  final int? status;

  @override
  State<UserActionsMainWidget> createState() => _UserActionsMainWidgetState();
}

class _UserActionsMainWidgetState extends State<UserActionsMainWidget> {
  late UserActionsMainModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserActionsMainModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.comStatus = widget.status;
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
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (_model.comStatus == 0) {
          _model.comStatus = 1;
          setState(() {});
        } else {
          _model.comStatus = 0;
          setState(() {});
        }
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: const BoxDecoration(
          color: Color(0x00A94343),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: _model.comStatus == 0
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : const Color(0x7C20B2AA),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFCEAAAA),
                    ),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (widget.icon != null) {
                        return widget.icon!;
                      } else {
                        return Icon(
                          Icons.error_outline_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.text,
                'text',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Cairo',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
