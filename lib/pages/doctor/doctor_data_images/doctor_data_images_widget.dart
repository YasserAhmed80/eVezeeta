import '/components/custom_navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/public_components/upload_photo/upload_photo_widget.dart';
import 'package:flutter/material.dart';
import 'doctor_data_images_model.dart';
export 'doctor_data_images_model.dart';

class DoctorDataImagesWidget extends StatefulWidget {
  const DoctorDataImagesWidget({super.key});

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'jx7kwnlm' /* ادخال صور العمل */,
            ),
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Cairo',
                  color: FlutterFlowTheme.of(context).secondary,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Container(
          constraints: const BoxConstraints(
            maxWidth: 770.0,
          ),
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Text(
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
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Container(
                            width: 300.0,
                            height: 200.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFC7B9B9),
                            ),
                            child: wrapWithModel(
                              model: _model.uploadPhotoModel,
                              updateCallback: () => setState(() {}),
                              child: const UploadPhotoWidget(
                                storageFolder: 'doc',
                                entityType: 'doc',
                                entityCode: '100',
                                imgType: 'p',
                                imgSeq: 1,
                                imgRef: '\'\'',
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
                          width: 300.0,
                          height: 200.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFFC7B9B9),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://picsum.photos/seed/512/600',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 5.0))
                          .around(const SizedBox(width: 5.0)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '1qrdz17y' /* صورة إثبات بطاقة مزاولة المهنة... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Cairo',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                          height: 200.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFFC7B9B9),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://picsum.photos/seed/992/600',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 5.0))
                          .around(const SizedBox(width: 5.0)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Text(
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
                          ),
                        ]
                            .divide(const SizedBox(width: 5.0))
                            .around(const SizedBox(width: 5.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300.0,
                            height: 200.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFC7B9B9),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://picsum.photos/seed/909/600',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
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
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.customNavbarModel,
                  updateCallback: () => setState(() {}),
                  child: const CustomNavbarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
