import 'package:debwouya_market/screens/login/login_screen.dart';
import 'package:debwouya_market/utils/api/api_key_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/navigation_methos.dart';

class GetStartsController extends ChangeNotifier {
  clickOnBuyerButton({required BuildContext context}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(ApiKeyConstants.type, ApiKeyConstants.user);
    NavigationMethods.pushReplacementMethod(
      context: context,
      widget: const LoginScreen(),
    );
  }

  clickOnRegisteredSellerButton({required BuildContext context}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(ApiKeyConstants.type, ApiKeyConstants.registeredSeller);
    NavigationMethods.pushReplacementMethod(
      context: context,
      widget: const LoginScreen(),
    );
  }

  clickOnUnRegisteredSellerButton({required BuildContext context}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(ApiKeyConstants.type, ApiKeyConstants.unregisteredSeller);
    NavigationMethods.pushReplacementMethod(
      context: context,
      widget: const LoginScreen(),
    );
  }
}
