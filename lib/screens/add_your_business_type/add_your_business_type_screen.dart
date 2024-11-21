import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:debwouya_market/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'add_your_business_type_controller.dart';

class AddYourBusinessTypeScreen extends StatefulWidget {
  const AddYourBusinessTypeScreen({super.key});

  @override
  State<AddYourBusinessTypeScreen> createState() =>
      _AddYourBusinessTypeScreenState();
}

class _AddYourBusinessTypeScreenState extends State<AddYourBusinessTypeScreen> {
  @override
  void initState() {
    super.initState();
    var addYourBusinessTypeController =
        Provider.of<AddYourBusinessTypeController>(context, listen: false);
    addYourBusinessTypeController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddYourBusinessTypeController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(
                context: context, title: StringConstants.yourBusinessType),
            bottomNavigationBar: controller.businessTypesData.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.all(24.px),
                    child: CommonWidgets.commonElevatedButton(
                      onPressed: () =>
                          controller.clickOnNextButton(context: context),
                      text: StringConstants.next,
                      context: context,
                    ),
                  )
                : null,
            body: Padding(
              padding: EdgeInsets.all(24.px),
              child: controller.businessTypesData.isNotEmpty
                  ? GridView.builder(
                      itemCount: controller.businessTypesData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                          ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.clickOnCard(index: index),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.px),
                              color: const Color(0xffF7F8F8),
                              border: Border.all(
                                  color: controller.businessTypesData[index].isSelected
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).scaffoldBackgroundColor,
                                  width: 2.px),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.businessTypesData[index].name ?? '',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                CommonWidgets.imageView(
                                  image:
                                      controller.businessTypesData[index].image ??
                                          '',
                                  width: double.infinity,
                                  height: 70.px,
                                  borderRadius: BorderRadius.circular(10.px),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : SizedBox(),
            ),
          ),
        );
      },
    );
  }
}
