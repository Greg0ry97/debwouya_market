import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/icons_constant.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:debwouya_market/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_methods.dart';
import 'create_new_password_controller.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  void initState() {
    super.initState();
    var createNewPasswordController =
        Provider.of<CreateNewPasswordController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateNewPasswordController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(context: context),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(24.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnSaveButton(context: context),
                text: StringConstants.save,
                context: context,
              ),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.px),
                      Text(
                        StringConstants.createNewPassword,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants
                            .yourNewPasswordMustBeDifferentFromPreviousUsedPasswords,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 34.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        context: context,
                        controller: controller.newPasswordController,
                        hintText: StringConstants.newPassword,
                        prefixIcon: IconConstants.icPassword,
                        obscureText: controller.hideForNew,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.clickOnEyeForNew(),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.px),
                            child: CommonMethods.appIcons(
                              context: context,
                              assetName: controller.hideForNew
                                  ? IconConstants.icHidePassword
                                  : IconConstants.icShowPassword,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        context: context,
                        controller: controller.confirmPasswordController,
                        hintText: StringConstants.confirmPassword,
                        prefixIcon: IconConstants.icPassword,
                        obscureText: controller.hide,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.clickOnEye(),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.px),
                            child: CommonMethods.appIcons(
                              context: context,
                              assetName: controller.hide
                                  ? IconConstants.icHidePassword
                                  : IconConstants.icShowPassword,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.px),
                    ],
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
