import 'package:debwouya_market/screens/user_side_screens/payment/payment_screen.dart';
import 'package:debwouya_market/screens/user_side_screens/product_detail/product_detail_screen.dart';
import 'package:debwouya_market/utils/navigation_methos.dart';
import 'package:flutter/material.dart';

class ProductDetailController extends ChangeNotifier {
  clickOnCard({required int index, required BuildContext context}) {
    NavigationMethods.pushMethod(context: context, widget: const ProductDetailScreen());
  }

  clickOnAddToBag({required BuildContext context}) {
    NavigationMethods.pushMethod(context: context, widget: const PaymentScreen());
  }
}
