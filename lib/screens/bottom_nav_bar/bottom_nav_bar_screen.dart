import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../main.dart';
import '../../utils/common_methods.dart';
import '../../utils/constants/icons_constant.dart';
import '../../utils/constants/string_constants.dart';
import 'bottom_nav_bar_controller.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => BottomNavBarScreenState();
}

class BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  void initState() {
    super.initState();
    var bottomNavBarController =
        Provider.of<BottomNavBarController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarController>(
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
                      EdgeInsets.symmetric(horizontal: 30.px, vertical: 4.px),
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
                        text: StringConstants.myProducts,
                        index: 1,
                      ),
                      button(
                        image: IconConstants.icChats,
                        text: StringConstants.chats,
                        index: 2,
                      ),
                      button(
                        image: IconConstants.icAccount,
                        text: StringConstants.profile,
                        index: 3,
                      ),
                    ],
                    selectedIndex: selectedIndex,
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
            color: selectedIndex == index
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.surface,
          ),
          if (text.isNotEmpty) SizedBox(height: 4.px),
          if (text.isNotEmpty)
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: selectedIndex == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.surface,
                  ),
            ),
        ],
      ),
      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: selectedIndex == index
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.surface,
          ),
      // text: text,
    );
  }
}
