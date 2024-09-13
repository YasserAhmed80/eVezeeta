import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/doctor/doctor_data_component/doctor_data_component_widget.dart';
import '/pages/public_components/empty_list_component/empty_list_component_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'customer_favorit_doc_model.dart';
export 'customer_favorit_doc_model.dart';

class CustomerFavoritDocWidget extends StatefulWidget {
  const CustomerFavoritDocWidget({
    super.key,
    required this.cusRef,
  });

  final DocumentReference? cusRef;

  @override
  State<CustomerFavoritDocWidget> createState() =>
      _CustomerFavoritDocWidgetState();
}

class _CustomerFavoritDocWidgetState extends State<CustomerFavoritDocWidget> {
  late CustomerFavoritDocModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerFavoritDocModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.returnedDocRef = await queryCusFavDocRecordOnce(
        queryBuilder: (cusFavDocRecord) => cusFavDocRecord.where(
          'cus_ref',
          isEqualTo: widget!.cusRef,
        ),
      );
      _model.loopIndex = 0;
      _model.loopMax = valueOrDefault<int>(
        _model.returnedDocRef?.length,
        0,
      );
      safeSetState(() {});
      while (_model.loopIndex! < _model.loopMax!) {
        if (_model.returnedDocRef?[_model.loopIndex!]?.docRef != null) {
          _model.readDocDocument = await DocRecord.getDocumentOnce(
              _model.returnedDocRef![_model.loopIndex!].docRef!);
          _model.addToDoctorDocumentList(_model.readDocDocument!);
          safeSetState(() {});
        }
        _model.loopIndex = _model.loopIndex! + 1;
        safeSetState(() {});
      }
    });

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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  FFLocalizations.of(context).getText(
                    '7nrxvhuc' /* اطبائي المفضلين */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Cairo',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 700.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        if (_model.doctorDocumentList.length > 0) {
                          return Builder(
                            builder: (context) {
                              final docitem =
                                  _model.doctorDocumentList.toList();

                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 5.0),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: docitem.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 5.0),
                                itemBuilder: (context, docitemIndex) {
                                  final docitemItem = docitem[docitemIndex];
                                  return DoctorDataComponentWidget(
                                    key: Key(
                                        'Keyvxk_${docitemIndex}_of_${docitem.length}'),
                                    docDocumentInput: docitemItem,
                                    pageType: 'search',
                                    docRef: null,
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          return Container(
                            height: 200.0,
                            child: wrapWithModel(
                              model: _model.emptyListComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              child: EmptyListComponentWidget(
                                desc: 'لايوجد اختيارات!',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
