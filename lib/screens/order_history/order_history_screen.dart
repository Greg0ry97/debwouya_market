import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import 'order_history_controller.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  void initState() {
    super.initState();
    var orderHistoryController =
        Provider.of<OrderHistoryController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderHistoryController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.orderHistory),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 4.px),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.searchController,
                      borderRadius: 15.px,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.2),
                      hintText: StringConstants.search,
                      //prefixIcon: IconConstants.icSearch,
                      context: context,
                    ),
                    SizedBox(height: 20.px),
                  ],
                ),
                SizedBox(height: 20.px),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'All Orders',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.px,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                SizedBox(height: 20.px),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                'Mario Paul',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                      fontSize: 14.px,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              SizedBox(height: 10.px),
                                              Text(
                                                'Rs. 11000',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                        fontSize: 12.px,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onError),
                                              ),
                                              SizedBox(height: 10.px),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.px),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Ready FOR Delivery',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                      fontSize: 12.px,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onError),
                                            ),
                                            SizedBox(height: 10.px),
                                            Text(
                                              'IN TRANSIT',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                    fontSize: 12.px,
                                                    color: Color(0xffA31198),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.px)
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
