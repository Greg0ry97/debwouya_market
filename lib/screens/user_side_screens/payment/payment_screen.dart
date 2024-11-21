import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_methods.dart';
import '../../../utils/constants/icons_constant.dart';
import 'payment_controller.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    var paymentController =
        Provider.of<PaymentController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.payment),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.px),
            child: CommonWidgets.commonElevatedButton(
                text: 'Check Out', onPressed: () =>controller.clickOnCheckOut(context: context), context: context),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.px),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Card(
                          elevation: 1,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          surfaceTintColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: Padding(
                            padding: EdgeInsets.all(16.px),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CommonWidgets.imageView(
                                      image:
                                          'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                                      width: 80.px,
                                      height: 80.px,
                                      borderRadius:
                                          BorderRadius.circular(16.px),
                                    ),
                                    SizedBox(width: 10.px),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Tag Heuer Wristwatch',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                  fontSize: 16.px,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          SizedBox(height: 10.px),
                                          Text(
                                            'Size : L',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 12.px,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          SizedBox(height: 10.px),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonMethods.textGradient(
                                                  text: 'Rs. 10000.00',
                                                  context: context),
                                              Row(
                                                children: [
                                                  CommonMethods.appIconsReal(
                                                      assetName: IconConstants
                                                          .icDecrement),
                                                  CommonMethods.textGradient(
                                                      text: ' 1 ',
                                                      context: context),
                                                  CommonMethods.appIconsReal(
                                                      assetName: IconConstants
                                                          .icIncrement),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10.px),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Payment Detail',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 20.px),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10.px),
                          Text(
                            'Rs. 25.98',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 12.px),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxes',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10.px),
                          Text(
                            'Rs. 1.0',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 12.px),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 12.px),
                          ),
                          SizedBox(width: 10.px),
                          Text(
                            'Rs. 26.98',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 12.px),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Address',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 20.px),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      Card(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.px),
                        ),
                        child: Column(
                          children: [
                            ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return RadioListTile<String>(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.px),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  activeColor: Theme.of(context).primaryColor,
                                  title: Text(
                                    'Sapphire House, 402 A, B, C, Sapna....',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontSize: 10.px,
                                        ),
                                  ),
                                  value: '',
                                  groupValue: '',
                                  onChanged: (value) {},
                                );
                              },
                            ),
                            InkWell(
                              onTap: () => controller.clickOnAddAddress(
                                  context: context),
                              borderRadius: BorderRadius.circular(15.px),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.px, horizontal: 14.px),
                                child: Row(
                                  children: [
                                    CommonMethods.appIconsReal(
                                        assetName: IconConstants.icAdd),
                                    SizedBox(width: 10.px),
                                    Text(
                                      'Add Address',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontSize: 10.px,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
