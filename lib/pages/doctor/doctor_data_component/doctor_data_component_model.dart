import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/public_components/addrress_component/addrress_component_widget.dart';
import '/pages/public_components/image_component/image_component_widget.dart';
import '/pages/public_components/rating_component/rating_component_widget.dart';
import 'dart:math';
import 'doctor_data_component_widget.dart' show DoctorDataComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoctorDataComponentModel
    extends FlutterFlowModel<DoctorDataComponentWidget> {
  ///  Local state fields for this component.

  bool isFavorite = false;

  DocumentReference? favDocRef;

  DocRecord? docDocument;

  bool isPageLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  CusFavDocRecord? createdFavDoc;
  // Model for image_component component.
  late ImageComponentModel imageComponentModel;
  // Model for rating_Component component.
  late RatingComponentModel ratingComponentModel;
  // Model for addrress_component component.
  late AddrressComponentModel addrressComponentModel;
  // Model for loading_component component.
  late LoadingComponentModel loadingComponentModel;

  @override
  void initState(BuildContext context) {
    imageComponentModel = createModel(context, () => ImageComponentModel());
    ratingComponentModel = createModel(context, () => RatingComponentModel());
    addrressComponentModel =
        createModel(context, () => AddrressComponentModel());
    loadingComponentModel = createModel(context, () => LoadingComponentModel());
  }

  @override
  void dispose() {
    imageComponentModel.dispose();
    ratingComponentModel.dispose();
    addrressComponentModel.dispose();
    loadingComponentModel.dispose();
  }

  /// Action blocks.
  Future getFavAction(BuildContext context) async {
    CusFavDocRecord? returnedFavRef;

    returnedFavRef = await queryCusFavDocRecordOnce(
      queryBuilder: (cusFavDocRecord) => cusFavDocRecord
          .where(
            'cus_ref',
            isEqualTo: FFAppState().currentCustomer.cusDocRef,
          )
          .where(
            'doc_ref',
            isEqualTo: widget!.docDocumentInput?.reference,
          ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (returnedFavRef?.reference != null) {
      isFavorite = true;
      favDocRef = returnedFavRef?.reference;
    } else {
      isFavorite = false;
    }
  }

  Future getDocDocumentAction(BuildContext context) async {
    DocRecord? returnedDoc;

    if (widget!.docRef != null) {
      returnedDoc = await DocRecord.getDocumentOnce(widget!.docRef!);
      docDocument = returnedDoc;
    } else {
      docDocument = widget!.docDocumentInput;
    }
  }
}
