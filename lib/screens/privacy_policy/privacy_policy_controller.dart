import 'package:flutter/material.dart';

import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/get_about_us_model.dart';
import '../../utils/common_widgets.dart';

class PrivacyPolicyController extends ChangeNotifier {
  bool inAsyncCall = true;

  Data? data;

  void initMethod({required BuildContext context}) {
    privacyPolicyApi(context: context);
  }

  privacyPolicyApi({required BuildContext context}) async {
    GetAboutUsModel? getPrivacyPolicyModel =
        await ApiMethods.getPrivacyPolicy(context: context);
    if (getPrivacyPolicyModel != null && getPrivacyPolicyModel.data != null) {
      data = getPrivacyPolicyModel.data!;
      notifyListeners();
    } else {
      CommonWidgets.toastView(title: "Something went wrong", context: context);
    }
    inAsyncCall = false;
    notifyListeners();
  }
}
