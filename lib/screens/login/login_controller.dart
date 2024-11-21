import 'package:debwouya_market/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:debwouya_market/screens/password_reset/password_reset_screen.dart';
import 'package:debwouya_market/screens/sign_up/sign_up_screen.dart';
import 'package:debwouya_market/utils/navigation_methos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api/api_key_constants.dart';
import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/user_model.dart';
import '../../utils/common_widgets.dart';
import '../add_your_business_type/add_your_business_type_screen.dart';
import '../user_side_screens/user_bottom_nav_bar/user_bottom_nav_bar_screen.dart';

class LoginController extends ChangeNotifier {
  bool hide = true;
  bool inAsyncCall = false;

  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Map<String, dynamic> bodyParams = {};

  clickOnLoginButton({required BuildContext context}) async {
    if (emailAddressController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      inAsyncCall = true;
      notifyListeners();
      bodyParams = {
        ApiKeyConstants.email: emailAddressController.text,
        ApiKeyConstants.password: passwordController.text,
      };
      UserModel? userModel = await ApiMethods.login(
        context: context,
        bodyParams: bodyParams,
      );
      if (userModel != null &&
          userModel.data != null &&
          userModel.data!.accessToken != null &&
          userModel.data!.accessToken!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.token, userModel.data!.accessToken!);
      }
      if (userModel != null &&
          userModel.data != null &&
          userModel.data!.dependency != null &&
          userModel.data!.dependency!.isNotEmpty &&
          userModel.data!.dependency == '1') {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.dependency, userModel.data!.dependency!);
        sp.setString(ApiKeyConstants.type, userModel.data!.type ?? '');
        if (userModel.data!.type != null &&
                userModel.data!.type == ApiKeyConstants.registeredSeller ||
            userModel.data!.type == ApiKeyConstants.unregisteredSeller) {
          NavigationMethods.pushMethod(
              context: context, widget: const BottomNavBarScreen());
        } else {
          NavigationMethods.pushMethod(
              context: context, widget: const UserBottomNavBarScreen());
        }
      } else {
        if (userModel != null && userModel.data != null) {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString(ApiKeyConstants.type, userModel.data!.type ?? '');
          if (userModel.data!.type != null &&
              (userModel.data!.type == ApiKeyConstants.registeredSeller ||
                  userModel.data!.type == ApiKeyConstants.unregisteredSeller)) {
            NavigationMethods.pushMethod(
                context: context, widget: const AddYourBusinessTypeScreen());
          } else {
            sp.setString(ApiKeyConstants.dependency, '1');
            NavigationMethods.pushMethod(
                context: context, widget: const UserBottomNavBarScreen());
          }
        }
      }
    } else {
      CommonWidgets.toastView(context: context, title: 'All field required!');
    }
    inAsyncCall = false;
    notifyListeners();
  }

  clickOnSignUpButton({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const SignUpScreen());
  }

  clickOnForgotPassword({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const PasswordResetScreen());
  }

  clickOnEye() {
    hide = !hide;
    notifyListeners();
  }

  Future<void> initMethod({required BuildContext context}) async {
    if (kDebugMode) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? type = sp.getString(ApiKeyConstants.type);
      if (type == ApiKeyConstants.user) {
        emailAddressController.text = 'testuser@gmail.com';
        passwordController.text = '123456';
      } else {
        emailAddressController.text = 'test@gmail.com';
        passwordController.text = '123456';
      }
    }
  }
}
