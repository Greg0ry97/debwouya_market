import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/progress_bar.dart';
import 'change_password_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  void initState() {
    super.initState();
    var changePasswordController =
        Provider.of<ChangePasswordController>(context, listen: false);
    changePasswordController.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(
                context: context, title: StringConstants.changePassword),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(24.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickSaveButton(context: context),
                text: StringConstants.submit,
                context: context,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.currentPassword,
                      controller: controller.currentPasswordController,
                      context: context,
                      focusNode: controller.focusCurrentPassword,
                      title: StringConstants.currentPassword,
                      isCard: controller.isCurrentPassword,
                      /* prefixIcon: CommonMethods.appIcons(context: context,
                          assetName: IconConstants.icPasswordInActive,
                          color: controller.isCurrentPassword
                              ? Theme.of(context).primaryColor
                              : null),*/
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusNewPassword,
                      title: StringConstants.newPassword,
                      controller: controller.newPasswordController,
                      isCard: controller.isNewPassword,
                      /*prefixIcon: CommonMethods.appIcons(context: context,
                          assetName: IconConstants.icPasswordInActive,
                          color: controller.isNewPassword
                              ? Theme.of(context).primaryColor
                              : null),*/
                      hintText: StringConstants.newPassword,
                      context: context,
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusConfirmPassword,
                      title: StringConstants.confirmPassword,
                      controller: controller.confirmPasswordController,
                      isCard: controller.isConfirmPassword,
                      /*prefixIcon: CommonMethods.appIcons(context: context,
                          assetName: IconConstants.icPasswordInActive,
                          color: controller.isConfirmPassword
                              ? Theme.of(context).primaryColor
                              : null),*/
                      hintText: StringConstants.confirmPassword,
                      context: context,
                    ),
                    SizedBox(height: 10.px),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
