import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doctor_files_component_model.dart';
export 'doctor_files_component_model.dart';

class DoctorFilesComponentWidget extends StatefulWidget {
  const DoctorFilesComponentWidget({
    super.key,
    required this.docRef,
  });

  final DocumentReference? docRef;

  @override
  State<DoctorFilesComponentWidget> createState() =>
      _DoctorFilesComponentWidgetState();
}

class _DoctorFilesComponentWidgetState
    extends State<DoctorFilesComponentWidget> {
  late DoctorFilesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoctorFilesComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.returnedData = await queryImgsRecordOnce(
        queryBuilder: (imgsRecord) => imgsRecord
            .where(
              'e_type',
              isEqualTo: 'doc',
            )
            .where(
              'e_code',
              isEqualTo: widget!.docRef?.id,
            )
            .orderBy('i_seq'),
      );
      // get image lisgt
      _model.imageList = _model.returnedData!
          .where((e) => e.iType == 'h')
          .toList()
          .sortedList(keyOf: (e) => e.iSeq, desc: false)
          .map((e) => e.iRef)
          .toList()
          .toList()
          .cast<String>();
      safeSetState(() {});
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (_model.imageList.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'nfpggb41' /* صور العيادة */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Cairo',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Builder(
                      builder: (context) {
                        final imageItem = _model.imageList.toList();

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(imageItem.length,
                                (imageItemIndex) {
                              final imageItemItem = imageItem[imageItemIndex];
                              return Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                ),
                                child: Opacity(
                                  opacity: 0.8,
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
                                            imageItemItem,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        functions
                                            .stringToImagePath(imageItemItem)!,
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.jpg',
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).divide(SizedBox(width: 10.0)),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          if (_model.returnedData?.where((e) => e.iType == 'f').toList() !=
                  null &&
              (_model.returnedData?.where((e) => e.iType == 'f').toList())!
                  .isNotEmpty)
            Builder(
              builder: (context) {
                final fileItem = _model.returnedData
                        ?.where((e) => e.iType == 'f')
                        .toList()
                        ?.toList() ??
                    [];

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(fileItem.length, (fileItemIndex) {
                    final fileItemItem = fileItem[fileItemIndex];
                    return Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                fileItemItem.iSeq == 1
                                    ? 'صورة إثبات بطاقة مزاولة المهنة'
                                    : 'صورة إثبات اللقب المهني',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                              ),
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
                                        fileItemItem.iRef,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    functions
                                        .stringToImagePath(fileItemItem.iRef)!,
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.jpg',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).divide(SizedBox(height: 5.0)),
                );
              },
            ),
        ].divide(SizedBox(height: 5.0)).around(SizedBox(height: 5.0)),
      ),
    );
  }
}
