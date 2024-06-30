import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/public_components/option_list/option_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'profile_edit_main_item_model.dart';
export 'profile_edit_main_item_model.dart';

class ProfileEditMainItemWidget extends StatefulWidget {
  const ProfileEditMainItemWidget({
    super.key,
    required this.itemCode,
    required this.itemType,
    required this.itemLable,
    required this.actionCallBack,
    int? countryCode,
  }) : countryCode = countryCode ?? 0;

  final int? itemCode;
  final String? itemType;
  final String? itemLable;
  final Future Function(int actionReturn)? actionCallBack;
  final int countryCode;

  @override
  State<ProfileEditMainItemWidget> createState() =>
      _ProfileEditMainItemWidgetState();
}

class _ProfileEditMainItemWidgetState extends State<ProfileEditMainItemWidget> {
  late ProfileEditMainItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileEditMainItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedCode = widget.itemCode;
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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: OptionListWidget(
                dataSource: widget.itemType!,
                inputICode: _model.selectedCode!,
                countryCode: widget.countryCode,
              ),
            );
          },
        ).then((value) => safeSetState(() => _model.returnCode = value));

        _model.selectedCode = _model.returnCode;
        setState(() {});
        await widget.actionCallBack?.call(
          valueOrDefault<int>(
            _model.selectedCode,
            0,
          ),
        );

        setState(() {});
      },
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.itemLable,
                                        'label',
                                      ),
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions
                                            .getRefItemLable(
                                                widget.itemType,
                                                _model.selectedCode,
                                                FFAppState()
                                                    .appStateRefData
                                                    .toList(),
                                                widget.countryCode)
                                            ?.desc,
                                        'data',
                                      ),
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]
                              .divide(const SizedBox(height: 0.0))
                              .addToStart(const SizedBox(height: 1.0))
                              .addToEnd(const SizedBox(height: 1.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: 100.0,
                  decoration: const BoxDecoration(),
                  child: Icon(
                    Icons.edit_note,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
