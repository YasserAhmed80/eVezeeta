import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'phone_icon_component_model.dart';
export 'phone_icon_component_model.dart';

class PhoneIconComponentWidget extends StatefulWidget {
  const PhoneIconComponentWidget({
    super.key,
    this.telNo,
  });

  final String? telNo;

  @override
  State<PhoneIconComponentWidget> createState() =>
      _PhoneIconComponentWidgetState();
}

class _PhoneIconComponentWidgetState extends State<PhoneIconComponentWidget> {
  late PhoneIconComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneIconComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await launchUrl(Uri(
            scheme: 'tel',
            path: widget.telNo!,
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
            child: Icon(
              Icons.phone_rounded,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 35.0,
            ),
          ),
        ),
      ),
    );
  }
}
