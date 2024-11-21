import 'package:flutter/material.dart';
import '../../../utils/api/api_models/faq_model.dart';

class FaqController extends ChangeNotifier {
  bool inAsyncCall = false;

  List<FaqData> data = [];

  void initMethod({required BuildContext context}) {
    privacyPolicyApi(context: context);
  }

  privacyPolicyApi({required BuildContext context}) async {
   /* FaqModel? faqModel =
    await ApiMethods.faq(context: context);
    if (faqModel != null && faqModel.data != null) {
      data = faqModel.data!;
      notifyListeners();
    } else {
      CommonWidgets.toastView(context: context, title: "Something went wrong");
    }
    inAsyncCall = false;*/
  }
}
