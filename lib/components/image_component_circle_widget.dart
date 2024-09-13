import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_component_circle_model.dart';
export 'image_component_circle_model.dart';

class ImageComponentCircleWidget extends StatefulWidget {
  const ImageComponentCircleWidget({
    super.key,
    required this.imgURL,
  });

  final String? imgURL;

  @override
  State<ImageComponentCircleWidget> createState() =>
      _ImageComponentCircleWidgetState();
}

class _ImageComponentCircleWidgetState
    extends State<ImageComponentCircleWidget> {
  late ImageComponentCircleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageComponentCircleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'Show_image',
          queryParameters: {
            'imageURL': serializeParam(
              widget!.imgURL,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Container(
          width: 60.0,
          height: 60.0,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            functions.stringToImagePath(widget!.imgURL)!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/error_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
