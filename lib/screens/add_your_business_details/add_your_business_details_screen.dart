import 'dart:io';

import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_methods.dart';
import '../../utils/constants/icons_constant.dart';
import 'add_your_business_details_controller.dart';

class AddYourBusinessDetailsScreen extends StatefulWidget {
  const AddYourBusinessDetailsScreen({super.key});

  @override
  State<AddYourBusinessDetailsScreen> createState() =>
      _AddYourBusinessDetailsScreenState();
}

class _AddYourBusinessDetailsScreenState
    extends State<AddYourBusinessDetailsScreen> {
  @override
  void initState() {
    super.initState();
    var addYourBusinessDetailsController =
        Provider.of<AddYourBusinessDetailsController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddYourBusinessDetailsController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.yourBusinessDetails),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(24.px),
            child: CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnNextButton(context: context),
              text: StringConstants.next,
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
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.businessNameController,
                      context: context,
                      hintText: StringConstants.businessName,
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.locationController,
                      context: context,
                      hintText: StringConstants.location,
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.budgetController,
                      context: context,
                      hintText: StringConstants.budget,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.descriptionController,
                      context: context,
                      maxLength: 5,
                      hintText: StringConstants.description,
                    ),
                    SizedBox(height: 20.px),
                    GestureDetector(
                      onTap: () => controller.clickOnAddLogo(context: context),
                      child: (controller.image != null)
                          ? Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.px),
                                  ),
                                  child: Image.file(
                                    width: double.infinity,
                                    height: 174.px,
                                    fit: BoxFit.cover,
                                    File(
                                      controller.image?.path ?? '',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.px),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                    ),
                                    child: CommonMethods.appIconsReal(
                                        assetName: IconConstants.icEdit,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              width: double.infinity,
                              height: 174.px,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.px),
                                color: const Color(0xffF7F8F8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    StringConstants.addLogo,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  SizedBox(height: 14.px),
                                  CommonMethods.appIconsReal(
                                      assetName: IconConstants.icAdd),
                                ],
                              ),
                            ),
                    ),
                    SizedBox(height: 30.px),
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
