import '/components/custom_navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/customers/components/profile_edit_main_item/profile_edit_main_item_widget.dart';
import 'customer_new_widget.dart' show CustomerNewWidget;
import 'package:flutter/material.dart';

class CustomerNewModel extends FlutterFlowModel<CustomerNewWidget> {
  ///  Local state fields for this page.

  int? nationalityCode;

  int? age;

  int? weight;

  int? height;

  int? religionCode;

  int? maritalCode;

  int? readinessCode;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for profile_edit_main_item component.
  late ProfileEditMainItemModel profileEditMainItemModel1;
  // Model for profile_edit_main_item component.
  late ProfileEditMainItemModel profileEditMainItemModel2;
  // Model for profile_edit_main_item component.
  late ProfileEditMainItemModel profileEditMainItemModel3;
  // Model for profile_edit_main_item component.
  late ProfileEditMainItemModel profileEditMainItemModel4;
  // Model for profile_edit_main_item component.
  late ProfileEditMainItemModel profileEditMainItemModel5;
  // Model for profile_edit_main_item component.
  late ProfileEditMainItemModel profileEditMainItemModel6;
  // Model for profile_edit_main_item component.
  late ProfileEditMainItemModel profileEditMainItemModel7;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    profileEditMainItemModel1 =
        createModel(context, () => ProfileEditMainItemModel());
    profileEditMainItemModel2 =
        createModel(context, () => ProfileEditMainItemModel());
    profileEditMainItemModel3 =
        createModel(context, () => ProfileEditMainItemModel());
    profileEditMainItemModel4 =
        createModel(context, () => ProfileEditMainItemModel());
    profileEditMainItemModel5 =
        createModel(context, () => ProfileEditMainItemModel());
    profileEditMainItemModel6 =
        createModel(context, () => ProfileEditMainItemModel());
    profileEditMainItemModel7 =
        createModel(context, () => ProfileEditMainItemModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    profileEditMainItemModel1.dispose();
    profileEditMainItemModel2.dispose();
    profileEditMainItemModel3.dispose();
    profileEditMainItemModel4.dispose();
    profileEditMainItemModel5.dispose();
    profileEditMainItemModel6.dispose();
    profileEditMainItemModel7.dispose();
    customNavbarModel.dispose();
  }
}
