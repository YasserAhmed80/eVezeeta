import '/admin_app/admin_side_nav_component/admin_side_nav_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_images_review_widget.dart' show AdminImagesReviewWidget;
import 'package:flutter/material.dart';

class AdminImagesReviewModel extends FlutterFlowModel<AdminImagesReviewWidget> {
  ///  Local state fields for this page.

  String? reasonDesc;

  ///  State fields for stateful widgets in this page.

  // Model for admin_sideNav_component component.
  late AdminSideNavComponentModel adminSideNavComponentModel;

  @override
  void initState(BuildContext context) {
    adminSideNavComponentModel =
        createModel(context, () => AdminSideNavComponentModel());
  }

  @override
  void dispose() {
    adminSideNavComponentModel.dispose();
  }
}
