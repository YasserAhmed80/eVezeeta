import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/code_component/code_component_widget.dart';
import 'congratultion_doctor_widget.dart' show CongratultionDoctorWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CongratultionDoctorModel
    extends FlutterFlowModel<CongratultionDoctorWidget> {
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

    if (widget!.docDocument != null) {
      returnedSequenceData = await querySequencesRefRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      sequence = returnedSequenceData?.docSeq;
      sequence = sequence! + 1;

      await returnedSequenceData!.reference.update(createSequencesRefRecordData(
        docSeq: sequence,
      ));
      code = 'D${sequence?.toString()}';

      await widget!.docDocument!.reference.update(createDocRecordData(
        code: code,
      ));
    }
  }
}
