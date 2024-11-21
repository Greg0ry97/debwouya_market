import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_methods.dart';
import 'order_controller.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    var orderController = Provider.of<OrderController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context,
              title: StringConstants.order,
              actions: [
                GestureDetector(
                  onTap: () => controller.clickOnDetail(context: context),
                  child: CommonMethods.textGradient(
                      text: StringConstants.detail,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 18.px,
                              color: Theme.of(context).primaryColor),
                      context: context),
                ),
                SizedBox(width: 24.px)
              ]),
          extendBody: true,
          extendBodyBehindAppBar: true,
          floatingActionButton: Padding(
            padding: EdgeInsets.all(24.px),
            child: Row(
              children: [
                Expanded(
                  child: CommonWidgets.commonElevatedButton(
                    onPressed: () =>
                        controller.clickOnAcceptButton(context: context),
                    text: StringConstants.accept,
                    borderRadius: 8,
                    height: 40,
                    buttonColor: Theme.of(context).colorScheme.onError,
                    wantContentSizeButton: true,
                    context: context,
                  ),
                ),
                SizedBox(width: 10.px),
                Expanded(
                  child: CommonWidgets.commonElevatedButton(
                    onPressed: () =>
                        controller.clickOnDeclineButton(context: context),
                    text: StringConstants.decline,
                    borderRadius: 8,
                    height: 40,
                    buttonColor: Theme.of(context).colorScheme.error,
                    wantContentSizeButton: true,
                    context: context,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: SingleChildScrollView(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.px),
                      Text(
                        'Order #121212\nRuben Vaccaro',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 24.px, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20.px),
                      Card(
                        margin: EdgeInsets.zero,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shadowColor: Theme.of(context).scaffoldBackgroundColor,
                        surfaceTintColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: Padding(
                          padding: EdgeInsets.all(10.px),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CommonMethods.textGradient(
                                      text: 'Ruben Vaccaro',
                                      context: context,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(fontSize: 14.px),
                                    ),
                                    SizedBox(width: 10.px),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.px, vertical: 4.px),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onError,
                                          borderRadius:
                                              BorderRadius.circular(8.px)),
                                      child: Text(
                                        'Call',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 10.px,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.px),
                                Text(
                                  'Total Cost- Rs. 12,450',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                ),
                                SizedBox(height: 10.px),
                                Text(
                                  '''Home- 21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria''',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 12.px,
                                          fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10.px),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Ordered Items',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 20.px),
                        ),
                      ),
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
                                          CommonMethods.textGradient(
                                              text: 'Rs. 10000.00',
                                              context: context),
                                          SizedBox(height: 10.px),
                                          Text(
                                            '25 In Stock',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 14.px,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onError),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shopping Cost',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10.px),
                          Text(
                            'Rs. 1500',
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
                            'First Purchase Discount',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 12.px,
                                    fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10.px),
                          Text(
                            'Rs. 50',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 12.px),
                          ),
                        ],
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
