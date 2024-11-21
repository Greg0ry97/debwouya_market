import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/icons_constant.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:debwouya_market/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/constants/image_constants.dart';
import 'purchases_controller.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  @override
  void initState() {
    super.initState();
    var loginController = Provider.of<PurchasesController>(context, listen: false);
    loginController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchasesController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.px),
                      Image.asset(
                        ImageConstants.imageLoginSticker,
                        height: 136.px,
                      ),
                      SizedBox(height: 40.px),
                      Text(
                        StringConstants.login,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants.enterYourEmailAndPassword,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 34.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        context: context,
                        hintText: StringConstants.emailAddress,
                        controller: controller.emailAddressController,
                        prefixIcon: IconConstants.icEmail,
                      ),
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
                            child: CommonMethods.appIcons(context: context,
                              assetName: controller.hide
                                  ? IconConstants.icHidePassword
                                  : IconConstants.icShowPassword,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 22.px),
                      Center(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4.px),
                          onTap: () =>
                              controller.clickOnForgotPassword(context: context),
                          child: Padding(
                            padding: EdgeInsets.all(8.px),
                            child: Text(
                              StringConstants.forgotPassword,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontSize: 12.px,
                                      color:
                                          Theme.of(context).colorScheme.secondary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () =>
                            controller.clickOnLoginButton(context: context),
                        text: StringConstants.login,
                        context: context,
                      ),
                      SizedBox(height: 30.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringConstants.doNotHaveAnAccount,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          InkWell(
                            onTap: () =>
                                controller.clickOnSignUpButton(context: context),
                            borderRadius: BorderRadius.circular(4.px),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.px),
                              child: Text(
                                StringConstants.signUp,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.secondary,
                                    ),
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
