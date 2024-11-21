import 'dart:io';

import 'package:debwouya_market/utils/navigation_methos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/alert_dialog_view.dart';
import '../../utils/api/api_key_constants.dart';
import '../../utils/common_widgets.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/image_pick_and_crop.dart';
import '../business_verification/business_verification_screen.dart';

class AddYourBusinessDetailsController extends ChangeNotifier {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? image;

  clickOnNextButton({required BuildContext context}) async {
    if (businessNameController.text.trim().isNotEmpty &&
        locationController.text.trim().isNotEmpty &&
        budgetController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(ApiKeyConstants.name, businessNameController.text);
      sp.setString(ApiKeyConstants.location, locationController.text);
      sp.setString(ApiKeyConstants.budget, budgetController.text);
      sp.setString(ApiKeyConstants.description, descriptionController.text);
      if (image != null) {
        sp.setString(ApiKeyConstants.logo, image?.path ?? '');
        NavigationMethods.pushMethod(
            context: context, widget: BusinessVerificationScreen());
      } else {
        CommonWidgets.toastView(
            context: context, title: 'Image field required!');
      }
    } else {
      CommonWidgets.toastView(context: context, title: 'All field required!');
    }
  }

  clickOnAddLogo({required BuildContext context}) {
    showAlertDialog(context: context);
  }

  void showAlertDialog({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(context: context),
              onPressed: () => clickCameraTextButtonView(context: context),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(context: context),
              onPressed: () => clickGalleryTextButtonView(context: context),
            ),
          ],
          title: selectImageTextView(context: context),
          content: contentTextView(context: context),
        );
      },
    );
  }

  Widget selectImageTextView({required BuildContext context}) => Text(
        StringConstants.selectImage,
        style: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 18.px),
      );

  Widget contentTextView({required BuildContext context}) => Text(
        StringConstants.chooseImageFromTheOptionsBelow,
        style:
            Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 14.px),
      );

  Widget cameraTextButtonView({required BuildContext context}) => Text(
        StringConstants.camera,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(fontSize: 14.px, color: Theme.of(context).primaryColor),
      );

  Widget galleryTextButtonView({required BuildContext context}) => Text(
        StringConstants.gallery,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(fontSize: 14.px, color: Theme.of(context).primaryColor),
      );

  Future<void> clickCameraTextButtonView(
      {required BuildContext context}) async {
    pickCamera(context: context);
    NavigationMethods.popMethod(context: context);
  }

  Future<void> clickGalleryTextButtonView(
      {required BuildContext context}) async {
    pickGallery(context: context);
    NavigationMethods.popMethod(context: context);
  }

  Future<void> pickCamera({required BuildContext context}) async {
    image = await ImagePickerAndCropper.pickImage(
      context: context,
      wantCropper: true,
      color: Theme.of(context).primaryColor,
    );
    notifyListeners();
  }

  Future<void> pickGallery({required BuildContext context}) async {
    image = await ImagePickerAndCropper.pickImage(
        context: context,
        wantCropper: true,
        color: Theme.of(context).primaryColor,
        pickImageFromGallery: true);
    notifyListeners();
  }
}
