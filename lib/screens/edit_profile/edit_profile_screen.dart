import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_methods.dart';
import '../../utils/common_widgets.dart';
import '../../utils/constants/icons_constant.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/progress_bar.dart';
import 'edit_profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    super.initState();
    var profileController =
        Provider.of<EditProfileController>(context, listen: false);
    profileController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(
                context: context, title: StringConstants.profile),
            extendBody: true,
            extendBodyBehindAppBar: true,
            floatingActionButton: Padding(
              padding: EdgeInsets.all(24.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickSaveButton(context: context),
                text: StringConstants.save,
                context: context,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: ListView(
                children: [
                  SizedBox(height: 40.px),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        (controller.image != null)
                            ? ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.px),
                                ),
                                child: Image.file(
                                  height: 100.px,
                                  width: 100.px,
                                  fit: BoxFit.cover,
                                  File(
                                    controller.image?.path ?? '',
                                  ),
                                ),
                              )
                            : (controller.userData != null &&
                                    controller.userData!.image != null &&
                                    controller.userData!.image!.isNotEmpty)
                                ? CommonWidgets.imageView(
                                    image: controller.userData!.image!,
                                    height: 100.px,
                                    width: 100.px,
                                    borderRadius: BorderRadius.circular(50.px),
                                    fit: BoxFit.cover,
                                  )
                                : CommonWidgets.imageView(
                                    image:
                                        'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                                    width: 100.px,
                                    height: 100.px,
                                    fit: BoxFit.cover,
                                    borderRadius: BorderRadius.circular(50.px),
                                  ),
                        InkWell(
                          onTap: () =>
                              controller.showAlertDialog(context: context),
                          child: CommonMethods.appIconsReal(
                            assetName: IconConstants.icEdit,
                            height: 30.px,
                            width: 30.px,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    context: context,
                    controller: controller.fullNameController,
                    hintText: StringConstants.fullName,
                    prefixIcon: IconConstants.icProfile,
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    context: context,
                    hintText: StringConstants.emailAddress,
                    controller: controller.emailAddressController,
                    prefixIcon: IconConstants.icEmail,
                    readOnly: true
                  ),
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
