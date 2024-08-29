import '/backend/backend.dart';
import '/components/doctor_data_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'customer_favorit_doc_model.dart';
export 'customer_favorit_doc_model.dart';

class CustomerFavoritDocWidget extends StatefulWidget {
  const CustomerFavoritDocWidget({
    super.key,
    required this.cusDocument,
  });

  final CusRecord? cusDocument;

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
          isEqualTo: FFAppState().currentCustomer.cusDocRef,
        ),
      );
      _model.loopIndex = 0;
      _model.loopMax = valueOrDefault<int>(
        _model.returnedDocRef?.length,
        0,
      );
      setState(() {});
      while (_model.loopIndex! < _model.loopMax!) {
        _model.readDoctor = await DocRecord.getDocumentOnce(
            _model.returnedDocRef![_model.loopIndex!].docRef!);
        _model.addToDoctorDocumentList(_model.readDoctor!);
        setState(() {});
        _model.loopIndex = _model.loopIndex! + 1;
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              '7nrxvhuc' /* اطبائي */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Cairo',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: const BoxConstraints(
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
                        final docitem = _model.doctorDocumentList.toList();

                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: docitem.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                          itemBuilder: (context, docitemIndex) {
                            final docitemItem = docitem[docitemIndex];
                            return DoctorDataComponentWidget(
                              key: Key(
                                  'Keyvxk_${docitemIndex}_of_${docitem.length}'),
                              docDocument: docitemItem,
                            );
                          },
                        );
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
