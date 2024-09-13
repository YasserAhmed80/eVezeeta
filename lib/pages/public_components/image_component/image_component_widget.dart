import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_component_model.dart';
export 'image_component_model.dart';

class ImageComponentWidget extends StatefulWidget {
  const ImageComponentWidget({
    super.key,
    required this.imgRef,
  });

  final String? imgRef;

  @override
  State<ImageComponentWidget> createState() => _ImageComponentWidgetState();
}

class _ImageComponentWidgetState extends State<ImageComponentWidget> {
  late ImageComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (widget!.imgRef != null && widget!.imgRef != '') {
                context.pushNamed(
                  'Show_image',
                  queryParameters: {
                    'imageURL': serializeParam(
                      widget!.imgRef,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                functions.stringToImagePath(widget!.imgRef)!,
                width: 300.0,
                height: 200.0,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/images/error_image.jpg',
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
