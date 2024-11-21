import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/navigation_methos.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentMethodsController extends ChangeNotifier {
  List item = [
    {'title': 'Cash'},
    {'title': 'Wallet'},
    {'title': 'Credit & Debit Card'},
    {'title': 'Paypal'},
    {'title': 'Google Pay'},
  ];

  clickOnConfirmPayment({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('lib/assets/icons/ic_cart.png',height: 124.px,width: 124.px,),
              SizedBox(height: 20.px),
              Text(
                'Order Place Successfully',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 16.px),
              ),
              SizedBox(height: 20.px),
              Text(
                'PV2M+H46, No.8, Residency Area, 200 Ro...',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 12.px),
              ),
              SizedBox(height: 20.px),
              CommonWidgets.commonElevatedButton(
                  text: 'View Order Status', onPressed: () {
                    NavigationMethods.popMethod(context: context);
              }, context: context)
            ],
          ),
        );
      },
    );
  }
}
