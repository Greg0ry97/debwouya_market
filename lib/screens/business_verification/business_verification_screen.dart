import 'dart:io';

import 'package:debwouya_market/utils/common_methods.dart';
import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:debwouya_market/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/constants/icons_constant.dart';
import 'business_verification_controller.dart';

class BusinessVerificationScreen extends StatefulWidget {
  const BusinessVerificationScreen({super.key});

  @override
  State<BusinessVerificationScreen> createState() =>
      _BusinessVerificationScreenState();
}

class _BusinessVerificationScreenState
    extends State<BusinessVerificationScreen> {
  @override
  void initState() {
    super.initState();
    var businessVerificationController =
        Provider.of<BusinessVerificationController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessVerificationController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(
                context: context, title: StringConstants.businessVerification),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(24.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnSubmitButton(context: context),
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
                      GestureDetector(
                        onTap: () => controller.clickOnAddLogo(
                            context: context,
                            type: StringConstants.businessLicense),
                        child: (controller.imageForLicence != null)
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
                                        controller.imageForLicence?.path ?? '',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(20),
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
                                      StringConstants.businessLicense,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(fontSize: 20.px),
                                    ),
                                    SizedBox(height: 14.px),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 24.px),
                                      child: Text(
                                        StringConstants
                                            .takeADriversLicenseNationalIdentityCardOrPassportPhoto,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(fontSize: 14.px),
                                      ),
                                    ),
                                    SizedBox(height: 14.px),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CommonMethods.appIconsReal(
                                          assetName: IconConstants.icAdd,
                                          width: 34.px,
                                          height: 34.px,
                                        ),
                                        SizedBox(width: 8.px),
                                        Text(
                                          StringConstants.selectImage,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontSize: 14.px,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ),
                      SizedBox(height: 20.px),
                      GestureDetector(
                        onTap: () => controller.clickOnAddLogo(
                            context: context,
                            type: StringConstants.taxDocuments),
                        child: (controller.imageForTax != null)
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
                                        controller.imageForTax?.path ?? '',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(20),
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
                                      StringConstants.taxDocuments,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(fontSize: 20.px),
                                    ),
                                    SizedBox(height: 14.px),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 24.px),
                                      child: Text(
                                        StringConstants
                                            .itsRequiredByLawToVerifyYourIdentityAsANewUser,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(fontSize: 14.px),
                                      ),
                                    ),
                                    SizedBox(height: 14.px),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CommonMethods.appIconsReal(
                                          assetName: IconConstants.icAdd,
                                          width: 34.px,
                                          height: 34.px,
                                        ),
                                        SizedBox(width: 8.px),
                                        Text(
                                          StringConstants.selectImage,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontSize: 14.px,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                        ),
                                      ],
                                    ),
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
          ),
        );
      },
    );
  }
}
