import '/backend/backend.dart';
import '/components/image_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/public_components/addrress_component/addrress_component_widget.dart';
import '/pages/public_components/rating_component/rating_component_widget.dart';
import 'doctor_data_component_widget.dart' show DoctorDataComponentWidget;
import 'package:flutter/material.dart';

class DoctorDataComponentModel
    extends FlutterFlowModel<DoctorDataComponentWidget> {
  ///  Local state fields for this component.

  bool isFavorite = false;

  DocumentReference? fafDocRef;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in doctor_data_component widget.
  CusFavDocRecord? returnedFavRef;
  // Model for image_component component.
  late ImageComponentModel imageComponentModel;
  // Model for rating_Component component.
  late RatingComponentModel ratingComponentModel;
  // Model for addrress_component component.
  late AddrressComponentModel addrressComponentModel;

  @override
  void initState(BuildContext context) {
    imageComponentModel = createModel(context, () => ImageComponentModel());
    ratingComponentModel = createModel(context, () => RatingComponentModel());
    addrressComponentModel =
        createModel(context, () => AddrressComponentModel());
  }

  @override
  void dispose() {
    imageComponentModel.dispose();
    ratingComponentModel.dispose();
    addrressComponentModel.dispose();
  }
}
