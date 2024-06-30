import '/components/custom_navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/customers/components/profile_edit_main_item/profile_edit_main_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'customer_new_initial_model.dart';
export 'customer_new_initial_model.dart';

class CustomerNewInitialWidget extends StatefulWidget {
  const CustomerNewInitialWidget({super.key});

  @override
  State<CustomerNewInitialWidget> createState() =>
      _CustomerNewInitialWidgetState();
}

class _CustomerNewInitialWidgetState extends State<CustomerNewInitialWidget> {
  late CustomerNewInitialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerNewInitialModel());

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'vdvi26hu' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Cairo',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 30.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'mnyz4zrt' /* السلام عليكم و رحمة الله */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: TextFormField(
                      controller: _model.nameTextController,
                      focusNode: _model.nameFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.nameTextController',
                        const Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          '06hjmisa' /* الاسم  */,
                        ),
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Cairo',
                                  letterSpacing: 0.0,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Cairo',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        suffixIcon: _model.nameTextController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.nameTextController?.clear();
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.clear,
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Cairo',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                      validator: _model.nameTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Builder(
                            builder: (context) {
                              final countryRef = FFAppState()
                                  .appStateRefData
                                  .map((e) => e)
                                  .toList()
                                  .where((e) => e.source == 'country')
                                  .toList()
                                  .sortedList((e) => e.code)
                                  .toList();
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(countryRef.length,
                                    (countryRefIndex) {
                                  final countryRefItem =
                                      countryRef[countryRefIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.selectedCountry =
                                            countryRefItem.code;
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: _model.selectedCountry ==
                                                  countryRefItem.code
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: _model.selectedCountry ==
                                                    countryRefItem.code
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .customColor1,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, -1.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  countryRefItem.desc,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Cairo',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    functions.stringToImagePath(
                                                        countryRefItem.imgUrl)!,
                                                    width: 80.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ]
                                                  .divide(const SizedBox(height: 5.0))
                                                  .around(
                                                      const SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(width: 20.0))
                        .addToStart(const SizedBox(width: 5.0))
                        .addToEnd(const SizedBox(width: 5.0)),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 0.0),
                          child: wrapWithModel(
                            model: _model.profileEditMainItemModel,
                            updateCallback: () => setState(() {}),
                            child: ProfileEditMainItemWidget(
                              itemCode: _model.selectedCovern!,
                              itemType: 'cities',
                              itemLable: 'اخار المدينة',
                              countryCode: _model.selectedCountry!,
                              actionCallBack: (actionReturn) async {
                                _model.selectedCovern = actionReturn;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                decoration: const BoxDecoration(),
                child: wrapWithModel(
                  model: _model.customNavbarModel,
                  updateCallback: () => setState(() {}),
                  child: const CustomNavbarWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
