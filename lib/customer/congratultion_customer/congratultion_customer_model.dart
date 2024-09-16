import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/code_component/code_component_widget.dart';
import 'congratultion_customer_widget.dart' show CongratultionCustomerWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

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
