import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'upload_photo_model.dart';
export 'upload_photo_model.dart';

class UploadPhotoWidget extends StatefulWidget {
  const UploadPhotoWidget({
    super.key,
    required this.storageFolder,
    required this.entityType,
    required this.entityCode,
    String? imgType,
    required this.imgSeq,
    required this.imgRef,
    bool? isActive,
  })  : imgType = imgType ?? '',
        isActive = isActive ?? true;

  final String? storageFolder;
  final String? entityType;
  final String? entityCode;
  final String imgType;
  final int? imgSeq;
  final String? imgRef;
  final bool isActive;

  @override
  State<UploadPhotoWidget> createState() => _UploadPhotoWidgetState();
}

class _UploadPhotoWidgetState extends State<UploadPhotoWidget> {
  late UploadPhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadPhotoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.saveLoadImage = false;
      _model.isLoading = false;
      _model.curretImage = widget.imgRef;
      safeSetState(() {});
      _model.queryImage = await queryImgsRecordOnce(
        queryBuilder: (imgsRecord) => imgsRecord
            .where(
              'e_type',
              isEqualTo: widget.entityType,
            )
            .where(
              'e_code',
              isEqualTo: widget.entityCode,
            )
            .where(
              'i_type',
              isEqualTo: widget.imgType,
            )
            .where(
              'i_seq',
              isEqualTo: widget.imgSeq,
            ),
      );
      if (_model.queryImage!.isNotEmpty) {
        _model.curretImage = _model.queryImage?.first.iRef;
        _model.imageRef = _model.queryImage?.first.reference;
        safeSetState(() {});
      }
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      if (_model.saveLoadImage == false)
                        Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 250.0,
                            constraints: const BoxConstraints(
                              maxWidth: 400.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.curretImage != null &&
                                        _model.curretImage != '') {
                                      context.pushNamed(
                                        'Show_image',
                                        queryParameters: {
                                          'imageURL': serializeParam(
                                            _model.curretImage,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      _model.curretImage != null &&
                                              _model.curretImage != ''
                                          ? functions.stringToImagePath(
                                              _model.curretImage)!
                                          : ' ',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.jpg',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (_model.saveLoadImage == true)
                        Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 250.0,
                            constraints: const BoxConstraints(
                              maxWidth: 400.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: AuthUserStreamWidget(
                              builder: (context) => ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.memory(
                                  _model.uplodedImage?.bytes ??
                                      Uint8List.fromList([]),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (widget.isActive == true)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: 100.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  disabledColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  disabledIconColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  icon: Icon(
                                    Icons.remove,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 15.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: (_model.imageRef == null)
                                      ? null
                                      : () async {
                                          await _model.imageRef!.delete();
                                          await actions.deleteImageByURL(
                                            _model.curretImage!,
                                          );
                                          _model.curretImage = null;
                                          _model.imageRef = null;
                                          safeSetState(() {});
                                          await _model.updateEntityImageAction(
                                            context,
                                            imgURL: '\'\'',
                                          );
                                        },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: 100.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  disabledColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  disabledIconColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  icon: Icon(
                                    Icons.save,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 15.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: (_model.saveLoadImage == false)
                                      ? null
                                      : () async {
                                          // StartSaving
                                          _model.isLoading = true;
                                          safeSetState(() {});
                                          // save_cus_photo
                                          _model.photoRef =
                                              await actions.saveImageToStorage1(
                                            _model.uplodedImage,
                                            widget.storageFolder!,
                                            widget.entityType!,
                                            widget.entityCode!,
                                            widget.imgType,
                                            widget.imgSeq!,
                                          );
                                          // read image from DB
                                          _model.savedImageDoc =
                                              await ImgsRecord.getDocumentOnce(
                                                  _model.photoRef!);
                                          _model.saveLoadImage = false;
                                          _model.isLoading = false;
                                          _model.curretImage =
                                              _model.savedImageDoc?.iRef;
                                          _model.imageRef = _model.photoRef;
                                          safeSetState(() {});
                                          await _model.updateEntityImageAction(
                                            context,
                                            imgURL: _model.curretImage,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Data saved correctlly',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 1450),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          );

                                          safeSetState(() {});
                                        },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: 100.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  disabledColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  disabledIconColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  icon: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 15.0,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: ((_model.isLoading == true) ||
                                          (_model.imageRef != null))
                                      ? null
                                      : () async {
                                          var shouldSetState = false;
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            allowPhoto: true,
                                            pickerFontFamily: 'Cairo',
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();
                                            } finally {
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          _model.nFileSize =
                                              await actions.getFileSize(
                                            _model.uploadedLocalFile,
                                          );
                                          shouldSetState = true;
                                          if (_model.nFileSize! > 4) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text('مساحة الملف'),
                                                  content: Text(
                                                      'مساحة الملف اكبر من 4 ميجا. من فضلك اختار  مساحة اصغر(${valueOrDefault<String>(
                                                    _model.nFileSize
                                                        ?.toString(),
                                                    '0',
                                                  )}MB)'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('اوك'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          }
                                          _model.uplodedImage =
                                              _model.uploadedLocalFile;
                                          _model.saveLoadImage = true;
                                          safeSetState(() {});
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('حفظ الصورة'),
                                                content: const Text(
                                                    'من فضلك قم بحفظ الصورة!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('اوك'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                        },
                                ),
                              ]
                                  .divide(const SizedBox(width: 20.0))
                                  .addToStart(const SizedBox(width: 0.0))
                                  .addToEnd(const SizedBox(width: 0.0)),
                            ),
                          ),
                        ),
                      ),
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
