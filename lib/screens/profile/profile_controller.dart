import 'package:debwouya_market/screens/about_us/about_us_screen.dart';
import 'package:debwouya_market/screens/change_password/change_password_screen.dart';
import 'package:debwouya_market/screens/edit_profile/edit_profile_screen.dart';
import 'package:debwouya_market/screens/get_starts/get_starts_screen.dart';
import 'package:debwouya_market/screens/invoices/invoices_screen.dart';
import 'package:debwouya_market/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:debwouya_market/screens/setting/setting_screen.dart';
import 'package:debwouya_market/screens/support/support_screen.dart';
import 'package:debwouya_market/screens/terms_and_condition/terms_and_condition_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../utils/api/api_key_constants.dart';
import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/user_model.dart';
import '../../utils/common_widgets.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/navigation_methos.dart';
import '../order_history/order_history_screen.dart';

class ProfileController extends ChangeNotifier {
  SharedPreferences? sp;

  String? image;
  String? name;
  String? email;

  bool inAsyncCall = false;
  UserData? userData;

  Future<void> initMethod({required BuildContext context}) async {
    sp = await SharedPreferences.getInstance();
    name = sp?.getString(ApiKeyConstants.userName);
    email = sp?.getString(ApiKeyConstants.email);
    image = sp?.getString(ApiKeyConstants.image);
    notifyListeners();
  }


  clickOnEditProfile({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const EditProfileScreen());
  }

  clickOnOrderHistory({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const OrderHistoryScreen());
  }

  clickOnInvoices({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const InvoicesScreen());
  }

  clickOnChangePassword({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const ChangePasswordScreen());
  }

  clickOnPrivacyPolicy({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const PrivacyPolicyScreen());
  }

  clickOnAboutUs({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const AboutUsScreen());
  }

  clickOnSupport({required BuildContext context}) {
    NavigationMethods.pushMethod(
      context: context,
      widget: const SupportScreen(),
    );
  }

  clickOnTermsAndCondition({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const TermsAndConditionScreen());
  }

  clickOnLogout({required BuildContext context}) {
    CommonWidgets.showAlertDialog(
      context: context,
      title: StringConstants.logout,
      content: StringConstants.wouldYouLikeToLogout,
      onPressedYes: () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();
        selectedIndex = 0;
        notifyListeners();
        NavigationMethods.pushAndRemoveUntilMethod(
            context: context, widget: const GetStartsScreen());
      },
    );
  }

  clickOnNotifications({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const SettingScreen());
  }
}
