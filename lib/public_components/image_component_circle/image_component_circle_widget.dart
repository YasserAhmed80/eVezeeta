import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'image_component_circle_model.dart';
export 'image_component_circle_model.dart';

class ImageComponentCircleWidget extends StatefulWidget {
  const ImageComponentCircleWidget({
    super.key,
    required this.imgURL,
    required this.width,
  });

  final String? imgURL;
  final int? width;

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
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'Show_image',
            queryParameters: {
              'imageURL': serializeParam(
                widget.imgURL,
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
            width: valueOrDefault<double>(
              widget.width?.toDouble(),
              200.0,
            ),
            height: valueOrDefault<double>(
              widget.width?.toDouble(),
              200.0,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              functions.stringToImagePath(widget.imgURL)!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/error_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
