import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/loading_component/loading_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'notification_item_component_model.dart';
export 'notification_item_component_model.dart';

class NotificationItemComponentWidget extends StatefulWidget {
  const NotificationItemComponentWidget({
    super.key,
    required this.notificationDoc,
  });

  final NotificationRecord? notificationDoc;

  @override
  State<NotificationItemComponentWidget> createState() =>
      _NotificationItemComponentWidgetState();
}

class _NotificationItemComponentWidgetState
    extends State<NotificationItemComponentWidget> {
  late NotificationItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationItemComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.seenIND = widget.notificationDoc!.seenInd;
      safeSetState(() {});
      if (_model.seenIND == false) {
        await widget.notificationDoc!.reference
            .update(createNotificationRecordData(
          seenInd: true,
        ));

        await FFAppState()
            .currentDoctor
            .notifyRef!
            .update(createDocNotifyRecordData(
              notifyCnt: 0,
            ));
      }
      _model.isLoadingData = false;
      safeSetState(() {});
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

    return Builder(
      builder: (context) {
        if (_model.isLoadingData == false) {
          return Container(
            decoration: BoxDecoration(
              color: _model.seenIND == false
                  ? const Color(0x2500D76D)
                  : FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            FFAppState()
                                .refNotificationTypes
                                .where((e) =>
                                    e.key == widget.notificationDoc?.notCde)
                                .toList()
                                .first
                                .desc,
                            'n',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Cairo',
                                    color: valueOrDefault<Color>(
                                      FFAppState()
                                          .refNotificationTypes
                                          .where((e) =>
                                              e.key ==
                                              widget.notificationDoc?.notCde)
                                          .toList()
                                          .first
                                          .color,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            FFAppState()
                                .refNotificationTypes
                                .where((e) =>
                                    e.key == widget.notificationDoc?.notCde)
                                .toList()
                                .first
                                .color,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            if ((widget.notificationDoc?.notCde == 1) ||
                                (widget.notificationDoc?.notCde == 2)) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                              );
                            } else if (widget.notificationDoc?.notCde == 3) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Icon(
                                  Icons.priority_high,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Icon(
                                  Icons.check,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        dateTimeFormat(
                          "d/M/y",
                          widget.notificationDoc!.cAt!,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Cairo',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        dateTimeFormat(
                          "relative",
                          widget.notificationDoc!.cAt!,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Cairo',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.notificationDoc?.msg,
                            'nn',
                          ),
                          maxLines: 3,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Cairo',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return wrapWithModel(
            model: _model.loadingComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: const LoadingComponentWidget(),
          );
        }
      },
    );
  }
}
