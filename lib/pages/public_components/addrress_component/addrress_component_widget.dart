import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addrress_component_model.dart';
export 'addrress_component_model.dart';

class AddrressComponentWidget extends StatefulWidget {
  const AddrressComponentWidget({
    super.key,
    int? govKey,
    int? zoneKey,
    int? areaKey,
    String? addressDesc,
  })  : govKey = govKey ?? 0,
        zoneKey = zoneKey ?? 0,
        areaKey = areaKey ?? 0,
        addressDesc = addressDesc ?? 'n';

  final int govKey;
  final int zoneKey;
  final int areaKey;
  final String addressDesc;

  @override
  State<AddrressComponentWidget> createState() =>
      _AddrressComponentWidgetState();
}

class _AddrressComponentWidgetState extends State<AddrressComponentWidget> {
  late AddrressComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddrressComponentModel());

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

    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.location_on,
                color: FlutterFlowTheme.of(context).secondary,
                size: 14.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.govKey > 0
                        ? valueOrDefault<String>(
                            FFAppState()
                                .refGovernate
                                .where((e) => e.govKey == widget.govKey)
                                .toList()
                                .first
                                .desc,
                            'n',
                          )
                        : 'n',
                    'n',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Cairo',
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Icon(
                Icons.arrow_right,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              Text(
                valueOrDefault<String>(
                  widget.zoneKey > 0
                      ? valueOrDefault<String>(
                          FFAppState()
                              .refZone
                              .where((e) => e.zoneKey == widget.zoneKey)
                              .toList()
                              .first
                              .desc,
                          'none',
                        )
                      : 'n',
                  'n',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Cairo',
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Icon(
                Icons.arrow_right,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              Text(
                widget.areaKey > 0
                    ? valueOrDefault<String>(
                        FFAppState()
                            .refArea
                            .where((e) => e.areaKey == widget.areaKey)
                            .toList()
                            .first
                            .desc,
                        'none',
                      )
                    : 'n',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Cairo',
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Opacity(
                opacity: 0.0,
                child: Icon(
                  Icons.arrow_right,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.addressDesc,
                  'nn',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Cairo',
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
