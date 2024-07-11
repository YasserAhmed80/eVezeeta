import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
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
  }) : imgType = imgType ?? '';

  final String? storageFolder;
  final String? entityType;
  final String? entityCode;
  final String imgType;
  final int? imgSeq;
  final String? imgRef;

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
      setState(() {});
      _model.queryImage = await queryImgsRecordOnce(
        queryBuilder: (imgsRecord) => imgsRecord.where(Filter.or(
          Filter(
            'e_type',
            isEqualTo: widget.entityType,
          ),
          Filter(
            'e_cde',
            isEqualTo: widget.entityCode,
          ),
          Filter(
            'i_type',
            isEqualTo: widget.imgType,
          ),
          Filter(
            'i_seq',
            isEqualTo: widget.imgSeq,
          ),
        )),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.queryImage?.reference != null) {
        _model.curretImage = _model.queryImage?.iRef;
        setState(() {});
      }
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
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: Container(
                width: double.infinity,
                height: 300.0,
                decoration: const BoxDecoration(),
                child: Stack(
                  alignment: const AlignmentDirectional(-0.0, -1.0),
                  children: [
                    if (_model.saveLoadImage == false)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 300.0,
                            constraints: const BoxConstraints(
                              maxWidth: 400.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    _model.curretImage != null &&
                                            _model.curretImage != ''
                                        ? functions.stringToImagePath(
                                            _model.curretImage)!
                                        : 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (_model.saveLoadImage == true)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 300.0,
                            constraints: const BoxConstraints(
                              maxWidth: 400.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
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
                      ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: 100.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              disabledColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              disabledIconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              icon: Icon(
                                Icons.save,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 24.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: (_model.saveLoadImage == false)
                                  ? null
                                  : () async {
                                      // StartSaving
                                      _model.isLoading = true;
                                      setState(() {});
                                      // save_cus_photo
                                      _model.photoUrl =
                                          await actions.saveImageToStorage1(
                                        _model.uplodedImage,
                                        widget.storageFolder!,
                                        widget.entityType!,
                                        widget.entityCode!,
                                        widget.imgType,
                                        widget.imgSeq!,
                                      );
                                      _model.saveLoadImage = false;
                                      _model.isLoading = false;
                                      _model.curretImage = _model.photoUrl;
                                      setState(() {});
                                      if ((widget.entityType == 'doc') &&
                                          (widget.imgType == 'p')) {
                                        FFAppState().updateCurrentDoctorStruct(
                                          (e) => e..img = _model.photoUrl,
                                        );
                                        setState(() {});

                                        await FFAppState()
                                            .currentDoctor
                                            .dbDocRef!
                                            .update(createDocRecordData(
                                              img: FFAppState()
                                                  .currentDoctor
                                                  .img,
                                            ));
                                      }
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Data saved correctlly',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );

                                      setState(() {});
                                    },
                            ),
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: 100.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              disabledColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              disabledIconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 24.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: (_model.isLoading == true)
                                  ? null
                                  : () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      _model.uplodedImage =
                                          _model.uploadedLocalFile;
                                      _model.saveLoadImage = true;
                                      setState(() {});
                                    },
                            ),
                          ]
                              .divide(const SizedBox(width: 20.0))
                              .addToStart(const SizedBox(width: 0.0))
                              .addToEnd(const SizedBox(width: 0.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
