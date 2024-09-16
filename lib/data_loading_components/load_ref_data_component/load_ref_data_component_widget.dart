import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'load_ref_data_component_model.dart';
export 'load_ref_data_component_model.dart';

class LoadRefDataComponentWidget extends StatefulWidget {
  const LoadRefDataComponentWidget({
    super.key,
    required this.loadingCompletedAction,
  });

  final Future Function(bool isCompleted)? loadingCompletedAction;

  @override
  State<LoadRefDataComponentWidget> createState() =>
      _LoadRefDataComponentWidgetState();
}

class _LoadRefDataComponentWidgetState extends State<LoadRefDataComponentWidget>
    with TickerProviderStateMixin {
  late LoadRefDataComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadRefDataComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.checkDataLoadingAction(context);
      await _model.loadCategoryAction(context);
      await _model.loadCityAction(context);
      await _model.loadDaysAction(context);
      _model.isLoadingCompleted = true;
      safeSetState(() {});
      if (_model.timerMilliseconds < 2000) {
        await Future.delayed(const Duration(milliseconds: 2000));
      }
      await widget.loadingCompletedAction?.call(
        true,
      );
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 310.0.ms,
            duration: 1000.0.ms,
            begin: 0.115,
            end: 1.0,
          ),
        ],
      ),
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Icon(
              Icons.cloud_download,
              color: FlutterFlowTheme.of(context).secondary,
              size: 100.0,
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'qv6xtmr9' /* جاري تحميل البيانات */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Cairo',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
        if (false)
          FlutterFlowTimer(
            initialTime: _model.timerInitialTimeMs,
            getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
              value,
              hours: false,
              milliSecond: false,
            ),
            controller: _model.timerController,
            updateStateInterval: const Duration(milliseconds: 1000),
            onChanged: (value, displayTime, shouldUpdate) {
              _model.timerMilliseconds = value;
              _model.timerValue = displayTime;
              if (shouldUpdate) safeSetState(() {});
            },
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Cairo',
                  letterSpacing: 0.0,
                ),
          ),
      ],
    );
  }
}
