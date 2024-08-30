import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

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
            setState(() {});
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
              setState(() {});
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

                FFAppState().selectedNavTab = EnumSelectedTab.doctor_dashboard;
                setState(() {});
              } else {
                if (widget.navType == EnumSelectedTab.dotor_profile) {
                  context.pushNamed(
                    'doctor_profile',
                    queryParameters: {
                      'docRef': serializeParam(
                        FFAppState().currentDoctor.dbDocRef,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );

                  FFAppState().selectedNavTab = EnumSelectedTab.dotor_profile;
                  setState(() {});
                } else {
                  if (widget.navType == EnumSelectedTab.customer_list) {
                    context.pushNamed('customer_List');

                    FFAppState().selectedNavTab = EnumSelectedTab.customer_list;
                    setState(() {});
                  } else {
                    if (widget.navType == EnumSelectedTab.customer_profile) {
                      context.pushNamed(
                        'customer_profile',
                        queryParameters: {
                          'cusRef': serializeParam(
                            FFAppState().currentCustomer.cusDocRef,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );

                      FFAppState().selectedNavTab =
                          EnumSelectedTab.customer_profile;
                      setState(() {});
                    } else {
                      if (widget.navType == EnumSelectedTab.customer_search) {
                        context.pushNamed('doctor_search');

                        FFAppState().selectedNavTab =
                            EnumSelectedTab.customer_search;
                        setState(() {});
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
                          setState(() {});
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
                            setState(() {});
                          } else {
                            if (widget.navType ==
                                EnumSelectedTab.customer_add) {
                              context.pushNamed(
                                'cus_main_data',
                                queryParameters: {
                                  'cusRef': serializeParam(
                                    FFAppState().currentCustomer.cusDocRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );

                              FFAppState().selectedNavTab =
                                  EnumSelectedTab.customer_add;
                              setState(() {});
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
                FFAppState().selectedNavTab == widget.navType ? 1.0 : 0.0,
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
  }
}
