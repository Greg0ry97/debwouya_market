import 'package:debwouya_market/utils/api/api_key_constants.dart';
import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/user_model.dart';
import '../../utils/navigation_methos.dart';

class SignUpController extends ChangeNotifier {
  bool hide = true;
  bool hideForConfirm = true;
  bool check = false;
  bool inAsyncCall = false;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController siretNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Map<String, dynamic> bodyParams = {};

  clickOnLoginButton({required BuildContext context}) {
    NavigationMethods.popMethod(context: context);
  }

  clickOnSignUpButton({required BuildContext context}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? type = sp.getString(ApiKeyConstants.type);
    if (fullNameController.text.trim().isNotEmpty &&
        emailAddressController.text.trim().isNotEmpty &&
        siretNumberController.text.trim().isNotEmpty &&
        mobileNumberController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty &&
        confirmPasswordController.text.trim().isNotEmpty) {
      if (passwordController.text.trim().isNotEmpty ==
          confirmPasswordController.text.trim().isNotEmpty) {
        if (check) {
          inAsyncCall = true;
          notifyListeners();
          bodyParams = {
            ApiKeyConstants.email: emailAddressController.text,
            ApiKeyConstants.password: passwordController.text,
            ApiKeyConstants.confirmPassword: confirmPasswordController.text,
            ApiKeyConstants.userName: fullNameController.text,
            ApiKeyConstants.mobile: mobileNumberController.text,
            ApiKeyConstants.siretNumber: siretNumberController.text,
            ApiKeyConstants.type: type ?? '',
            ApiKeyConstants.countryCode: '+91',
          };
          UserModel? userModel = await ApiMethods.register(
            context: context,
            bodyParams: bodyParams,
          );
          if (userModel != null) {
            NavigationMethods.popMethod(context: context);
          }
          print('userModel::::::::::${userModel}');
        } else {
          CommonWidgets.toastView(
              context: context, title: 'Select T&C and Privacy Policy');
        }
      } else {
        CommonWidgets.toastView(
            context: context, title: 'Password and Confirm not match');
      }
    } else {
      CommonWidgets.toastView(context: context, title: 'All field required!');
    }
    inAsyncCall = false;
    notifyListeners();
  }

  clickOnForgotPassword({required BuildContext context}) {}

  clickOnEye() {
    hide = !hide;
    notifyListeners();
  }

  clickOnEyeForConfirm() {
    hideForConfirm = !hideForConfirm;
    notifyListeners();
  }

  clickOnCheckBox() {
    check = !check;
    notifyListeners();
  }
}
