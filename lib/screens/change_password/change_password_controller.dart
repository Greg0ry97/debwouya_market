import 'package:flutter/material.dart';

import '../../utils/api/api_key_constants.dart';
import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/user_model.dart';
import '../../utils/common_widgets.dart';
import '../../utils/navigation_methos.dart';

class ChangePasswordController extends ChangeNotifier {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final count = 0;
  bool isCurrentPassword = false;
  bool isNewPassword = false;
  bool isConfirmPassword = false;
  bool inAsyncCall = false;

  FocusNode focusCurrentPassword = FocusNode();
  FocusNode focusNewPassword = FocusNode();
  FocusNode focusConfirmPassword = FocusNode();

  bool hideCurrentPassword = true;
  bool hideNewPassword = true;
  bool hideConfirmPassword = true;

  Map<String, String> bodyParams = {};
  Map<String, dynamic> params = {};

  Future<void> onInit() async {
    startListener();
  }

  void onFocusChange() {
    isCurrentPassword = focusCurrentPassword.hasFocus;
    isNewPassword = focusNewPassword.hasFocus;
    isConfirmPassword = focusConfirmPassword.hasFocus;
    notifyListeners();
  }

  void startListener() {
    focusCurrentPassword.addListener(onFocusChange);
    focusNewPassword.addListener(onFocusChange);
    focusConfirmPassword.addListener(onFocusChange);
  }

  clickSaveButton({required BuildContext context}) async {
    if (currentPasswordController.text.trim().isNotEmpty &&
        newPasswordController.text.trim().isNotEmpty &&
        confirmPasswordController.text.trim().isNotEmpty) {
      inAsyncCall = true;
      notifyListeners();
      bodyParams = {
        ApiKeyConstants.oldPassword: currentPasswordController.text,
        ApiKeyConstants.password: newPasswordController.text,
        ApiKeyConstants.cPassword: confirmPasswordController.text,
      };
      UserModel? userModel = await ApiMethods.changePassword(
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

  clickOnEyeNewPasswordButton() {
    hideNewPassword = !hideNewPassword;
    notifyListeners();
  }

  clickOnEyeConfirmPasswordButton() {
    hideConfirmPassword = !hideConfirmPassword;
    notifyListeners();
  }

  clickOnEyeCurrentPasswordButton() {
    hideCurrentPassword = !hideCurrentPassword;
    notifyListeners();
  }
}
