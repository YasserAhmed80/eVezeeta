import '/components/custom_navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/customers/components/profile_edit_main_item/profile_edit_main_item_widget.dart';
import 'customer_new_initial_widget.dart' show CustomerNewInitialWidget;
import 'package:flutter/material.dart';

class CustomerNewInitialModel
    extends FlutterFlowModel<CustomerNewInitialWidget> {
  ///  Local state fields for this page.

  int? selectedCountry = 1;

  int? selectedCovern = -1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // Model for profile_edit_main_item component.
  late ProfileEditMainItemModel profileEditMainItemModel;
  // Model for custom_navbar component.
  late CustomNavbarModel customNavbarModel;

  @override
  void initState(BuildContext context) {
    profileEditMainItemModel =
        createModel(context, () => ProfileEditMainItemModel());
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    profileEditMainItemModel.dispose();
    customNavbarModel.dispose();
  }
}
