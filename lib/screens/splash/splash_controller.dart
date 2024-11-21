import 'dart:async';

import 'package:debwouya_market/screens/get_starts/get_starts_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api/api_key_constants.dart';
import '../../utils/navigation_methos.dart';
import '../bottom_nav_bar/bottom_nav_bar_screen.dart';
import '../user_side_screens/user_bottom_nav_bar/user_bottom_nav_bar_screen.dart';

class SplashController extends ChangeNotifier {
  Future<void> manage({required BuildContext context}) async {
    Timer(
      const Duration(seconds: 3),
      () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        print(':::::::::::::::${sharedPreferences.getString(ApiKeyConstants.type)}');
        print(':::::::::::::::${sharedPreferences.getString(ApiKeyConstants.dependency)}');
        if (sharedPreferences.getString(ApiKeyConstants.dependency) != null &&
            sharedPreferences.getString(ApiKeyConstants.dependency) != '0') {
          if (sharedPreferences.getString(ApiKeyConstants.type) != null &&
              sharedPreferences.getString(ApiKeyConstants.type) ==
                  ApiKeyConstants.registeredSeller) {
            NavigationMethods.pushReplacementMethod(
              context: context,
              widget: const BottomNavBarScreen(),
            );
          } else {
            NavigationMethods.pushReplacementMethod(
              context: context,
              widget: const UserBottomNavBarScreen(),
            );
          }
        } else {
          NavigationMethods.pushAndRemoveUntilMethod(
              context: context, widget: const GetStartsScreen());
        }
      },
    );
  }
}
