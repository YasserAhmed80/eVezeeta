import '/backend/backend.dart';
import '/components/empty_list_component_widget.dart';
import '/components/switch_title_component_widget.dart';
import '/data_loading_components/load_categories_component/load_categories_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/public_components/custom_navbar/custom_navbar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doctor_data_main_model.dart';
export 'doctor_data_main_model.dart';

class DoctorDataMainWidget extends StatefulWidget {
  const DoctorDataMainWidget({super.key});

  @override
  State<DoctorDataMainWidget> createState() => _DoctorDataMainWidgetState();
}

class _DoctorDataMainWidgetState extends State<DoctorDataMainWidget> {
  late DoctorDataMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoctorDataMainModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().currentDoctor.dbDocRef != null) {
        // doc name
        setState(() {
          _model.fullNameFieldTextController?.text =
              FFAppState().currentDoctor.name;
          _model.fullNameFieldTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.fullNameFieldTextController!.text.length);
        });
        // doc title
        setState(() {
          _model.docTitleFieldTextController?.text =
              FFAppState().currentDoctor.titleDesc;
          _model.docTitleFieldTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.docTitleFieldTextController!.text.length);
        });
        // doc about
        setState(() {
          _model.aboutFieldTextController?.text =
              FFAppState().currentDoctor.about;
          _model.aboutFieldTextController?.selection = TextSelection.collapsed(
              offset: _model.aboutFieldTextController!.text.length);
        });
        // doc cat cde
        setState(() {
          _model.docCategoryValueController?.value =
              FFAppState().currentDoctor.catId;
        });
        // doc sub cat codes
        _model.docSubCategory =
            FFAppState().currentDoctor.subCatId.toList().cast<int>();
        _model.docType = FFAppState().currentDoctor.gender;
        _model.docTitleCde = FFAppState().currentDoctor.titleId;
        setState(() {});
      }
    });

    _model.fullNameFieldTextController ??= TextEditingController();
    _model.fullNameFieldFocusNode ??= FocusNode();

    _model.docTitleFieldTextController ??= TextEditingController();
    _model.docTitleFieldFocusNode ??= FocusNode();

    _model.aboutFieldTextController ??= TextEditingController();
    _model.aboutFieldFocusNode ??= FocusNode();

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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '36ztx53p' /* بيانات الطبيب الاساسية */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Cairo',
                          color: FlutterFlowTheme.of(context).secondary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // check doc type and title selection
                        _model.isTypeSelected =
                            _model.docType == -1 ? false : true;
                        _model.isTitleSelected =
                            _model.docTitleCde == -1 ? false : true;
                        setState(() {});
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        if (_model.docCategoryValue == null) {
                          return;
                        }
                        // update page state
                        _model.docName =
                            _model.fullNameFieldTextController.text;
                        _model.docTitleDesc =
                            _model.docTitleFieldTextController.text;
                        _model.docAbout = _model.aboutFieldTextController.text;
                        setState(() {});
                        // update model
                        FFAppState().updateCurrentDoctorStruct(
                          (e) => e
                            ..name = _model.docName
                            ..gender = _model.docType
                            ..titleId = _model.docTitleCde
                            ..titleDesc = _model.docTitleDesc
                            ..catId = _model.docCategory
                            ..subCatId = _model.docSubCategory.toList()
                            ..about = _model.docAbout,
                        );
                        setState(() {});
                        // save model to DB

                        var docRecordReference = DocRecord.collection.doc();
                        await docRecordReference.set({
                          ...createDocRecordData(
                            name: FFAppState().currentDoctor.name,
                            gender: FFAppState().currentDoctor.gender,
                            catId: FFAppState().currentDoctor.catId,
                            titleId: FFAppState().currentDoctor.titleId,
                            title: FFAppState().currentDoctor.titleDesc,
                            about: FFAppState().currentDoctor.about,
                          ),
                          ...mapToFirestore(
                            {
                              'sub_cat_id': FFAppState().currentDoctor.subCatId,
                            },
                          ),
                        });
                        _model.docReference = DocRecord.getDocumentFromData({
                          ...createDocRecordData(
                            name: FFAppState().currentDoctor.name,
                            gender: FFAppState().currentDoctor.gender,
                            catId: FFAppState().currentDoctor.catId,
                            titleId: FFAppState().currentDoctor.titleId,
                            title: FFAppState().currentDoctor.titleDesc,
                            about: FFAppState().currentDoctor.about,
                          ),
                          ...mapToFirestore(
                            {
                              'sub_cat_id': FFAppState().currentDoctor.subCatId,
                            },
                          ),
                        }, docRecordReference);
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('حفظ بيانات الطبيب'),
                              content: const Text('تم حفظ البيانات بنجاح'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        FFAppState().updateCurrentDoctorStruct(
                          (e) => e..dbDocRef = _model.docReference?.reference,
                        );
                        setState(() {});

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        '229rzvtz' /* Save */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Cairo',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ].divide(const SizedBox(height: 4.0)),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 770.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '8dwjbrx4' /* المعلومات الشخصية */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Cairo',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        TextFormField(
                                          controller: _model
                                              .fullNameFieldTextController,
                                          focusNode:
                                              _model.fullNameFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.fullNameFieldTextController',
                                            const Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '7s6gi8uu' /* الاسم كامل */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Cairo',
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Cairo',
                                                      letterSpacing: 0.0,
                                                    ),
                                            errorStyle: GoogleFonts.getFont(
                                              'Cairo',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 16.0, 20.0),
                                            suffixIcon: _model
                                                    .fullNameFieldTextController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .fullNameFieldTextController
                                                          ?.clear();
                                                      setState(() {});
                                                    },
                                                    child: const Icon(
                                                      Icons.clear,
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Cairo',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                          maxLength: 200,
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .fullNameFieldTextControllerValidator
                                              .asValidator(context),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'izwsz2k2' /* النوع */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Cairo',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: _model.isTypeSelected
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .alternate
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: FFAppState()
                                                      .refDocType
                                                      .map((e) => e.desc)
                                                      .toList()
                                                      .map((label) =>
                                                          ChipData(label))
                                                      .toList(),
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .docTypeChoiceValue =
                                                        val?.firstOrNull);
                                                    _model.docType = functions
                                                        .getDocTypeItem(
                                                            _model
                                                                .docTypeChoiceValue,
                                                            FFAppState()
                                                                .refDocType
                                                                .toList(),
                                                            0)
                                                        ?.typeKey;
                                                    setState(() {});
                                                  },
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderWidth: 2.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  chipSpacing: 18.0,
                                                  rowSpacing: 12.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .docTypeChoiceValue !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .docTypeChoiceValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [
                                                      FFAppState()
                                                                  .currentDoctor
                                                                  .dbDocRef !=
                                                              null
                                                          ? functions
                                                              .getDocTypeItem(
                                                                  'any',
                                                                  FFAppState()
                                                                      .refDocType
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .currentDoctor
                                                                      .gender)!
                                                              .desc
                                                          : 'none'
                                                    ],
                                                  ),
                                                  wrapped: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'fxzrnu78' /* اللقب المهني */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Cairo',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: _model.isTitleSelected
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .alternate
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: FlutterFlowChoiceChips(
                                                  options: FFAppState()
                                                      .refDocTitle
                                                      .map((e) => e.desc)
                                                      .toList()
                                                      .map((label) =>
                                                          ChipData(label))
                                                      .toList(),
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .docTitleChoiceValue =
                                                        val?.firstOrNull);
                                                    _model.docTitleCde = functions
                                                        .getDocTitleItem(
                                                            _model
                                                                .docTitleChoiceValue,
                                                            FFAppState()
                                                                .refDocTitle
                                                                .toList(),
                                                            0)
                                                        ?.titleKey;
                                                    setState(() {});
                                                  },
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderWidth: 2.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  chipSpacing: 12.0,
                                                  rowSpacing: 12.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .docTitleChoiceValue !=
                                                      null,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  controller: _model
                                                          .docTitleChoiceValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [
                                                      FFAppState()
                                                                  .currentDoctor
                                                                  .dbDocRef !=
                                                              null
                                                          ? functions
                                                              .getDocTitleItem(
                                                                  'any',
                                                                  FFAppState()
                                                                      .refDocTitle
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .currentDoctor
                                                                      .titleId)!
                                                              .desc
                                                          : 'none'
                                                    ],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextFormField(
                                          controller: _model
                                              .docTitleFieldTextController,
                                          focusNode:
                                              _model.docTitleFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.docTitleFieldTextController',
                                            const Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '8rzau5l8' /* اللقب المهني كامل  */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Cairo',
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Cairo',
                                                      letterSpacing: 0.0,
                                                    ),
                                            errorStyle: GoogleFonts.getFont(
                                              'Cairo',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 16.0, 20.0),
                                            suffixIcon: _model
                                                    .docTitleFieldTextController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .docTitleFieldTextController
                                                          ?.clear();
                                                      setState(() {});
                                                    },
                                                    child: const Icon(
                                                      Icons.clear,
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Cairo',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                          maxLines: 4,
                                          minLines: 2,
                                          maxLength: 500,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .docTitleFieldTextControllerValidator
                                              .asValidator(context),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'yh1dvx8k' /* معلومات عنك */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Cairo',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        TextFormField(
                                          controller:
                                              _model.aboutFieldTextController,
                                          focusNode: _model.aboutFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.aboutFieldTextController',
                                            const Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'unkdvfww' /* معلومات عنك */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Cairo',
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Cairo',
                                                      letterSpacing: 0.0,
                                                    ),
                                            errorStyle: GoogleFonts.getFont(
                                              'Cairo',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12.0,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 16.0, 20.0),
                                            suffixIcon: _model
                                                    .aboutFieldTextController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .aboutFieldTextController
                                                          ?.clear();
                                                      setState(() {});
                                                    },
                                                    child: const Icon(
                                                      Icons.clear,
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Cairo',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                          maxLines: 8,
                                          minLines: 4,
                                          maxLength: 1000,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .aboutFieldTextControllerValidator
                                              .asValidator(context),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'colegrlm' /* التخصص الرئيسي */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Cairo',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        FlutterFlowDropDown<int>(
                                          controller: _model
                                                  .docCategoryValueController ??=
                                              FormFieldController<int>(
                                            _model.docCategoryValue ??=
                                                _model.docCategory,
                                          ),
                                          options: List<int>.from(FFAppState()
                                              .refCategory
                                              .map((e) => e.catKey)
                                              .toList()),
                                          optionLabels: FFAppState()
                                              .refCategory
                                              .map((e) => e.desc)
                                              .toList(),
                                          onChanged: (val) async {
                                            setState(() =>
                                                _model.docCategoryValue = val);
                                            _model.docCategory =
                                                _model.docCategoryValue;
                                            setState(() {});
                                          },
                                          width: double.infinity,
                                          height: 56.0,
                                          maxHeight: 300.0,
                                          searchHintTextStyle:
                                              GoogleFonts.getFont(
                                            'Cairo',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                          ),
                                          searchTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    letterSpacing: 0.0,
                                                  ),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'umljheqw' /* من فضلك اختار التخصص */,
                                          ),
                                          searchHintText:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            '9et69ohs' /* اختار التخصص الرئيسي */,
                                          ),
                                          searchCursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: Icon(
                                            Icons.category_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          elevation: 1.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 0.5,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: true,
                                          isMultiSelect: false,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '6hwqf5z6' /* التخصص الفرعي */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Cairo',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final subCatList = functions
                                                    .getFilteredSubCategory(
                                                        _model.docCategory!,
                                                        FFAppState()
                                                            .refSubCategory
                                                            .toList())
                                                    ?.toList() ??
                                                [];
                                            if (subCatList.isEmpty) {
                                              return const SizedBox(
                                                height: 200.0,
                                                child:
                                                    EmptyListComponentWidget(),
                                              );
                                            }

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: subCatList.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 2.0),
                                              itemBuilder:
                                                  (context, subCatListIndex) {
                                                final subCatListItem =
                                                    subCatList[subCatListIndex];
                                                return wrapWithModel(
                                                  model: _model
                                                      .switchTitleComponentModels
                                                      .getModel(
                                                    subCatListItem.subKey
                                                        .toString(),
                                                    subCatListIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      SwitchTitleComponentWidget(
                                                    key: Key(
                                                      'Keyxjd_${subCatListItem.subKey.toString()}',
                                                    ),
                                                    item: subCatListItem,
                                                    inputList:
                                                        _model.docSubCategory,
                                                    actionReturnedList:
                                                        (returnItem,
                                                            switchValue) async {
                                                      if (switchValue) {
                                                        _model
                                                            .addToDocSubCategory(
                                                                returnItem!);
                                                        setState(() {});
                                                      } else {
                                                        _model
                                                            .removeFromDocSubCategory(
                                                                returnItem!);
                                                        setState(() {});
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        wrapWithModel(
                                          model: _model
                                              .loadCategoriesComponentModel,
                                          updateCallback: () => setState(() {}),
                                          child:
                                              const LoadCategoriesComponentWidget(),
                                        ),
                                      ]
                                          .divide(const SizedBox(height: 12.0))
                                          .addToEnd(const SizedBox(height: 32.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 770.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            setAppLanguage(context, 'ar');
                          },
                          text: FFLocalizations.of(context).getText(
                            'r2angc5b' /* حفظ البانات */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Cairo',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.customNavbarModel,
                  updateCallback: () => setState(() {}),
                  child: const CustomNavbarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
