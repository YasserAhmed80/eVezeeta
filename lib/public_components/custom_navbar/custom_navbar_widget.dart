import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/nav_item_component/nav_item_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_navbar_model.dart';
export 'custom_navbar_model.dart';

class CustomNavbarWidget extends StatefulWidget {
  const CustomNavbarWidget({super.key});

  @override
  State<CustomNavbarWidget> createState() => _CustomNavbarWidgetState();
}

class _CustomNavbarWidgetState extends State<CustomNavbarWidget> {
  late CustomNavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomNavbarModel());

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

    return Opacity(
      opacity: 0.95,
      child: Container(
        height: 65.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Builder(
              builder: (context) {
                if (FFAppState().currentProfileType == 1) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.doctor_search,
                            desc: 'Search',
                            icon: Icon(
                              Icons.search_sharp,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.doctor_dashboard,
                            desc: 'Dashboard',
                            icon: Icon(
                              Icons.dashboard_customize,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.doctor_visits,
                            desc: 'Visits',
                            icon: Icon(
                              Icons.visibility_outlined,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.dotor_profile,
                            desc: 'Profile',
                            icon: Icon(
                              Icons.person_2,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel5,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.doctor_message,
                            desc: 'Messages',
                            icon: Icon(
                              Icons.message_outlined,
                            ),
                            showNotification: true,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel6,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.doctor_new,
                            desc: 'Add',
                            icon: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 5.0)).around(const SizedBox(width: 5.0)),
                  );
                } else if (FFAppState().currentProfileType == 2) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel7,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.customer_search,
                            desc: 'Search',
                            icon: Icon(
                              Icons.search_sharp,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel8,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.customer_list,
                            desc: 'List',
                            icon: Icon(
                              Icons.list_alt,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel9,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.customer_booking,
                            desc: 'Booking',
                            icon: Icon(
                              Icons.calendar_month,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel10,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.customer_profile,
                            desc: 'Profile',
                            icon: Icon(
                              Icons.person_2,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: wrapWithModel(
                          model: _model.navItemComponentModel11,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavItemComponentWidget(
                            navType: EnumSelectedTab.customer_add,
                            desc: 'Add',
                            icon: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 5.0)).around(const SizedBox(width: 5.0)),
                  );
                } else {
                  return const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
