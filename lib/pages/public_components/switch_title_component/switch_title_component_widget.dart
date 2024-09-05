import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'switch_title_component_model.dart';
export 'switch_title_component_model.dart';

class SwitchTitleComponentWidget extends StatefulWidget {
  const SwitchTitleComponentWidget({
    super.key,
    required this.item,
    required this.inputList,
    required this.actionReturnedList,
  });

  final DtSubCategoryStruct? item;
  final List<int>? inputList;
  final Future Function(int? returnItem, bool switchValue)? actionReturnedList;

  @override
  State<SwitchTitleComponentWidget> createState() =>
      _SwitchTitleComponentWidgetState();
}

class _SwitchTitleComponentWidgetState
    extends State<SwitchTitleComponentWidget> {
  late SwitchTitleComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchTitleComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedList = widget.inputList!.toList().cast<int>();
      _model.switchValue = functions.checkItemInList(
          widget.item?.subKey, _model.selectedList.toList())!;
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (_model.switchValue == true) {
              await widget.actionReturnedList?.call(
                widget.item?.subKey,
                false,
              );
              _model.switchValue = false;
              safeSetState(() {});
            } else {
              await widget.actionReturnedList?.call(
                widget.item?.subKey,
                true,
              );
              _model.switchValue = true;
              safeSetState(() {});
            }
          },
          child: Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.item?.desc,
                      'n',
                    ),
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.switchValue == true) {
                        return Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.check,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 24.0,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.check,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
