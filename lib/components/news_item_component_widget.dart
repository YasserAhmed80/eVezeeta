import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/loading_component/loading_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'news_item_component_model.dart';
export 'news_item_component_model.dart';

class NewsItemComponentWidget extends StatefulWidget {
  const NewsItemComponentWidget({
    super.key,
    required this.notificationDoc,
    required this.lastSeenDate,
  });

  final NotificationRecord? notificationDoc;
  final DateTime? lastSeenDate;

  @override
  State<NewsItemComponentWidget> createState() =>
      _NewsItemComponentWidgetState();
}

class _NewsItemComponentWidgetState extends State<NewsItemComponentWidget> {
  late NewsItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsItemComponentModel());

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
              color: widget.notificationDoc!.cAt! >= widget.lastSeenDate!
                  ? const Color(0x00000000)
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
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: Icon(
                            Icons.near_me_sharp,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 24.0,
                          ),
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
