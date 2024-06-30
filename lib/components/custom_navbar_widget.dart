import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
      height: 65.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterFlowIconButton(
                borderColor: FFAppState().selectedNavTab == 1
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: 20.0,
                borderWidth: 0.5,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.select_all_outlined,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'customer_new_initial',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );

                  FFAppState().selectedNavTab = 1;
                  setState(() {});
                },
              ),
              FlutterFlowIconButton(
                borderColor: FFAppState().selectedNavTab == 2
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: 20.0,
                borderWidth: 0.5,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.favorite_border,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'profile_images_Edit',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );

                  FFAppState().selectedNavTab = 2;
                  setState(() {});
                },
              ),
              FlutterFlowIconButton(
                borderColor: FFAppState().selectedNavTab == 3
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: 20.0,
                borderWidth: 0.5,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.chat_bubble_outline_sharp,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'customer_details',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );

                  FFAppState().selectedNavTab = 3;
                  setState(() {});
                },
              ),
              FlutterFlowIconButton(
                borderColor: FFAppState().selectedNavTab == 4
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: 20.0,
                borderWidth: 0.5,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'customer_new',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );

                  FFAppState().selectedNavTab = 4;
                  setState(() {});
                },
              ),
              FlutterFlowIconButton(
                borderColor: FFAppState().selectedNavTab == 5
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: 20.0,
                borderWidth: 0.5,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.settings_sharp,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'appSettings',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );

                  FFAppState().selectedNavTab = 5;
                  setState(() {});
                },
              ),
            ].divide(const SizedBox(width: 5.0)).around(const SizedBox(width: 5.0)),
          ),
        ],
      ),
    );
  }
}
