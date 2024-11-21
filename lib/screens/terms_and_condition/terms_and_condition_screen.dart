import 'package:debwouya_market/screens/terms_and_condition/terms_and_condition_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import '../../utils/constants/image_constants.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/progress_bar.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  @override
  void initState() {
    super.initState();
    var termsAndConditionController =
        Provider.of<TermsAndConditionController>(context, listen: false);
    termsAndConditionController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TermsAndConditionController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
            context: context,
            title: StringConstants.termsAndCondition,
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
                        ImageConstants.imageTermsAndCondition,
                        height: 350.px,
                        width: 300.px,
                      ),
                      Html(
                        data: /*controller.data?.tacText ??*/ 'T AND C',
                      ),
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
