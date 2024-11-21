import 'package:debwouya_market/screens/user_side_screens/user_home/user_home_controller.dart';
import 'package:debwouya_market/utils/common_methods.dart';
import 'package:debwouya_market/utils/constants/icons_constant.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_widgets.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  void initState() {
    super.initState();
    var homeController =
        Provider.of<UserHomeController>(context, listen: false);
    homeController.getProfileApi(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserHomeController>(
      builder: (context, controller, child) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonMethods.textGradient(
                            text: StringConstants.debwouya,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 22.px),
                            context: context,
                          ),
                          SizedBox(width: 20.px),
                          GestureDetector(
                            onTap: () =>
                                controller.clickOnAddButton(context: context),
                            child: CommonMethods.appIconsReal(
                              assetName: IconConstants.icNotification,
                              height: 48.px,
                              width: 48.px,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        readOnly: true,
                        onTap: () => controller.clickOnSearchField(context: context),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 20.px),
                          ),
                          CommonMethods.textGradient(
                            text: 'View All',
                            context: context,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px),
                      SizedBox(
                        height: 100.px,
                        child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Column(
                                children: [
                                  CommonWidgets.imageView(
                                    image: controller.image ??
                                        'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                                    width: 50.px,
                                    height: 50.px,
                                    fit: BoxFit.cover,
                                    borderRadius: BorderRadius.circular(25.px),
                                  ),
                                  SizedBox(height: 8.px),
                                  Text(
                                    'Cloths',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Flash Sale',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 20.px),
                          ),
                          CommonMethods.textGradient(
                            text: 'View All',
                            context: context,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px),
                      SizedBox(
                        height: 320.px,
                        child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.px),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonWidgets.imageView(
                                      image: controller.image ??
                                          'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                                      width: 220.px,
                                      height: 240.px,
                                      fit: BoxFit.cover,
                                      borderRadius:
                                          BorderRadius.circular(20.px),
                                    ),
                                    SizedBox(height: 8.px),
                                    Row(
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Apple Watch i7',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(fontSize: 14.px),
                                            ),
                                            SizedBox(height: 8.px),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'RS. 239.00',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                          fontSize: 16.px),
                                                ),
                                                SizedBox(width: 2.px),
                                                Text(
                                                  'RS. 420.00',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall
                                                      ?.copyWith(
                                                          fontSize: 10.px,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          decorationColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .surface),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          '235 Sold',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(
                                                  fontSize: 10.px,
                                                  decorationColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .surface),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Image.asset(
                        'lib/assets/images/image_banner.png',
                        height: 160.px,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 20.px),
                      Text(
                        'Recent items',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 20.px),
                      ),
                      SizedBox(height: 10.px),
                      Wrap(
                        children: List.generate(
                          10,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.px, horizontal: 4.px),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.4.px,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.px),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidgets.imageView(
                                    image: controller.image ??
                                        'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                                    width: 220.px,
                                    height: 170.px,
                                    fit: BoxFit.cover,
                                    borderRadius: BorderRadius.circular(20.px),
                                  ),
                                  SizedBox(height: 8.px),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  cardWidget({
    required String title,
    required String subTitle,
  }) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(4.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 10.px, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 6.px),
            Text(
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 10.px),
            ),
          ],
        ),
      ),
    );
  }
}
