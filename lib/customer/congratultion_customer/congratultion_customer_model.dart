import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/code_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'congratultion_customer_widget.dart' show CongratultionCustomerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CongratultionCustomerModel
    extends FlutterFlowModel<CongratultionCustomerWidget> {
  ///  Local state fields for this page.

  String titleDesc = 'none';

  String name = 'none';

  int? sequence = 0;

  String code = 'c';

  ///  State fields for stateful widgets in this page.

  // Model for code_component component.
  late CodeComponentModel codeComponentModel;

  @override
  void initState(BuildContext context) {
    codeComponentModel = createModel(context, () => CodeComponentModel());
  }

  @override
  void dispose() {
    codeComponentModel.dispose();
  }

  /// Action blocks.
  Future createSequenceAction(BuildContext context) async {
    SequencesRefRecord? returnedSequenceData;

    if (widget!.cusDocument != null) {
      returnedSequenceData = await querySequencesRefRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      sequence = returnedSequenceData?.cusSeq;
      sequence = sequence! + 1;

      await returnedSequenceData!.reference.update(createSequencesRefRecordData(
        cusSeq: sequence,
      ));
      code = 'C${sequence?.toString()}';

      await widget!.cusDocument!.reference.update(createCusRecordData(
        code: code,
      ));
    }
  }
}
