import 'package:debwouya_market/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_widgets.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/progress_bar.dart';
import 'faq_controller.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  void initState() {
    super.initState();
    var faqController = Provider.of<FaqController>(context, listen: false);
    faqController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FaqController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
            context: context,
            title: StringConstants.faq,
          ),
          body: ProgressBar(
            inAsyncCall: controller.inAsyncCall,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 20.px),
                  Image.asset(
                    ImageConstants.imageFaq,
                    height: 350.px,
                    width: 300.px,
                  ),
                  Text(
                    'FAQ',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 36.px),
                  ),
                  SizedBox(height: 10.px),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Column(
                            children: [
                              Card(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: ListTile(
                                  title: Text(
                                    'What services do you offer?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 14.px),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.px),
                              Text(
                                'What services do you offer?',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12.px),
                              ),
                            ],
                          ),
                      itemCount: 1),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
