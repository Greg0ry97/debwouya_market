import 'package:debwouya_market/screens/user_side_screens/setting/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_widgets.dart';
import '../../../utils/constants/string_constants.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({super.key});

  @override
  State<UserSettingScreen> createState() => UserSettingScreenState();
}

class UserSettingScreenState extends State<UserSettingScreen> {
  @override
  void initState() {
    super.initState();
    var userSettingController =
        Provider.of<UserSettingController>(context, listen: false);
    userSettingController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSettingController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.settings),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: ListView(
              children: [
                SizedBox(height: 10.px),
                dataWidget(
                  text: StringConstants.editProfile,
                  onTap: () => controller.clickOnEditProfile(context: context),
                ),
                dataWidget(
                  text: StringConstants.changePassword,
                  onTap: () =>
                      controller.clickOnChangePassword(context: context),
                ),
                dataWidget(
                  text: StringConstants.shippingAddress,
                  onTap: () =>
                      controller.clickOnShippingAddress(context: context),
                ),
                dataWidget(
                  text: StringConstants.notification,
                  onTap: () =>
                      controller.clickOnNotificationAddress(context: context),
                ),
                dataWidget(
                  text: StringConstants.faq,
                  onTap: () =>
                      controller.clickOnFaq(context: context),
                ),
                dataWidget(
                  text: StringConstants.privacyPolicy,
                  onTap: () =>
                      controller.clickOnPrivacyPolicy(context: context),
                ),
                dataWidget(
                  text: StringConstants.aboutUs,
                  onTap: () => controller.clickOnAboutUs(context: context),
                ),
                dataWidget(
                  text: StringConstants.support,
                  onTap: () => controller.clickOnSupport(context: context),
                ),
                /*dataWidget(
                  text: StringConstants.termsAndCondition,
                  onTap: () =>
                      controller.clickOnTermsAndCondition(context: context),
                ),*/
                dataWidget(
                  text: StringConstants.logout,
                  onTap: () => controller.clickOnLogout(context: context),
                ),
                SizedBox(height: 20.px),
              ],
            ),
          ),
        );
      },
    );
  }

  titleText({required String title}) {
    return Text(
      title,
      style:
          Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20.px),
    );
  }

  dataWidget({required String text, GestureTapCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(fontSize: 16.px, fontWeight: FontWeight.w600),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded,
          size: 14.px, color: Theme.of(context).textTheme.labelMedium?.color),
    );
  }
}
