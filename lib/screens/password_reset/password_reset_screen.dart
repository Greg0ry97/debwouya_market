import 'package:debwouya_market/utils/common_methods.dart';
import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/icons_constant.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:debwouya_market/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'password_reset_controller.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  void initState() {
    super.initState();
    var passwordResetController =
        Provider.of<PasswordResetController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordResetController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(context: context),
            floatingActionButton: Padding(
              padding: EdgeInsets.all(24.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: () =>
                    controller.clickOnSendButton(context: context),
                text: StringConstants.send,
                context: context,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.px),
                      Text(
                        StringConstants.passwordReset,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants
                            .pleasePutYourMobileNumberToResetYourPassword,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 30.px),
                      Container(
                        padding: EdgeInsets.all(8.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2.px),
                        ),
                        child: Row(
                          children: [
                            CommonMethods.appIconsReal(
                              assetName: IconConstants.icSms,
                              height: 80.px,
                              width: 80.px,
                            ),
                            SizedBox(width: 20.px),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      StringConstants.emailAddress,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(fontSize: 14.px),
                                    ),
                                    TextField(
                                      controller: controller.emailAddressController,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(fontSize: 14.px),
                                      decoration: InputDecoration(
                                          hintText: StringConstants.emailAddress,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(fontSize: 14.px),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none),
                                    ),
                                  ]),
                            ),
                          ],
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
