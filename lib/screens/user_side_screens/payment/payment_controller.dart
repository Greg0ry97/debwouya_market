import 'package:debwouya_market/screens/user_side_screens/address/address_screen.dart';
import 'package:debwouya_market/screens/user_side_screens/payment_methods/payment_methods_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/navigation_methos.dart';

class PaymentController extends ChangeNotifier {
  clickOnAddAddress({required BuildContext context}) {
    NavigationMethods.pushMethod(context: context, widget: AddressScreen());
  }

  clickOnCheckOut({required BuildContext context}) {
    NavigationMethods.pushMethod(context: context, widget: PaymentMethodsScreen());
  }
}
