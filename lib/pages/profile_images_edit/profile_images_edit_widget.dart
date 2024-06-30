import '/backend/backend.dart';
import '/components/custom_navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/public_components/show_photo_from_d_b/show_photo_from_d_b_widget.dart';
import '/pages/public_components/upload_photo/upload_photo_widget.dart';
import 'package:flutter/material.dart';
import 'profile_images_edit_model.dart';
export 'profile_images_edit_model.dart';

class ProfileImagesEditWidget extends StatefulWidget {
  const ProfileImagesEditWidget({super.key});

  @override
  State<ProfileImagesEditWidget> createState() =>
      _ProfileImagesEditWidgetState();
}

class _ProfileImagesEditWidgetState extends State<ProfileImagesEditWidget> {
  late ProfileImagesEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileImagesEditModel());

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
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'hb7pqe4h' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Cairo',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'hhdd7kht' /* من فضلك ادخل 5 صور مناسبه */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 300.0,
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: wrapWithModel(
                      model: _model.uploadPhotoModel,
                      updateCallback: () => setState(() {}),
                      child: const UploadPhotoWidget(
                        storageFolder: 'cus_photos',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 800.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: StreamBuilder<List<CusPhotosRecord>>(
                        stream: queryCusPhotosRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<CusPhotosRecord> gridViewCusPhotosRecordList =
                              snapshot.data!;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewCusPhotosRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewCusPhotosRecord =
                                  gridViewCusPhotosRecordList[gridViewIndex];
                              return Container(
                                constraints: const BoxConstraints(
                                  maxHeight: 300.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                  shape: BoxShape.rectangle,
                                ),
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: ShowPhotoFromDBWidget(
                                    key: Key(
                                        'Keywvq_${gridViewIndex}_of_${gridViewCusPhotosRecordList.length}'),
                                    docRef: gridViewCusPhotosRecord,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                decoration: const BoxDecoration(),
                child: wrapWithModel(
                  model: _model.customNavbarModel,
                  updateCallback: () => setState(() {}),
                  child: const CustomNavbarWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
