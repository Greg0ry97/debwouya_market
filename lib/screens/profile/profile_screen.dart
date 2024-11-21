import 'package:debwouya_market/screens/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import '../../utils/constants/string_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    var profileController =
        Provider.of<ProfileController>(context, listen: false);
    profileController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
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
                Row(
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
                                  fontSize: 16.px, fontWeight: FontWeight.w600),
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
                SizedBox(height: 10.px),
                dataWidget(
                  text: StringConstants.editProfile,
                  onTap: () => controller.clickOnEditProfile(context: context),
                ),
                dataWidget(
                  text: StringConstants.orderHistory,
                  onTap: () => controller.clickOnOrderHistory(context: context),
                ),
                dataWidget(
                  text: StringConstants.invoices,
                  onTap: () => controller.clickOnInvoices(context: context),
                ),
                dataWidget(
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
