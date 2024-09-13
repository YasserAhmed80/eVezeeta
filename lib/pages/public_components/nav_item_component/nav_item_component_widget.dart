import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_item_component_model.dart';
export 'nav_item_component_model.dart';

class NavItemComponentWidget extends StatefulWidget {
  const NavItemComponentWidget({
    super.key,
    required this.navType,
    required this.desc,
    required this.icon,
  });

  final EnumSelectedTab? navType;
  final String? desc;
  final Widget? icon;

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
          if (widget!.navType == EnumSelectedTab.doctor_search) {
            context.pushNamed('doctor_search');

            FFAppState().selectedNavTab = EnumSelectedTab.doctor_search;
            safeSetState(() {});
          } else {
            if (widget!.navType == EnumSelectedTab.doctor_new) {
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
              if (widget!.navType == EnumSelectedTab.doctor_dashboard) {
                context.pushNamed(
                  'doctor_dashboard',
                  queryParameters: {
                    'docRef': serializeParam(
                      FFAppState().currentDoctor.dbDocRef,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );

                FFAppState().selectedNavTab = EnumSelectedTab.doctor_dashboard;
                safeSetState(() {});
              } else {
                if (widget!.navType == EnumSelectedTab.dotor_profile) {
                  context.pushNamed(
                    'doctor_account',
                    queryParameters: {
                      'docRef': serializeParam(
                        FFAppState().currentDoctor.dbDocRef,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );

                  FFAppState().selectedNavTab = EnumSelectedTab.dotor_profile;
                  safeSetState(() {});
                } else {
                  if (widget!.navType == EnumSelectedTab.customer_list) {
                    context.pushNamed('customer_List');

                    FFAppState().selectedNavTab = EnumSelectedTab.customer_list;
                    safeSetState(() {});
                  } else {
                    if (widget!.navType == EnumSelectedTab.customer_profile) {
                      context.pushNamed(
                        'customer_profile',
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
                      if (widget!.navType == EnumSelectedTab.customer_search) {
                        context.pushNamed('doctor_search');

                        FFAppState().selectedNavTab =
                            EnumSelectedTab.customer_search;
                        safeSetState(() {});
                      } else {
                        if (widget!.navType ==
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
                          if (widget!.navType ==
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
                            if (widget!.navType ==
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
                FFAppState().selectedNavTab == widget!.navType ? 1.0 : 0.0,
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
            widget!.icon!,
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.desc,
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
}
