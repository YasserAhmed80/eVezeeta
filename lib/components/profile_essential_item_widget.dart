import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profile_essential_item_model.dart';
export 'profile_essential_item_model.dart';

class ProfileEssentialItemWidget extends StatefulWidget {
  const ProfileEssentialItemWidget({
    super.key,
    required this.label,
    required this.icon,
  });

  final String? label;
  final Widget? icon;

  @override
  State<ProfileEssentialItemWidget> createState() =>
      _ProfileEssentialItemWidgetState();
}

class _ProfileEssentialItemWidgetState
    extends State<ProfileEssentialItemWidget> {
  late ProfileEssentialItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileEssentialItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x00D8CACA),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color(0x70FFC0CB),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Opacity(
                  opacity: 0.3,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                    child: widget.icon!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.label,
                    'label parameter',
                  ),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
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
