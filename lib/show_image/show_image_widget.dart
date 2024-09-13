import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'show_image_model.dart';
export 'show_image_model.dart';

class ShowImageWidget extends StatefulWidget {
  const ShowImageWidget({
    super.key,
    required this.imageURL,
  });

  final String? imageURL;

  @override
  State<ShowImageWidget> createState() => _ShowImageWidgetState();
}

class _ShowImageWidgetState extends State<ShowImageWidget> {
  late ShowImageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowImageModel());

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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 40.0,
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 700.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: FlutterFlowExpandedImageView(
                          image: Image.network(
                            valueOrDefault<String>(
                              functions.stringToImagePath(widget!.imageURL),
                              'https://img.freepik.com/premium-photo/painting-clouds-sun-sky_1117379-6391.jpg?w=1380',
                            ),
                            fit: BoxFit.contain,
                            alignment: Alignment(0.0, 0.0),
                          ),
                          allowRotation: false,
                          tag: valueOrDefault<String>(
                            functions.stringToImagePath(widget!.imageURL),
                            'https://img.freepik.com/premium-photo/painting-clouds-sun-sky_1117379-6391.jpg?w=1380',
                          ),
                          useHeroAnimation: true,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: valueOrDefault<String>(
                      functions.stringToImagePath(widget!.imageURL),
                      'https://img.freepik.com/premium-photo/painting-clouds-sun-sky_1117379-6391.jpg?w=1380',
                    ),
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          functions.stringToImagePath(widget!.imageURL),
                          'https://img.freepik.com/premium-photo/painting-clouds-sun-sky_1117379-6391.jpg?w=1380',
                        ),
                        fit: BoxFit.fill,
                        alignment: Alignment(0.0, 0.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
