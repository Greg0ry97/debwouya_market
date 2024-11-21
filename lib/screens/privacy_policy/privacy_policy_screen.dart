import 'package:debwouya_market/screens/privacy_policy/privacy_policy_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import '../../utils/constants/image_constants.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/progress_bar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => PrivacyPolicyScreenState();
}

class PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
    var privacyPolicyController =
        Provider.of<PrivacyPolicyController>(context, listen: false);
    privacyPolicyController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PrivacyPolicyController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
            context: context,
            title: StringConstants.privacyPolicy,
          ),
          body: ProgressBar(
            inAsyncCall: controller.inAsyncCall,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.px),
                      Image.asset(
                        ImageConstants.imagePrivacyPolicy,
                        height: 350.px,
                        width: 300.px,
                      ),
                      Html(
                          data: controller.data?.description ??
                              ''),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
