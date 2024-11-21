import 'package:debwouya_market/screens/chat_list/chat_list_screen.dart';
import 'package:debwouya_market/screens/home/home_screen.dart';
import 'package:debwouya_market/screens/my_products/my_products_screen.dart';
import 'package:debwouya_market/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../../utils/common_widgets.dart';
import '../../utils/constants/string_constants.dart';
import '../chat/chat_screen.dart';

class BottomNavBarController extends ChangeNotifier {
  clickOnTabChange(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  body() {
    switch (selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const MyProductsScreen();
      case 2:
        return const ChatListScreen();
      case 3:
        return const ProfileScreen();
    }
  }

  onWillPop({required BuildContext context}) {
    if (selectedIndex == 0) {
      CommonWidgets.showAlertDialog(
        context: context,
        title: StringConstants.exit,
        content: StringConstants.doYouWantToExitAnApp,
        onPressedYes: () => SystemNavigator.pop(),
      );
    } else {
      selectedIndex = 0;
    }
  }
}
