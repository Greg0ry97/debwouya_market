import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:debwouya_market/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'otp_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
    var otpController = Provider.of<OtpController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OtpController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(context: context),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(24.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: () =>
                    controller.clickOnSubmitButton(context: context),
                text: StringConstants.submit,
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
                        StringConstants.checkYourMailOrCheckYourCellPhone,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants.pleasePutTheDigitsSentToYou,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 34.px),
                      CommonWidgets.commonOtpView(
                          controller: controller.pin, context: context),
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
