import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../main.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/constants/icons_constant.dart';
import '../../../utils/constants/string_constants.dart';
import 'user_bottom_nav_bar_controller.dart';

class UserBottomNavBarScreen extends StatefulWidget {
  const UserBottomNavBarScreen({super.key});

  @override
  State<UserBottomNavBarScreen> createState() => UserBottomNavBarScreenState();
}

class UserBottomNavBarScreenState extends State<UserBottomNavBarScreen> {
  @override
  void initState() {
    super.initState();
    var userBottomNavBarController =
        Provider.of<UserBottomNavBarController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserBottomNavBarController>(
      builder: (context, controller, child) {
        return WillPopScope(
          onWillPop: () => controller.onWillPop(context: context),
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: controller.body(),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20.px,
                    color: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .color!
                        .withOpacity(.1.px),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 6.px, vertical: 4.px),
                  child: GNav(
                    padding: EdgeInsets.symmetric(vertical: 4.px),
                    tabs: [
                      button(
                        image: IconConstants.icHome,
                        text: StringConstants.home,
                        index: 0,
                      ),
                      button(
                        image: IconConstants.icCategory,
                        text: StringConstants.market,
                        index: 1,
                      ),
                      button(
                        image: IconConstants.icFavorites,
                        text: StringConstants.favorites,
                        index: 2,
                      ),
                      button(
                        image: IconConstants.icChats,
                        text: StringConstants.myLoyalties,
                        index: 3,
                      ),
                      button(
                        image: IconConstants.icBook,
                        text: StringConstants.book,
                        index: 4,
                      ),
                      button(
                        image: IconConstants.icAccount,
                        text: StringConstants.profile,
                        index: 5,
                      ),
                    ],
                    selectedIndex: selectedIndexUser,
                    onTabChange: (value) => controller.clickOnTabChange(value),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  button({required String image, required String text, required int index}) {
    return GButton(
      icon: Icons.add,
      leading: Column(
        children: [
          CommonMethods.appIconsReal(
            assetName: image,
            height: 24.px,
            width: 24.px,
            color: selectedIndexUser == index
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.surface,
          ),
          if (text.isNotEmpty) SizedBox(height: 4.px),
          if (text.isNotEmpty)
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 12.px,
                    fontWeight: FontWeight.w700,
                    color: selectedIndexUser == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.surface,
                  ),
            ),
        ],
      ),
      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 12.px,
        fontWeight: FontWeight.w700,
            color: selectedIndexUser == index
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.surface,
          ),
      // text: text,
    );
  }
}
