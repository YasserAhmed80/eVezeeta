import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_item_component_model.dart';
export 'nav_item_component_model.dart';

class NavItemComponentWidget extends StatefulWidget {
  const NavItemComponentWidget({
    super.key,
    required this.navType,
    required this.desc,
    required this.icon,
    bool? showNotification,
  }) : showNotification = showNotification ?? false;

  final EnumSelectedTab? navType;
  final String? desc;
  final Widget? icon;
  final bool showNotification;

  @override
  State<NavItemComponentWidget> createState() => _NavItemComponentWidgetState();
}

class _NavItemComponentWidgetState extends State<NavItemComponentWidget> {
  late NavItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavItemComponentModel());

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

    return Builder(
      builder: (context) {
        if (widget.showNotification == false) {
          return Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.navType == EnumSelectedTab.doctor_search) {
                  context.pushNamed('doctor_search');

                  FFAppState().selectedNavTab = EnumSelectedTab.doctor_search;
                  safeSetState(() {});
                } else {
                  if (widget.navType == EnumSelectedTab.doctor_new) {
                    context.pushNamed(
                      'doctor_data_main',
                      queryParameters: {
                        'docDocument': serializeParam(
                          null,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'docDocument': null,
                      },
                    );

                    FFAppState().selectedNavTab = EnumSelectedTab.doctor_new;
                    safeSetState(() {});
                  } else {
                    if (widget.navType == EnumSelectedTab.doctor_dashboard) {
                      context.pushNamed(
                        'doctor_dashboard',
                        queryParameters: {
                          'docRef': serializeParam(
                            FFAppState().currentDoctor.dbDocRef,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );

                      FFAppState().selectedNavTab =
                          EnumSelectedTab.doctor_dashboard;
                      safeSetState(() {});
                    } else {
                      if (widget.navType == EnumSelectedTab.dotor_profile) {
                        context.pushNamed(
                          'doctor_account',
                          queryParameters: {
                            'docRef': serializeParam(
                              FFAppState().currentDoctor.dbDocRef,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );

                        FFAppState().selectedNavTab =
                            EnumSelectedTab.dotor_profile;
                        safeSetState(() {});
                      } else {
                        if (widget.navType == EnumSelectedTab.customer_list) {
                          context.pushNamed('customer_List');

                          FFAppState().selectedNavTab =
                              EnumSelectedTab.customer_list;
                          safeSetState(() {});
                        } else {
                          if (widget.navType ==
                              EnumSelectedTab.customer_profile) {
                            context.pushNamed(
                              'customer_account',
                              queryParameters: {
                                'cusRef': serializeParam(
                                  FFAppState().currentCustomer.cusDocRef,
                                  ParamType.DocumentReference,
                                ),
                                'isNewCustomer': serializeParam(
                                  false,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );

                            FFAppState().selectedNavTab =
                                EnumSelectedTab.customer_profile;
                            safeSetState(() {});
                          } else {
                            if (widget.navType ==
                                EnumSelectedTab.customer_search) {
                              context.pushNamed('doctor_search');

                              FFAppState().selectedNavTab =
                                  EnumSelectedTab.customer_search;
                              safeSetState(() {});
                            } else {
                              if (widget.navType ==
                                  EnumSelectedTab.customer_booking) {
                                context.pushNamed(
                                  'customer_doc_booked',
                                  queryParameters: {
                                    'cusRef': serializeParam(
                                      FFAppState().currentCustomer.cusDocRef,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );

                                FFAppState().selectedNavTab =
                                    EnumSelectedTab.customer_booking;
                                safeSetState(() {});
                              } else {
                                if (widget.navType ==
                                    EnumSelectedTab.doctor_visits) {
                                  context.pushNamed(
                                    'doctor_booking_center',
                                    queryParameters: {
                                      'docRef': serializeParam(
                                        FFAppState().currentDoctor.dbDocRef,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );

                                  FFAppState().selectedNavTab =
                                      EnumSelectedTab.doctor_visits;
                                  safeSetState(() {});
                                } else {
                                  if (widget.navType ==
                                      EnumSelectedTab.customer_add) {
                                    context.pushNamed(
                                      'cus_main_data',
                                      queryParameters: {
                                        'cusRef': serializeParam(
                                          null,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );

                                    FFAppState().updateCurrentCustomerStruct(
                                      (e) => e
                                        ..img = null
                                        ..cusDocRef = null,
                                    );
                                    safeSetState(() {});
                                    FFAppState().selectedNavTab =
                                        EnumSelectedTab.customer_add;
                                    safeSetState(() {});
                                  } else {
                                    if (widget.navType ==
                                        EnumSelectedTab.doctor_message) {
                                      context.pushNamed(
                                        'doctor_message_center',
                                        queryParameters: {
                                          'docRef': serializeParam(
                                            FFAppState().currentDoctor.dbDocRef,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );

                                      FFAppState().selectedNavTab =
                                          EnumSelectedTab.doctor_message;
                                      safeSetState(() {});
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Opacity(
                    opacity: valueOrDefault<double>(
                      FFAppState().selectedNavTab == widget.navType
                          ? 1.0
                          : 0.0,
                      0.0,
                    ),
                    child: SizedBox(
                      width: 40.0,
                      child: Divider(
                        thickness: 3.0,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                  widget.icon!,
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.desc,
                        'nn',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Cairo',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.navType == EnumSelectedTab.doctor_search) {
                  context.pushNamed('doctor_search');

                  FFAppState().selectedNavTab = EnumSelectedTab.doctor_search;
                  safeSetState(() {});
                } else {
                  if (widget.navType == EnumSelectedTab.doctor_new) {
                    context.pushNamed(
                      'doctor_data_main',
                      queryParameters: {
                        'docDocument': serializeParam(
                          null,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'docDocument': null,
                      },
                    );

                    FFAppState().selectedNavTab = EnumSelectedTab.doctor_new;
                    safeSetState(() {});
                  } else {
                    if (widget.navType == EnumSelectedTab.doctor_dashboard) {
                      context.pushNamed(
                        'doctor_dashboard',
                        queryParameters: {
                          'docRef': serializeParam(
                            FFAppState().currentDoctor.dbDocRef,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );

                      FFAppState().selectedNavTab =
                          EnumSelectedTab.doctor_dashboard;
                      safeSetState(() {});
                    } else {
                      if (widget.navType == EnumSelectedTab.dotor_profile) {
                        context.pushNamed(
                          'doctor_account',
                          queryParameters: {
                            'docRef': serializeParam(
                              FFAppState().currentDoctor.dbDocRef,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );

                        FFAppState().selectedNavTab =
                            EnumSelectedTab.dotor_profile;
                        safeSetState(() {});
                      } else {
                        if (widget.navType == EnumSelectedTab.customer_list) {
                          context.pushNamed('customer_List');

                          FFAppState().selectedNavTab =
                              EnumSelectedTab.customer_list;
                          safeSetState(() {});
                        } else {
                          if (widget.navType ==
                              EnumSelectedTab.customer_profile) {
                            context.pushNamed(
                              'customer_account',
                              queryParameters: {
                                'cusRef': serializeParam(
                                  FFAppState().currentCustomer.cusDocRef,
                                  ParamType.DocumentReference,
                                ),
                                'isNewCustomer': serializeParam(
                                  false,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );

                            FFAppState().selectedNavTab =
                                EnumSelectedTab.customer_profile;
                            safeSetState(() {});
                          } else {
                            if (widget.navType ==
                                EnumSelectedTab.customer_search) {
                              context.pushNamed('doctor_search');

                              FFAppState().selectedNavTab =
                                  EnumSelectedTab.customer_search;
                              safeSetState(() {});
                            } else {
                              if (widget.navType ==
                                  EnumSelectedTab.customer_booking) {
                                context.pushNamed(
                                  'customer_doc_booked',
                                  queryParameters: {
                                    'cusRef': serializeParam(
                                      FFAppState().currentCustomer.cusDocRef,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );

                                FFAppState().selectedNavTab =
                                    EnumSelectedTab.customer_booking;
                                safeSetState(() {});
                              } else {
                                if (widget.navType ==
                                    EnumSelectedTab.doctor_visits) {
                                  context.pushNamed(
                                    'doctor_booking_center',
                                    queryParameters: {
                                      'docRef': serializeParam(
                                        FFAppState().currentDoctor.dbDocRef,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );

                                  FFAppState().selectedNavTab =
                                      EnumSelectedTab.doctor_visits;
                                  safeSetState(() {});
                                } else {
                                  if (widget.navType ==
                                      EnumSelectedTab.customer_add) {
                                    context.pushNamed(
                                      'cus_main_data',
                                      queryParameters: {
                                        'cusRef': serializeParam(
                                          null,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );

                                    FFAppState().updateCurrentCustomerStruct(
                                      (e) => e
                                        ..img = null
                                        ..cusDocRef = null,
                                    );
                                    safeSetState(() {});
                                    FFAppState().selectedNavTab =
                                        EnumSelectedTab.customer_add;
                                    safeSetState(() {});
                                  } else {
                                    if (widget.navType ==
                                        EnumSelectedTab.doctor_message) {
                                      context.pushNamed(
                                        'doctor_message_center',
                                        queryParameters: {
                                          'docRef': serializeParam(
                                            FFAppState().currentDoctor.dbDocRef,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );

                                      FFAppState().selectedNavTab =
                                          EnumSelectedTab.doctor_message;
                                      safeSetState(() {});
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Opacity(
                    opacity: valueOrDefault<double>(
                      FFAppState().selectedNavTab == widget.navType
                          ? 1.0
                          : 0.0,
                      0.0,
                    ),
                    child: SizedBox(
                      width: 40.0,
                      child: Divider(
                        thickness: 3.0,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                  FutureBuilder<int>(
                    future: queryNotificationRecordCount(
                      queryBuilder: (notificationRecord) => notificationRecord
                          .where(
                            'e_id',
                            isEqualTo: FFAppState().currentDoctor.dbDocRef?.id,
                          )
                          .where(
                            'e_type',
                            isEqualTo: 'doc',
                          )
                          .where(
                            'seen_ind',
                            isEqualTo: false,
                          ),
                    ),
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
                      int rowCount = snapshot.data!;

                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          badges.Badge(
                            badgeContent: Text(
                              valueOrDefault<String>(
                                rowCount.toString(),
                                '0',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            showBadge: rowCount != 0,
                            shape: badges.BadgeShape.circle,
                            badgeColor: FlutterFlowTheme.of(context).error,
                            elevation: 4.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            position: badges.BadgePosition.topStart(),
                            animationType: badges.BadgeAnimationType.scale,
                            toAnimate: true,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 3.0, 0.0),
                              child: widget.icon!,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.desc,
                        'nn',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Cairo',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
