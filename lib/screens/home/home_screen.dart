import 'package:debwouya_market/utils/common_methods.dart';
import 'package:debwouya_market/utils/constants/icons_constant.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import '../../utils/constants/image_constants.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    var homeController = Provider.of<HomeController>(context, listen: false);
    homeController.getProfileApi(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, child) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.px),
              child: Column(
                children: [
                  SizedBox(height: 20.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstants.welcome,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 22.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            controller.name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 16.px),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.px),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                controller.clickOnAddButton(context: context),
                            child: CommonMethods.appIconsReal(
                              assetName: IconConstants.icAdd,
                              height: 34.px,
                              width: 34.px,
                            ),
                          ),
                          SizedBox(width: 20.px),
                          CommonWidgets.imageView(
                            image: controller.image ??
                                'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                            width: 40.px,
                            height: 40.px,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(20.px),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Open Orders',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 20.px),
                      ),
                      /*Text(
                                'View All',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context).colorScheme.error,
                                        fontWeight: FontWeight.w400),
                              ),*/
                    ],
                  ),
                  SizedBox(height: 20.px),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.clickOnCard(context: context),
                          child: Card(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            shadowColor:
                                Theme.of(context).scaffoldBackgroundColor,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Ruben Vaccaro',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(fontSize: 14.px),
                                        ),
                                        Text(
                                          '10/10/2024',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(fontSize: 14.px),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.px),
                                    CommonMethods.textGradient(
                                        text: 'Rs. 4300.00', context: context),
                                    SizedBox(height: 10.px),
                                    Text(
                                      'Annapurna Road, (MP)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 14.px,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 10.px),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.px, vertical: 8.px),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onError,
                                          borderRadius:
                                              BorderRadius.circular(8.px)),
                                      child: Text(
                                        'Ready for Pickup',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 14.px,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                      ),
                                    ),
                                    SizedBox(height: 4.px),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.px),
                ],
              ),
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
