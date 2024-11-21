import 'package:debwouya_market/utils/common_methods.dart';
import 'package:debwouya_market/utils/constants/icons_constant.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:debwouya_market/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import 'my_products_controller.dart';

class MyProductsScreen extends StatefulWidget {
  const MyProductsScreen({super.key});

  @override
  State<MyProductsScreen> createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {
  @override
  void initState() {
    super.initState();
    var myProductsController =
        Provider.of<MyProductsController>(context, listen: false);
    myProductsController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProductsController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(
                context: context,
                title: StringConstants.myProducts,
                wantBackButton: false,
                actions: [
                  CommonMethods.appIconsReal(assetName: IconConstants.icEdit),
                  SizedBox(width: 24.px)
                ]),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 4.px),
              child: ListView.builder(
                itemCount: controller.myProductsData.length,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CommonWidgets.imageView(
                                      image: controller.myProductsData[index]
                                              .images?.first ??
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
                                            controller.myProductsData[index]
                                                    .productName ??
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
                                              text:
                                                  'Rs. ${controller.myProductsData[index].productPrice ?? "10000.00"}',
                                              context: context),
                                          SizedBox(height: 10.px),
                                          Text(
                                            '${controller.myProductsData[index].productStock ?? "10000.00"} In Stock',
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
                      SizedBox(height: 10.px)
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
