import 'package:flutter/material.dart';


class TermsAndConditionController extends ChangeNotifier {
  bool inAsyncCall = false;

 // GetTermsAndConditionsData? data;

  void initMethod({required BuildContext context}) {
    //termsAndConditionApi(context: context);
  }

  /*termsAndConditionApi({required BuildContext context}) async {
    GetTermsAndConditionsModel? getTermsAndConditionsModel =
        await ApiMethods.getTermsAndConditions();
    if (getTermsAndConditionsModel != null &&
        getTermsAndConditionsModel.data != null &&
        getTermsAndConditionsModel.data!.isNotEmpty) {
      data = getTermsAndConditionsModel.data!.first;
      notifyListeners();
    } else {
      CommonWidgets.showMyToastMessage("Something went wrong");
    }
    inAsyncCall = false;
  }*/
}
