import 'package:debwouya_market/screens/user_side_screens/market_sub_categories/market_sub_categories_screen.dart';
import 'package:debwouya_market/utils/navigation_methos.dart';
import 'package:flutter/material.dart';

class AddressController extends ChangeNotifier {
  clickOnCard({required int index, required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: MarketSubCategoriesScreen());
  }

  clickOnContinueButton({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: MarketSubCategoriesScreen());
  }
}
