import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'payment_methods_controller.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => PaymentMethodsScreenState();
}

class PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  void initState() {
    super.initState();
    var paymentController =
        Provider.of<PaymentMethodsController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentMethodsController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.paymentMethods),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.px),
            child: CommonWidgets.commonElevatedButton(
                text: 'Confirm Payment',
                onPressed: () =>
                    controller.clickOnConfirmPayment(context: context),
                context: context),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.px),
              child: ListView.builder(
                itemCount: controller.item.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.px),
                      Text(
                        controller.item[index]['title'],
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                      SizedBox(height: 8.px),
                      Card(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: RadioListTile<String>(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.px),
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: Theme.of(context).primaryColor,
                          title: Text(
                            controller.item[index]['title'],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                          value: '',
                          groupValue: '',
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
