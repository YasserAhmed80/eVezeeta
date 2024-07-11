import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SwitchListTile.adaptive(
          value: _model.switchListTileValue ??= _model.switchValue == true,
          onChanged: (newValue) async {
            setState(() => _model.switchListTileValue = newValue);
            if (newValue) {
              await widget.actionReturnedList?.call(
                widget.item?.subKey,
                true,
              );
            } else {
              await widget.actionReturnedList?.call(
                widget.item?.subKey,
                false,
              );
            }
          },
          title: Text(
            _model.switchValue.toString(),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Cairo',
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          tileColor: FlutterFlowTheme.of(context).primaryBackground,
          activeColor: FlutterFlowTheme.of(context).primaryBackground,
          activeTrackColor: FlutterFlowTheme.of(context).tertiary,
          dense: false,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ],
    );
  }
}
