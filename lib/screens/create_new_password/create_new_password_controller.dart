import 'package:debwouya_market/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/api/api_key_constants.dart';
import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/user_model.dart';
import '../../utils/common_widgets.dart';
import '../../utils/navigation_methos.dart';

class CreateNewPasswordController extends ChangeNotifier {
  bool hideForNew = true;
  bool hide = true;
  bool inAsyncCall = false;

  String email = '';

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Map<String, dynamic> bodyParams = {};

  clickOnEye() {
    hide = !hide;
    notifyListeners();
  }

  clickOnEyeForNew() {
    hideForNew = !hideForNew;
    notifyListeners();
  }

  clickOnSaveButton({required BuildContext context}) async {
    if (email.trim().isNotEmpty &&
        newPasswordController.text.trim().isNotEmpty &&
        confirmPasswordController.text.trim().isNotEmpty) {
      inAsyncCall = true;
      notifyListeners();
      bodyParams = {
        ApiKeyConstants.email: email,
        ApiKeyConstants.password: newPasswordController.text,
        ApiKeyConstants.confirmPassword: confirmPasswordController.text,
      };
      UserModel? userModel = await ApiMethods.changePassword(
        context: context,
        bodyParams: bodyParams,
      );
      if (userModel != null &&
          userModel.status != null &&
          userModel.status != '0') {
        NavigationMethods.pushAndRemoveUntilMethod(
            context: context, widget: const LoginScreen());
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
