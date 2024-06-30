import '/components/custom_navbar_widget.dart';
import '/components/profile_essential_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/customers/components/about_me_item/about_me_item_widget.dart';
import '/pages/customers/components/descripe_me/descripe_me_widget.dart';
import '/pages/customers/components/user_actions_main/user_actions_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'customer_details_model.dart';
export 'customer_details_model.dart';

class CustomerDetailsWidget extends StatefulWidget {
  const CustomerDetailsWidget({super.key});

  @override
  State<CustomerDetailsWidget> createState() => _CustomerDetailsWidgetState();
}

class _CustomerDetailsWidgetState extends State<CustomerDetailsWidget> {
  late CustomerDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              '7f80cua4' /* Details */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Cairo',
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Stack(
                      alignment: const AlignmentDirectional(-0.0, 1.0),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://www.travelandleisure.com/thmb/hm1djoflREA9IsW5rIGwrAGCxbQ=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/TAL-wild-dunes-BEACHWEDHOTEL1223-c4aed295aa9d413bbad9cc911e8c65d5.jpg',
                            width: double.infinity,
                            height: 330.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 30.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'oa71bey1' /* Active */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Cairo',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ze135bsh' /* Yasser, 30 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Cairo',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '2vzjgpwz' /* Cairo, NC, ffff */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Cairo',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Icon(
                                          Icons.settings_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.userActionsMainModel1,
                            updateCallback: () => setState(() {}),
                            child: const UserActionsMainWidget(
                              icon: FaIcon(
                                FontAwesomeIcons.hamsa,
                              ),
                              text: 'Salam',
                              status: 0,
                            ),
                          ),
                          wrapWithModel(
                            model: _model.userActionsMainModel2,
                            updateCallback: () => setState(() {}),
                            child: const UserActionsMainWidget(
                              icon: Icon(
                                Icons.star_border,
                              ),
                              text: 'Favorites',
                              status: 1,
                            ),
                          ),
                          wrapWithModel(
                            model: _model.userActionsMainModel3,
                            updateCallback: () => setState(() {}),
                            child: const UserActionsMainWidget(
                              icon: Icon(
                                Icons.chat,
                              ),
                              text: 'Reveal',
                              status: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'm656jj1b' /* معلومات هامه */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Wrap(
                                          spacing: 5.0,
                                          runSpacing: 5.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .profileEssentialItemModel1,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const ProfileEssentialItemWidget(
                                                label: 'Muslim',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.mosque,
                                                ),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .profileEssentialItemModel2,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const ProfileEssentialItemWidget(
                                                label: '24 years old',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.birthdayCake,
                                                ),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .profileEssentialItemModel3,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const ProfileEssentialItemWidget(
                                                label: 'divorced without kids',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.discord,
                                                ),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .profileEssentialItemModel4,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const ProfileEssentialItemWidget(
                                                label: 'I am not hurry',
                                                icon: FaIcon(
                                                  FontAwesomeIcons
                                                      .calendarCheck,
                                                ),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .profileEssentialItemModel5,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const ProfileEssentialItemWidget(
                                                label: '140 cm',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.textHeight,
                                                ),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .profileEssentialItemModel6,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const ProfileEssentialItemWidget(
                                                label: '85 kg',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.weight,
                                                ),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .profileEssentialItemModel7,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const ProfileEssentialItemWidget(
                                                label: 'hggfhgfhffhhfh',
                                                icon: Icon(
                                                  Icons.color_lens,
                                                ),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .profileEssentialItemModel8,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const ProfileEssentialItemWidget(
                                                label: 'smoker',
                                                icon: Icon(
                                                  Icons.smoke_free,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 15.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '7ot7qujv' /* مواصفاتي */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Cairo',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.descripeMeModel1,
                                    updateCallback: () => setState(() {}),
                                    child: const DescripeMeWidget(
                                      icon: Icon(
                                        Icons.person,
                                      ),
                                      descHeader: 'مواصفاتي الشخصية',
                                      desDetails:
                                          'بيسبتاتيبلااسيلابسلا تب بتسلا بتلايتبلا يتبلاسيتب لايبلا يتلابيلاسيابلاي اسلايسبيابلا يابلاس يلاسيتبلا يستب تيلاس يتبلاياب لايا يبايسلاببريسات',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.descripeMeModel2,
                                      updateCallback: () => setState(() {}),
                                      child: const DescripeMeWidget(
                                        icon: Icon(
                                          Icons.person,
                                        ),
                                        descHeader: 'مواصفاتي شريك الحياة',
                                        desDetails:
                                            'بيسبتاتيبلااسيلابسلا تب بتسلا بتلايتبلا يتبلاسيتب ؤنيسبينبىينبىيسنبىينىبني بنىي نبىيسنبىسينبى بىنيت ىبيتبىس يتبىيستبىسيستب تيلاس يتبلاياب لايا يبايسلاببريسات',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'mzaaoth5' /* معلومات اخري عني */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Cairo',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  wrapWithModel(
                                    model: _model.aboutMeItemModel1,
                                    updateCallback: () => setState(() {}),
                                    child: const AboutMeItemWidget(
                                      image:
                                          'https://w7.pngwing.com/pngs/292/680/png-transparent-add-person-add-person-icon.png',
                                      question: 'what is education level',
                                      answer: 'Bachleros',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.aboutMeItemModel2,
                                    updateCallback: () => setState(() {}),
                                    child: const AboutMeItemWidget(
                                      image:
                                          'https://cdn-icons-png.flaticon.com/512/1375/1375106.png',
                                      question: 'what is ur job title',
                                      answer: 'Engineer',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.aboutMeItemModel3,
                                    updateCallback: () => setState(() {}),
                                    child: const AboutMeItemWidget(
                                      image:
                                          'https://w7.pngwing.com/pngs/421/683/png-transparent-computer-icons-mobile-phones-telephone-email-home-business-phones-phone-icon-miscellaneous-angle-service-thumbnail.png',
                                      question: 'احكيلي عنك',
                                      answer: 'fdfdgdfgfgfg',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.aboutMeItemModel4,
                                    updateCallback: () => setState(() {}),
                                    child: const AboutMeItemWidget(
                                      image:
                                          'https://cdn.pixabay.com/photo/2017/02/19/22/14/sun-2081062_640.png',
                                      question: 'قولي عن ناس بتحبهم في حياتك',
                                      answer: 'ناس كتيير قوي',
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(height: 5.0))
                                    .addToStart(const SizedBox(height: 5.0))
                                    .addToEnd(const SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
