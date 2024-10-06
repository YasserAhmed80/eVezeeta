import '/flutter_flow/flutter_flow_util.dart';
import '/public_components/loading_component/loading_component_widget.dart';
import 'notification_item_component_widget.dart'
    show NotificationItemComponentWidget;
import 'package:flutter/material.dart';

class NotificationItemComponentModel
    extends FlutterFlowModel<NotificationItemComponentWidget> {
  ///  Local state fields for this component.

  bool isLoadingData = true;

  bool seenIND = false;

  ///  State fields for stateful widgets in this component.

  // Model for loading_component component.
  late LoadingComponentModel loadingComponentModel;

  @override
  void initState(BuildContext context) {
    loadingComponentModel = createModel(context, () => LoadingComponentModel());
  }

  @override
  void dispose() {
    loadingComponentModel.dispose();
  }
}
