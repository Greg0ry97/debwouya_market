import 'package:flutter/material.dart';
import '../../utils/api/api_key_constants.dart';
import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/user_model.dart';
import '../../utils/common_widgets.dart';
import '../../utils/navigation_methos.dart';

class SupportController extends ChangeNotifier {
  bool inAsyncCall = false;

  TextEditingController typeHereTextField = TextEditingController();

  Map<String, String?> bodyParams = {};


  clickOnSubmitButton({required BuildContext context}) async {
    if (typeHereTextField.text
        .trim()
        .isNotEmpty) {
      inAsyncCall = true;
      notifyListeners();
      bodyParams = {
        ApiKeyConstants.description: typeHereTextField.text,
      };
      UserModel? userModel = await ApiMethods.supportTickets(
        context: context,
        bodyParams: bodyParams,
      );
      if (userModel != null &&
          userModel.status != null &&
          userModel.status != '0') {
        NavigationMethods.popMethod(context: context);
        if (userModel.message != null && userModel.message!.isNotEmpty) {
          CommonWidgets.toastView(
              context: context, title: userModel.message ?? '');
        }
      } else {
        if (userModel != null &&
            userModel.message != null &&
            userModel.message!.isNotEmpty) {
          CommonWidgets.toastView(
              context: context, title: userModel.message ?? '');
        }
      }
      inAsyncCall = false;
      notifyListeners();
    } else {
      CommonWidgets.toastView(context: context, title: 'All field required');
    }
  }
}
