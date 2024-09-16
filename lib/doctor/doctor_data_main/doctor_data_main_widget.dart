import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/public_components/empty_list_component/empty_list_component_widget.dart';
import '/public_components/switch_title_component/switch_title_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doctor_data_main_model.dart';
export 'doctor_data_main_model.dart';

class DoctorDataMainWidget extends StatefulWidget {
  const DoctorDataMainWidget({
    super.key,
    required this.docDocument,
  });

  final DocRecord? docDocument;

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
      if (widget.docDocument != null) {
        // doc name
        safeSetState(() {
          _model.txtFullNameFieldTextController?.text = valueOrDefault<String>(
            widget.docDocument?.name,
            'nn',
          );
          _model.txtFullNameFieldTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.txtFullNameFieldTextController!.text.length);
        });
        // doc title
        safeSetState(() {
          _model.txtDocTitleFieldTextController?.text = valueOrDefault<String>(
            widget.docDocument?.title,
            'nn',
          );
          _model.txtDocTitleFieldTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.txtDocTitleFieldTextController!.text.length);
        });
        // doc about
        safeSetState(() {
          _model.txtAboutFieldTextController?.text = valueOrDefault<String>(
            widget.docDocument?.about,
            'nn',
          );
          _model.txtAboutFieldTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.txtAboutFieldTextController!.text.length);
        });
        // doc cat cde
        safeSetState(() {
          _model.docCategoryValueController?.value = valueOrDefault<int>(
            widget.docDocument?.catId,
            -1,
          );
        });
        // doc sub cat codes
        _model.docSubCategory =
            widget.docDocument!.subCatId.toList().cast<int>();
        _model.docType = valueOrDefault<int>(
          widget.docDocument?.gender,
          -1,
        );
        _model.docTitleCde = valueOrDefault<int>(
          widget.docDocument?.titleId,
          -1,
        );
        _model.docCategory = valueOrDefault<int>(
          widget.docDocument?.catId,
          -1,
        );
        _model.curDoctor = widget.docDocument;
        safeSetState(() {});
      } else {
        _model.isNewDoctor = true;
        safeSetState(() {});
      }
    });

    _model.txtFullNameFieldTextController ??= TextEditingController();
    _model.txtFullNameFieldFocusNode ??= FocusNode();

    _model.txtDocTitleFieldTextController ??= TextEditingController();
    _model.txtDocTitleFieldFocusNode ??= FocusNode();

    _model.txtAboutFieldTextController ??= TextEditingController();
    _model.txtAboutFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      child: WillPopScope(
        onWillPop: () async => false,
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
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '36ztx53p' /* بيانات الطبيب الاساسية */,
                        ),
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Cairo',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    if (_model.isNewDoctor == false)
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'doctor_account',
                            queryParameters: {
                              'docRef': serializeParam(
                                widget.docDocument?.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
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
                                                .txtFullNameFieldTextController,
                                            focusNode: _model
                                                .txtFullNameFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.txtFullNameFieldTextController',
                                              const Duration(milliseconds: 2000),
                                              () => safeSetState(() {}),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 20.0),
                                              suffixIcon: _model
                                                      .txtFullNameFieldTextController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .txtFullNameFieldTextController
                                                            ?.clear();
                                                        safeSetState(() {});
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
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
                                                .txtFullNameFieldTextControllerValidator
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
                                              height: 60.0,
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
                                                      safeSetState(() => _model
                                                              .docTypeChoiceValue =
                                                          val?.firstOrNull);
                                                      _model.docType = functions
                                                          .getDocTypeItem(
                                                              _model
                                                                  .docTypeChoiceValue,
                                                              FFAppState()
                                                                  .refDocType
                                                                  .toList(),
                                                              -1)
                                                          ?.typeKey;
                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
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
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
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
                                                        widget.docDocument !=
                                                                null
                                                            ? valueOrDefault<
                                                                String>(
                                                                functions
                                                                    .getDocTypeItem(
                                                                        'any',
                                                                        FFAppState()
                                                                            .refDocType
                                                                            .toList(),
                                                                        _model
                                                                            .docType!)
                                                                    ?.desc,
                                                                'none',
                                                              )
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
                                              height: 60.0,
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
                                                      safeSetState(() => _model
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
                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
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
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
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
                                                        widget.docDocument !=
                                                                null
                                                            ? functions
                                                                .getDocTitleItem(
                                                                    'none',
                                                                    FFAppState()
                                                                        .refDocTitle
                                                                        .toList(),
                                                                    _model
                                                                        .docTitleCde!)!
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
                                                .txtDocTitleFieldTextController,
                                            focusNode: _model
                                                .txtDocTitleFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.txtDocTitleFieldTextController',
                                              const Duration(milliseconds: 2000),
                                              () => safeSetState(() {}),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 20.0),
                                              suffixIcon: _model
                                                      .txtDocTitleFieldTextController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .txtDocTitleFieldTextController
                                                            ?.clear();
                                                        safeSetState(() {});
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
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
                                                .txtDocTitleFieldTextControllerValidator
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
                                            controller: _model
                                                .txtAboutFieldTextController,
                                            focusNode:
                                                _model.txtAboutFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.txtAboutFieldTextController',
                                              const Duration(milliseconds: 2000),
                                              () => safeSetState(() {}),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 20.0),
                                              suffixIcon: _model
                                                      .txtAboutFieldTextController!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model
                                                            .txtAboutFieldTextController
                                                            ?.clear();
                                                        safeSetState(() {});
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
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
                                                .txtAboutFieldTextControllerValidator
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
                                              safeSetState(() => _model
                                                  .docCategoryValue = val);
                                              _model.docCategory =
                                                  _model.docCategoryValue;
                                              safeSetState(() {});
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                      subCatList[
                                                          subCatListIndex];
                                                  return wrapWithModel(
                                                    model: _model
                                                        .switchTitleComponentModels
                                                        .getModel(
                                                      subCatListItem.subKey
                                                          .toString(),
                                                      subCatListIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
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
                                                          safeSetState(() {});
                                                        } else {
                                                          _model
                                                              .removeFromDocSubCategory(
                                                                  returnItem!);
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 12.0, 16.0, 12.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                // check doc type and title selection
                                                _model.isTypeSelected =
                                                    _model.docType == -1
                                                        ? false
                                                        : true;
                                                _model.isTitleSelected =
                                                    _model.docTitleCde == -1
                                                        ? false
                                                        : true;
                                                safeSetState(() {});
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                if (_model.docCategoryValue ==
                                                    null) {
                                                  return;
                                                }
                                                // update page state
                                                _model.docName = _model
                                                    .txtFullNameFieldTextController
                                                    .text;
                                                _model.docTitleDesc = _model
                                                    .txtDocTitleFieldTextController
                                                    .text;
                                                _model.docAbout = _model
                                                    .txtAboutFieldTextController
                                                    .text;
                                                safeSetState(() {});
                                                if (widget.docDocument !=
                                                    null) {
                                                  // save model to DB

                                                  await widget
                                                      .docDocument!.reference
                                                      .update({
                                                    ...createDocRecordData(
                                                      name: _model
                                                          .txtFullNameFieldTextController
                                                          .text,
                                                      gender: _model.docType,
                                                      catId: _model.docCategory,
                                                      titleId:
                                                          _model.docTitleCde,
                                                      title:
                                                          _model.docTitleDesc,
                                                      about: _model.docAbout,
                                                      uAt: functions
                                                          .getCurrentDate(),
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'sub_cat_id': _model
                                                            .docSubCategory,
                                                      },
                                                    ),
                                                  });
                                                  FFAppState()
                                                      .updateCurrentDoctorStruct(
                                                    (e) => e
                                                      ..dbDocRef = widget
                                                          .docDocument
                                                          ?.reference,
                                                  );
                                                  safeSetState(() {});
                                                } else {
                                                  // save model to DB

                                                  var docRecordReference =
                                                      DocRecord.collection
                                                          .doc();
                                                  await docRecordReference.set({
                                                    ...createDocRecordData(
                                                      name: _model
                                                          .txtFullNameFieldTextController
                                                          .text,
                                                      gender: _model.docType,
                                                      catId: _model.docCategory,
                                                      titleId:
                                                          _model.docTitleCde,
                                                      title: _model
                                                          .txtDocTitleFieldTextController
                                                          .text,
                                                      about: _model
                                                          .txtAboutFieldTextController
                                                          .text,
                                                      cAt: functions
                                                          .getCurrentDate(),
                                                      aCon: 1,
                                                      aGov: -1,
                                                      aZone: -1,
                                                      aArea: -1,
                                                      aAddr: ' ',
                                                      reviewStatus: 1,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'sub_cat_id': _model
                                                            .docSubCategory,
                                                      },
                                                    ),
                                                  });
                                                  _model.createdDoc = DocRecord
                                                      .getDocumentFromData({
                                                    ...createDocRecordData(
                                                      name: _model
                                                          .txtFullNameFieldTextController
                                                          .text,
                                                      gender: _model.docType,
                                                      catId: _model.docCategory,
                                                      titleId:
                                                          _model.docTitleCde,
                                                      title: _model
                                                          .txtDocTitleFieldTextController
                                                          .text,
                                                      about: _model
                                                          .txtAboutFieldTextController
                                                          .text,
                                                      cAt: functions
                                                          .getCurrentDate(),
                                                      aCon: 1,
                                                      aGov: -1,
                                                      aZone: -1,
                                                      aArea: -1,
                                                      aAddr: ' ',
                                                      reviewStatus: 1,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'sub_cat_id': _model
                                                            .docSubCategory,
                                                      },
                                                    ),
                                                  }, docRecordReference);
                                                  FFAppState()
                                                      .updateCurrentDoctorStruct(
                                                    (e) => e
                                                      ..dbDocRef = _model
                                                          .createdDoc
                                                          ?.reference,
                                                  );
                                                  safeSetState(() {});
                                                  _model.curDoctor =
                                                      _model.createdDoc;
                                                  safeSetState(() {});
                                                }

                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'حفظ بيانات الطبيب'),
                                                      content: const Text(
                                                          'تم حفظ البيانات بنجاح'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                if (_model.isNewDoctor ==
                                                    true) {
                                                  context.pushNamed(
                                                    'congratultion_doctor',
                                                    queryParameters: {
                                                      'docDocument':
                                                          serializeParam(
                                                        _model.curDoctor,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'docDocument':
                                                          _model.curDoctor,
                                                    },
                                                  );

                                                  _model.isNewDoctor = false;
                                                  safeSetState(() {});
                                                }

                                                safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'oqigkybd' /* حفظ البانات */,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 48.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
