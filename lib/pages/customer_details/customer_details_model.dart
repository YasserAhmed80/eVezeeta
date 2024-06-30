import '/components/custom_navbar_widget.dart';
import '/components/profile_essential_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/customers/components/about_me_item/about_me_item_widget.dart';
import '/pages/customers/components/descripe_me/descripe_me_widget.dart';
import '/pages/customers/components/user_actions_main/user_actions_main_widget.dart';
import 'customer_details_widget.dart' show CustomerDetailsWidget;
import 'package:flutter/material.dart';

class CustomerDetailsModel extends FlutterFlowModel<CustomerDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for user_actions_main component.
  late UserActionsMainModel userActionsMainModel1;
  // Model for user_actions_main component.
  late UserActionsMainModel userActionsMainModel2;
  // Model for user_actions_main component.
  late UserActionsMainModel userActionsMainModel3;
  // Model for profile_essential_item component.
  late ProfileEssentialItemModel profileEssentialItemModel1;
  // Model for profile_essential_item component.
  late ProfileEssentialItemModel profileEssentialItemModel2;
  // Model for profile_essential_item component.
  late ProfileEssentialItemModel profileEssentialItemModel3;
  // Model for profile_essential_item component.
  late ProfileEssentialItemModel profileEssentialItemModel4;
  // Model for profile_essential_item component.
  late ProfileEssentialItemModel profileEssentialItemModel5;
  // Model for profile_essential_item component.
  late ProfileEssentialItemModel profileEssentialItemModel6;
  // Model for profile_essential_item component.
  late ProfileEssentialItemModel profileEssentialItemModel7;
  // Model for profile_essential_item component.
  late ProfileEssentialItemModel profileEssentialItemModel8;
  // Model for descripe_me component.
  late DescripeMeModel descripeMeModel1;
  // Model for descripe_me component.
  late DescripeMeModel descripeMeModel2;
  // Model for about_me_item component.
  late AboutMeItemModel aboutMeItemModel1;
  // Model for about_me_item component.
  late AboutMeItemModel aboutMeItemModel2;
  // Model for about_me_item component.
  late AboutMeItemModel aboutMeItemModel3;
  // Model for about_me_item component.
  late AboutMeItemModel aboutMeItemModel4;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    userActionsMainModel1 = createModel(context, () => UserActionsMainModel());
    userActionsMainModel2 = createModel(context, () => UserActionsMainModel());
    userActionsMainModel3 = createModel(context, () => UserActionsMainModel());
    profileEssentialItemModel1 =
        createModel(context, () => ProfileEssentialItemModel());
    profileEssentialItemModel2 =
        createModel(context, () => ProfileEssentialItemModel());
    profileEssentialItemModel3 =
        createModel(context, () => ProfileEssentialItemModel());
    profileEssentialItemModel4 =
        createModel(context, () => ProfileEssentialItemModel());
    profileEssentialItemModel5 =
        createModel(context, () => ProfileEssentialItemModel());
    profileEssentialItemModel6 =
        createModel(context, () => ProfileEssentialItemModel());
    profileEssentialItemModel7 =
        createModel(context, () => ProfileEssentialItemModel());
    profileEssentialItemModel8 =
        createModel(context, () => ProfileEssentialItemModel());
    descripeMeModel1 = createModel(context, () => DescripeMeModel());
    descripeMeModel2 = createModel(context, () => DescripeMeModel());
    aboutMeItemModel1 = createModel(context, () => AboutMeItemModel());
    aboutMeItemModel2 = createModel(context, () => AboutMeItemModel());
    aboutMeItemModel3 = createModel(context, () => AboutMeItemModel());
    aboutMeItemModel4 = createModel(context, () => AboutMeItemModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userActionsMainModel1.dispose();
    userActionsMainModel2.dispose();
    userActionsMainModel3.dispose();
    profileEssentialItemModel1.dispose();
    profileEssentialItemModel2.dispose();
    profileEssentialItemModel3.dispose();
    profileEssentialItemModel4.dispose();
    profileEssentialItemModel5.dispose();
    profileEssentialItemModel6.dispose();
    profileEssentialItemModel7.dispose();
    profileEssentialItemModel8.dispose();
    descripeMeModel1.dispose();
    descripeMeModel2.dispose();
    aboutMeItemModel1.dispose();
    aboutMeItemModel2.dispose();
    aboutMeItemModel3.dispose();
    aboutMeItemModel4.dispose();
    customNavbarModel.dispose();
  }
}
