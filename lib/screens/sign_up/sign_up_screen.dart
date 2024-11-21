import 'package:debwouya_market/screens/sign_up/sign_up_controller.dart';
import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/icons_constant.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:debwouya_market/utils/progress_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_methods.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    var signUpController =
        Provider.of<SignUpController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(context: context, wantBackButton: true),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.px),
                      Text(
                        StringConstants.signUp,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants.letsGetStartedByCreatingYourAccount,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 34.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        context: context,
                        controller: controller.fullNameController,
                        hintText: StringConstants.fullName,
                        prefixIcon: IconConstants.icProfile,
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        context: context,
                        controller: controller.emailAddressController,
                        hintText: StringConstants.emailAddress,
                        prefixIcon: IconConstants.icEmail,
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        context: context,
                        controller: controller.siretNumberController,
                        hintText: StringConstants.siretNumber,
                        prefixIcon: IconConstants.icProfile,
                      ),
                      SizedBox(height: 20.px),
                      /* CommonWidgets.commonTextFieldForLoginSignUP(
                        context: context,
                        hintText: StringConstants.budget,
                        prefixIcon: IconConstants.icDollarCircle,
                      ),
                      SizedBox(height: 20.px),*/
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          context: context,
                          controller: controller.mobileNumberController,
                          hintText: StringConstants.mobileNumber,
                          prefixIcon: IconConstants.icMobile,
                          keyboardType: TextInputType.number),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        context: context,
                        controller: controller.passwordController,
                        hintText: StringConstants.password,
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
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        context: context,
                        controller: controller.confirmPasswordController,
                        hintText: StringConstants.confirmPassword,
                        prefixIcon: IconConstants.icPassword,
                        obscureText: controller.hideForConfirm,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.clickOnEyeForConfirm(),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.px),
                            child: CommonMethods.appIcons(
                              context: context,
                              assetName: controller.hideForConfirm
                                  ? IconConstants.icHidePassword
                                  : IconConstants.icShowPassword,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 22.px),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.clickOnCheckBox(),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.px),
                              child: CommonMethods.appIconsReal(
                                width: 20.px,
                                height: 20.px,
                                assetName: controller.check
                                    ? IconConstants.icCheck
                                    : IconConstants.icUncheckCheck,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.px),
                          Flexible(
                            child: RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'I agree to the ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 14.px),
                                  ),
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                  TextSpan(
                                    text: ' and ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 14.px),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () =>
                            controller.clickOnSignUpButton(context: context),
                        text: StringConstants.signUp,
                        context: context,
                      ),
                      SizedBox(height: 30.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringConstants.alreadyHaveAnAccount,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          InkWell(
                            onTap: () =>
                                controller.clickOnLoginButton(context: context),
                            borderRadius: BorderRadius.circular(4.px),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.px),
                              child: Text(
                                StringConstants.login,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px),
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
