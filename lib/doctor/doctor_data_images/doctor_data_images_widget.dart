import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/public_components/upload_photo/upload_photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'doctor_data_images_model.dart';
export 'doctor_data_images_model.dart';

class DoctorDataImagesWidget extends StatefulWidget {
  const DoctorDataImagesWidget({
    super.key,
    required this.docDocument,
    required this.isNewDoctor,
  });

  final DocRecord? docDocument;
  final bool? isNewDoctor;

  @override
  State<DoctorDataImagesWidget> createState() => _DoctorDataImagesWidgetState();
}

class _DoctorDataImagesWidgetState extends State<DoctorDataImagesWidget> {
  late DoctorDataImagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoctorDataImagesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'jx7kwnlm' /* ادخال صور العمل */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Cairo',
                        color: FlutterFlowTheme.of(context).secondary,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (widget.isNewDoctor == false)
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        'doctor_account',
                        queryParameters: {
                          'docRef': serializeParam(
                            widget.docDocument?.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                  ),
              ],
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 770.0,
                        ),
                        decoration: const BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.location_history_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'c1uxqt35' /* صورة الطبيب */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .around(const SizedBox(width: 5.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 300.0,
                                    decoration: const BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.uploadPhotoModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: UploadPhotoWidget(
                                        storageFolder: 'doc',
                                        entityType: 'doc',
                                        entityCode:
                                            widget.docDocument!.reference.id,
                                        imgType: 'p',
                                        imgSeq: 1,
                                        imgRef: '\'\'',
                                        isActive: true,
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .around(const SizedBox(width: 5.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.home,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'erp0r5xv' /* صور العيادة */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .around(const SizedBox(width: 5.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'h0mvthzk' /* 1 */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Cairo',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      width: 300.0,
                                      decoration: const BoxDecoration(),
                                      child: wrapWithModel(
                                        model: _model.uploadPhotoModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: UploadPhotoWidget(
                                          storageFolder: 'doc',
                                          entityType: 'doc',
                                          entityCode:
                                              widget.docDocument!.reference.id,
                                          imgType: 'h',
                                          imgSeq: 2,
                                          imgRef: '\'\'',
                                          isActive: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .around(const SizedBox(width: 5.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'myvv12n7' /* 2 */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Cairo',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      width: 300.0,
                                      decoration: const BoxDecoration(),
                                      child: wrapWithModel(
                                        model: _model.uploadPhotoModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: UploadPhotoWidget(
                                          storageFolder: 'doc',
                                          entityType: 'doc',
                                          entityCode:
                                              widget.docDocument!.reference.id,
                                          imgType: 'h',
                                          imgSeq: 3,
                                          imgRef: '\'\'',
                                          isActive: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .around(const SizedBox(width: 5.0)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.receipt,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '1qrdz17y' /* صورة إثبات بطاقة مزاولة المهنة */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Cairo',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ]
                                      .divide(const SizedBox(width: 5.0))
                                      .around(const SizedBox(width: 5.0)),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 300.0,
                                    decoration: const BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.uploadPhotoModel4,
                                      updateCallback: () => safeSetState(() {}),
                                      child: UploadPhotoWidget(
                                        storageFolder: 'doc',
                                        entityType: 'doc',
                                        entityCode:
                                            widget.docDocument!.reference.id,
                                        imgType: 'f',
                                        imgSeq: 1,
                                        imgRef: '\'\'',
                                        isActive: true,
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 5.0))
                                    .around(const SizedBox(width: 5.0)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Icon(
                                          Icons.library_books,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'g1qvau7w' /* صورة إثبات اللقب المهني  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Cairo',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ]
                                      .divide(const SizedBox(width: 5.0))
                                      .around(const SizedBox(width: 5.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 300.0,
                                      decoration: const BoxDecoration(),
                                      child: wrapWithModel(
                                        model: _model.uploadPhotoModel5,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: UploadPhotoWidget(
                                          storageFolder: 'doc',
                                          entityType: 'doc',
                                          entityCode:
                                              widget.docDocument!.reference.id,
                                          imgType: 'f',
                                          imgSeq: 1,
                                          imgRef: '\'\'',
                                          isActive: true,
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(width: 5.0))
                                      .around(const SizedBox(width: 5.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 50.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (widget.isNewDoctor == true)
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'registerationStep',
                                            queryParameters: {
                                              'docDocument': serializeParam(
                                                widget.docDocument,
                                                ParamType.Document,
                                              ),
                                              'stepType': serializeParam(
                                                'docTime',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'docDocument':
                                                  widget.docDocument,
                                            },
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'wpyko5ui' /* تم حفظ الصور */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                  ]
                                      .divide(const SizedBox(width: 5.0))
                                      .around(const SizedBox(width: 5.0)),
                                ),
                              ),
                            ].divide(const SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
