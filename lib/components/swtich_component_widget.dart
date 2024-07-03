import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'swtich_component_model.dart';
export 'swtich_component_model.dart';

class SwtichComponentWidget extends StatefulWidget {
  const SwtichComponentWidget({
    super.key,
    this.switchValue,
  });

  final int? switchValue;

  @override
  State<SwtichComponentWidget> createState() => _SwtichComponentWidgetState();
}

class _SwtichComponentWidgetState extends State<SwtichComponentWidget> {
  late SwtichComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwtichComponentModel());

    _model.switchValue = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _model.switchValue!,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue);
      },
      activeColor: FlutterFlowTheme.of(context).primary,
      activeTrackColor: FlutterFlowTheme.of(context).accent1,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
    );
  }
}
