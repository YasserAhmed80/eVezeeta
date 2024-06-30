import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'show_photo_from_d_b_model.dart';
export 'show_photo_from_d_b_model.dart';

class ShowPhotoFromDBWidget extends StatefulWidget {
  const ShowPhotoFromDBWidget({
    super.key,
    required this.docRef,
  });

  final CusPhotosRecord? docRef;

  @override
  State<ShowPhotoFromDBWidget> createState() => _ShowPhotoFromDBWidgetState();
}

class _ShowPhotoFromDBWidgetState extends State<ShowPhotoFromDBWidget> {
  late ShowPhotoFromDBModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowPhotoFromDBModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxHeight: 400.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0),
              shape: BoxShape.rectangle,
            ),
            child: Stack(
              children: [
                Hero(
                  tag: functions.stringToImagePath(widget.docRef?.img)!,
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      functions.stringToImagePath(widget.docRef?.img)!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      alignment: const Alignment(0.0, 0.0),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: 100.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryText,
                      icon: Icon(
                        Icons.delete_forever_sharp,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await widget.docRef!.reference.delete();
                        await actions.deleteImageByURL(
                          widget.docRef!.img,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'تم حذف الصورة',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
