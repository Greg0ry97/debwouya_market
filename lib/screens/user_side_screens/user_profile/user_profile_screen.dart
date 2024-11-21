import 'package:debwouya_market/screens/user_side_screens/user_profile/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/common_widgets.dart';
import '../../../utils/constants/string_constants.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    var profileController =
        Provider.of<UserProfileController>(context, listen: false);
    profileController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context,
              title: StringConstants.profile,
              wantBackButton: false),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: ListView(
              children: [
                SizedBox(height: 10.px),
                GestureDetector(
                  onTap: () => controller.clickOnEditProfile(context: context),
                  child: Row(
                    children: [
                      CommonWidgets.imageView(
                        image: controller.image ??
                            'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                        width: 100.px,
                        height: 100.px,
                        fit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(50.px),
                      ),
                      SizedBox(width: 20.px),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.name ?? 'Tommy Jason',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6.px),
                          Text(
                            controller.email ?? 'tommyjason@gmail.com',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.px),
                CommonMethods.textGradient(
                  text: StringConstants.feature,
                  context: context,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 16.px,
                      ),
                ),
                SizedBox(height: 10.px),
                dataWidget(
                  text: StringConstants.purchases,
                  onTap: () {},
                ),
                dataWidget(
                  text: StringConstants.wallet,
                  onTap: () {},
                ),
                dataWidget(
                  text: StringConstants.chat,
                  onTap: () {},
                ),
                dataWidget(
                  text: StringConstants.theProject,
                  onTap: () {},
                ),
                SizedBox(height: 10.px),
                CommonMethods.textGradient(
                  text: StringConstants.account,
                  context: context,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 16.px,
                      ),
                ),
                SizedBox(height: 10.px),
                dataWidget(
                  text: StringConstants.settings,
                  onTap: () => controller.clickOnSettings(context: context),
                ),
                dataWidget(
                  text: StringConstants.help,
                  onTap: () => () {},
                ),
                /*dataWidget(
                  text: StringConstants.changePassword,
                  onTap: () =>
                      controller.clickOnChangePassword(context: context),
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
                ),*/
                /*dataWidget(
                  text: StringConstants.termsAndCondition,
                  onTap: () =>
                      controller.clickOnTermsAndCondition(context: context),
                ),*/
                dataWidget(
                  text: StringConstants.propositionForDebwouya,
                  onTap: () {},
                ),
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
