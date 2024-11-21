import 'package:debwouya_market/screens/chat_list/chat_list_screen.dart';
import 'package:debwouya_market/screens/my_products/my_products_screen.dart';
import 'package:debwouya_market/screens/user_side_screens/favorites/favorites_screen.dart';
import 'package:debwouya_market/screens/user_side_screens/market/market_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../main.dart';
import '../../../utils/common_widgets.dart';
import '../../../utils/constants/string_constants.dart';
import '../user_home/user_home_controller.dart';
import '../user_home/user_home_screen.dart';
import '../user_profile/user_profile_screen.dart';

class UserBottomNavBarController extends ChangeNotifier {
  clickOnTabChange(int value) {
    selectedIndexUser = value;
    notifyListeners();
  }

  body() {
    switch (selectedIndexUser) {
      case 0:
        return const UserHomeScreen();
      case 1:
        return const MarketScreen();
      case 2:
        return const FavoritesScreen();
      case 3:
        return const ChatListScreen();
      case 5:
        return const UserProfileScreen();
    }
  }

  onWillPop({required BuildContext context}) {
    if (selectedIndexUser == 0) {
      CommonWidgets.showAlertDialog(
        context: context,
        title: StringConstants.exit,
        content: StringConstants.doYouWantToExitAnApp,
        onPressedYes: () => SystemNavigator.pop(),
      );
    } else {
      selectedIndexUser = 0;
    }
  }
}
