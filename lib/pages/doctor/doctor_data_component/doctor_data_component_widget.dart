import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/public_components/addrress_component/addrress_component_widget.dart';
import '/pages/public_components/image_component/image_component_widget.dart';
import '/pages/public_components/rating_component/rating_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'doctor_data_component_model.dart';
export 'doctor_data_component_model.dart';

class DoctorDataComponentWidget extends StatefulWidget {
  const DoctorDataComponentWidget({
    super.key,
    this.docDocumentInput,
    this.docRef,
  });

  final DocRecord? docDocumentInput;
  final DocumentReference? docRef;

  @override
  State<DoctorDataComponentWidget> createState() =>
      _DoctorDataComponentWidgetState();
}

class _DoctorDataComponentWidgetState extends State<DoctorDataComponentWidget>
    with TickerProviderStateMixin {
  late DoctorDataComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoctorDataComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.getDocDocumentAction(context);
      safeSetState(() {});
      await _model.getFavAction(context);
      safeSetState(() {});
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: FaIcon(
                            FontAwesomeIcons.solidArrowAltCircleLeft,
                            color: FlutterFlowTheme.of(context).cerise,
                            size: 20.0,
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            FFAppState()
                                .refDocType
                                .where((e) =>
                                    e.typeKey ==
                                    valueOrDefault<int>(
                                      _model.docDocument?.gender,
                                      -1,
                                    ))
                                .toList()
                                .first
                                .desc,
                            'n',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Cairo',
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'doctor_profile',
                                  queryParameters: {
                                    'docRef': serializeParam(
                                      _model.docDocument?.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Text(
                                valueOrDefault<String>(
                                  _model.docDocument?.name,
                                  'n',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Cairo',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 5.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              if (_model.isFavorite == true) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await _model.favDocRef!.delete();
                                    _model.isFavorite = false;
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.favorite_sharp,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 30.0,
                                  ),
                                );
                              } else {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var cusFavDocRecordReference =
                                        CusFavDocRecord.collection.doc();
                                    await cusFavDocRecordReference
                                        .set(createCusFavDocRecordData(
                                      cusRef: FFAppState()
                                          .currentCustomer
                                          .cusDocRef,
                                      docRef:
                                          widget.docDocumentInput?.reference,
                                    ));
                                    _model.createdFavDoc =
                                        CusFavDocRecord.getDocumentFromData(
                                            createCusFavDocRecordData(
                                              cusRef: FFAppState()
                                                  .currentCustomer
                                                  .cusDocRef,
                                              docRef: widget
                                                  .docDocumentInput?.reference,
                                            ),
                                            cusFavDocRecordReference);
                                    _model.isFavorite = true;
                                    _model.favDocRef =
                                        _model.createdFavDoc?.reference;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30.0,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 5.0))
                          .around(const SizedBox(width: 5.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.0,
                    constraints: const BoxConstraints(
                      maxWidth: 120.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.imageComponentModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ImageComponentWidget(
                              imgRef: _model.docDocument!.img,
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              minWidth: 50.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 2.0, 5.0, 2.0),
                              child: Text(
                                valueOrDefault<String>(
                                  FFAppState()
                                      .refDocTitle
                                      .where((e) =>
                                          e.titleKey ==
                                          _model.docDocument?.titleId)
                                      .toList()
                                      .first
                                      .desc,
                                  'n',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'doctor_profile',
                          queryParameters: {
                            'docRef': serializeParam(
                              _model.docDocument?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );

                        FFAppState().updateCurrentDoctorStruct(
                          (e) => e..dbDocRef = _model.docDocument?.reference,
                        );
                        safeSetState(() {});
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.docDocument?.title,
                                      'n',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Cairo',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ypb59s00' /* تخصص رئيسي:  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  FFAppState()
                                      .refCategory
                                      .where((e) =>
                                          e.catKey ==
                                          widget.docDocumentInput?.catId)
                                      .toList()
                                      .first
                                      .desc,
                                  'none',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '03b9v6br' /* تخصص فرعي:   */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final subCatIteam = _model
                                            .docDocument?.subCatId
                                            .toList() ??
                                        [];

                                    return Wrap(
                                      spacing: 2.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children:
                                          List.generate(subCatIteam.length,
                                              (subCatIteamIndex) {
                                        final subCatIteamItem =
                                            subCatIteam[subCatIteamIndex];
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                FFAppState()
                                                    .refSubCategory
                                                    .where((e) =>
                                                        e.subKey ==
                                                        subCatIteamItem)
                                                    .toList()
                                                    .first
                                                    .desc,
                                                'none',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Cairo',
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.ratingComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const RatingComponentWidget(),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'sx1exypl' /* 123  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'blusaqkl' /* تقيم */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.addrressComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: AddrressComponentWidget(
                                    zoneKey: valueOrDefault<int>(
                                      _model.docDocument?.aZone,
                                      -1,
                                    ),
                                    govKey: valueOrDefault<int>(
                                      _model.docDocument?.aGov,
                                      -1,
                                    ),
                                    areaKey: valueOrDefault<int>(
                                      _model.docDocument?.aArea,
                                      -1,
                                    ),
                                    addressDesc: valueOrDefault<String>(
                                      _model.docDocument?.aAddr,
                                      '-1',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]
                            .divide(const SizedBox(height: 5.0))
                            .around(const SizedBox(height: 5.0)),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 5.0)),
              ),
            ),
          ),
        ].divide(const SizedBox(height: 3.0)),
      ),
    );
  }
}
