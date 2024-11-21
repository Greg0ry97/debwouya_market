import 'package:debwouya_market/utils/common_methods.dart';
import 'package:debwouya_market/utils/constants/icons_constant.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import 'invoices_controller.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => InvoicesScreenState();
}

class InvoicesScreenState extends State<InvoicesScreen> {
  @override
  void initState() {
    super.initState();
    var invoicesController =
        Provider.of<InvoicesController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InvoicesController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.invoices),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 4.px),
            child: Column(
              children: [
                SizedBox(height: 20.px),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Invoice generating Date',
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 16.px),
                    ),
                    CommonMethods.appIcons(context: context,
                        assetName: IconConstants.icCalender,
                        height: 18.px,
                        width: 18.px),
                  ],
                ),
                SizedBox(height: 20.px),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
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
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'March 21, 2020',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                        fontSize: 14.px,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .error),
                                              ),
                                              SizedBox(height: 10.px),
                                              Text(
                                                'Invoice #3456032',
                                                maxLines: 2,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      fontSize: 12.px,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                              ),
                                              SizedBox(height: 10.px),
                                              Text(
                                                '78 andovwer  Rd, Sri Lanka, OR97052',
                                                maxLines: 2,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      fontSize: 12.px,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                              ),
                                              SizedBox(height: 10.px),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.px),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Rs. 380',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                    fontSize: 12.px,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            SizedBox(height: 10.px),
                                            Text(
                                              'PAID',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                      fontSize: 12.px,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onError),
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
