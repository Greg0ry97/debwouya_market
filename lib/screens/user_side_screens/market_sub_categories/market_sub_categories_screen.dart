import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_methods.dart';
import '../../../utils/common_widgets.dart';
import '../../../utils/constants/icons_constant.dart';
import 'market_sub_categories_controller.dart';

class MarketSubCategoriesScreen extends StatefulWidget {
  const MarketSubCategoriesScreen({super.key});

  @override
  State<MarketSubCategoriesScreen> createState() =>
      _MarketSubCategoriesScreenState();
}

class _MarketSubCategoriesScreenState extends State<MarketSubCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    var marketSubCategoriesController =
        Provider.of<MarketSubCategoriesController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketSubCategoriesController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(context: context, title: "Cloths"),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Wrap(
                children: List.generate(
                  10,
                  (index) => GestureDetector(
                    onTap: () => controller.clickOnCard(index: index, context:context),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.px, horizontal: 4.px),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.4.px,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWidgets.imageView(
                              image:
                                  'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                              width: 220.px,
                              height: 170.px,
                              fit: BoxFit.cover,
                              borderRadius: BorderRadius.circular(20.px),
                            ),
                            SizedBox(height: 8.px),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonMethods.textGradient(
                                  text: 'Rs. 240.00',
                                  context: context,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 14.px),
                                ),
                                CommonMethods.appIcons(
                                    assetName: IconConstants.icFavorites,
                                    context: context)
                              ],
                            ),
                            SizedBox(height: 8.px),
                            Text(
                              'iPhone 11 pro',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 12.px),
                            )
                          ],
                        ),
                      ),
                    ),
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
