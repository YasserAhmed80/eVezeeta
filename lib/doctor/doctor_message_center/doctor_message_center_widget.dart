import '/backend/backend.dart';
import '/components/news_item_component_widget.dart';
import '/components/notification_item_component_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/empty_list_component/empty_list_component_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'doctor_message_center_model.dart';
export 'doctor_message_center_model.dart';

class DoctorMessageCenterWidget extends StatefulWidget {
  const DoctorMessageCenterWidget({
    super.key,
    required this.docRef,
  });

  final DocumentReference? docRef;

  @override
  State<DoctorMessageCenterWidget> createState() =>
      _DoctorMessageCenterWidgetState();
}

class _DoctorMessageCenterWidgetState extends State<DoctorMessageCenterWidget>
    with TickerProviderStateMixin {
  late DoctorMessageCenterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoctorMessageCenterModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DocNotifyRecord>>(
      stream: queryDocNotifyRecord(
        queryBuilder: (docNotifyRecord) => docNotifyRecord.where(
          'doc_ref',
          isEqualTo: widget.docRef,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<DocNotifyRecord> doctorMessageCenterDocNotifyRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final doctorMessageCenterDocNotifyRecord =
            doctorMessageCenterDocNotifyRecordList.isNotEmpty
                ? doctorMessageCenterDocNotifyRecordList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ycyeea31' /* مركز التواصل */,
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
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 2.0),
                                  child: Container(
                                    height: 45.0,
                                    constraints: const BoxConstraints(
                                      minWidth: 60.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'x6phr7rw' /* اشعارات */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: badges.Badge(
                                    badgeContent: Text(
                                      valueOrDefault<String>(
                                        doctorMessageCenterDocNotifyRecord
                                            ?.notifyCnt
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    showBadge:
                                        doctorMessageCenterDocNotifyRecord
                                                ?.notifyCnt !=
                                            0,
                                    shape: badges.BadgeShape.circle,
                                    badgeColor:
                                        FlutterFlowTheme.of(context).error,
                                    elevation: 4.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    position: badges.BadgePosition.topStart(),
                                    animationType:
                                        badges.BadgeAnimationType.scale,
                                    toAnimate: true,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 2.0),
                                  child: Container(
                                    height: 45.0,
                                    constraints: const BoxConstraints(
                                      minWidth: 60.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'rspwlmw5' /* رسايل */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: badges.Badge(
                                    badgeContent: Text(
                                      valueOrDefault<String>(
                                        doctorMessageCenterDocNotifyRecord
                                            ?.msgCnt
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    showBadge:
                                        doctorMessageCenterDocNotifyRecord
                                                ?.msgCnt !=
                                            0,
                                    shape: badges.BadgeShape.circle,
                                    badgeColor:
                                        FlutterFlowTheme.of(context).error,
                                    elevation: 4.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    position: badges.BadgePosition.topStart(),
                                    animationType:
                                        badges.BadgeAnimationType.scale,
                                    toAnimate: true,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 2.0),
                                  child: Container(
                                    height: 45.0,
                                    constraints: const BoxConstraints(
                                      minWidth: 60.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'x3in5325' /* اخبار */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: FutureBuilder<int>(
                                    future: queryNotificationRecordCount(
                                      queryBuilder: (notificationRecord) =>
                                          notificationRecord
                                              .where(
                                                'e_type',
                                                isEqualTo: 'doc',
                                              )
                                              .where(
                                                'not_cde',
                                                isEqualTo: 100,
                                              )
                                              .where(
                                                'c_at',
                                                isGreaterThanOrEqualTo:
                                                    doctorMessageCenterDocNotifyRecord
                                                        ?.lSeenNews,
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      int badgeCount = snapshot.data!;

                                      return badges.Badge(
                                        badgeContent: Text(
                                          valueOrDefault<String>(
                                            badgeCount.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Cairo',
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        showBadge:
                                            doctorMessageCenterDocNotifyRecord
                                                    ?.newsCnt !=
                                                0,
                                        shape: badges.BadgeShape.circle,
                                        badgeColor:
                                            FlutterFlowTheme.of(context).error,
                                        elevation: 4.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        position:
                                            badges.BadgePosition.topStart(),
                                        animationType:
                                            badges.BadgeAnimationType.scale,
                                        toAnimate: true,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ]
                              .divide(const SizedBox(width: 10.0))
                              .around(const SizedBox(width: 10.0)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 770.0,
                          ),
                          decoration: const BoxDecoration(),
                          child: Column(
                            children: [
                              Align(
                                alignment: const Alignment(0.0, 0),
                                child: FlutterFlowButtonTabBar(
                                  useToggleButtonStyle: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  unselectedLabelStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Cairo',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  unselectedBackgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  unselectedBorderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  elevation: 0.0,
                                  buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  tabs: [
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'ozkgunb6' /* اشعارات */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'iae36bqx' /* رسايل */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'x380ccd4' /* اخبار */,
                                      ),
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [
                                      () async {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: const Text('notifi'),
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
                                      },
                                      () async {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: const Text('messages'),
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
                                      },
                                      () async {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: const Text('news'),
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
                                      }
                                    ][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 0.0),
                                            child: StreamBuilder<
                                                List<NotificationRecord>>(
                                              stream: queryNotificationRecord(
                                                queryBuilder:
                                                    (notificationRecord) =>
                                                        notificationRecord
                                                            .where(
                                                              'e_type',
                                                              isEqualTo: 'doc',
                                                            )
                                                            .where(
                                                              'e_id',
                                                              isEqualTo: widget
                                                                  .docRef?.id,
                                                            )
                                                            .orderBy('c_at',
                                                                descending:
                                                                    true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<NotificationRecord>
                                                    listViewNotificationRecordList =
                                                    snapshot.data!;
                                                if (listViewNotificationRecordList
                                                    .isEmpty) {
                                                  return const SizedBox(
                                                    height: 60.0,
                                                    child:
                                                        EmptyListComponentWidget(
                                                      desc: 'لايوجد اشعارات',
                                                    ),
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewNotificationRecordList
                                                          .length,
                                                  separatorBuilder: (_, __) =>
                                                      const SizedBox(height: 5.0),
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewNotificationRecord =
                                                        listViewNotificationRecordList[
                                                            listViewIndex];
                                                    return NotificationItemComponentWidget(
                                                      key: Key(
                                                          'Keyfqa_${listViewIndex}_of_${listViewNotificationRecordList.length}'),
                                                      notificationDoc:
                                                          listViewNotificationRecord,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 5.0)),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 0.0),
                                            child: StreamBuilder<
                                                List<NotificationRecord>>(
                                              stream: queryNotificationRecord(
                                                queryBuilder:
                                                    (notificationRecord) =>
                                                        notificationRecord
                                                            .where(
                                                              'e_type',
                                                              isEqualTo: 'doc',
                                                            )
                                                            .where(
                                                              'not_cde',
                                                              isEqualTo: 100,
                                                            )
                                                            .where(
                                                              'c_at',
                                                              isGreaterThanOrEqualTo:
                                                                  doctorMessageCenterDocNotifyRecord
                                                                      ?.lSeenNews,
                                                            )
                                                            .orderBy('c_at',
                                                                descending:
                                                                    true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<NotificationRecord>
                                                    listViewNotificationRecordList =
                                                    snapshot.data!;
                                                if (listViewNotificationRecordList
                                                    .isEmpty) {
                                                  return const SizedBox(
                                                    height: 60.0,
                                                    child:
                                                        EmptyListComponentWidget(
                                                      desc: 'لايوجد رسايل',
                                                    ),
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewNotificationRecordList
                                                          .length,
                                                  separatorBuilder: (_, __) =>
                                                      const SizedBox(height: 5.0),
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewNotificationRecord =
                                                        listViewNotificationRecordList[
                                                            listViewIndex];
                                                    return NotificationItemComponentWidget(
                                                      key: Key(
                                                          'Keylt8_${listViewIndex}_of_${listViewNotificationRecordList.length}'),
                                                      notificationDoc:
                                                          listViewNotificationRecord,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 5.0)),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 0.0),
                                            child: StreamBuilder<
                                                List<NotificationRecord>>(
                                              stream: queryNotificationRecord(
                                                queryBuilder:
                                                    (notificationRecord) =>
                                                        notificationRecord
                                                            .where(
                                                              'e_type',
                                                              isEqualTo: 'doc',
                                                            )
                                                            .where(
                                                              'not_cde',
                                                              isEqualTo: 100,
                                                            )
                                                            .where(
                                                              'c_at',
                                                              isGreaterThanOrEqualTo:
                                                                  doctorMessageCenterDocNotifyRecord
                                                                      ?.lSeenNews,
                                                            )
                                                            .orderBy('c_at',
                                                                descending:
                                                                    true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<NotificationRecord>
                                                    listViewNotificationRecordList =
                                                    snapshot.data!;
                                                if (listViewNotificationRecordList
                                                    .isEmpty) {
                                                  return const SizedBox(
                                                    height: 60.0,
                                                    child:
                                                        EmptyListComponentWidget(
                                                      desc: 'لايوجد اخبار',
                                                    ),
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewNotificationRecordList
                                                          .length,
                                                  separatorBuilder: (_, __) =>
                                                      const SizedBox(height: 5.0),
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewNotificationRecord =
                                                        listViewNotificationRecordList[
                                                            listViewIndex];
                                                    return NewsItemComponentWidget(
                                                      key: Key(
                                                          'Key1a1_${listViewIndex}_of_${listViewNotificationRecordList.length}'),
                                                      notificationDoc:
                                                          listViewNotificationRecord,
                                                      lastSeenDate:
                                                          doctorMessageCenterDocNotifyRecord!
                                                              .lSeenNews!,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
