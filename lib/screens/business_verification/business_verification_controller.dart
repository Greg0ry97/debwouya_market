import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/alert_dialog_view.dart';
import '../../utils/api/api_key_constants.dart';
import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/user_model.dart';
import '../../utils/common_widgets.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/image_pick_and_crop.dart';
import '../../utils/navigation_methos.dart';
import '../bottom_nav_bar/bottom_nav_bar_screen.dart';

class BusinessVerificationController extends ChangeNotifier {
  File? imageForLicence;
  File? imageForTax;

  bool inAsyncCall = false;

  Map<String, dynamic> bodyParams = {};
  Map<String, File> imageMap = {};

  clickOnSubmitButton({required BuildContext context}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? typeId = sp.getString(ApiKeyConstants.typeId);
    String? name = sp.getString(ApiKeyConstants.name);
    String? location = sp.getString(ApiKeyConstants.location);
    String? budget = sp.getString(ApiKeyConstants.budget);
    String? description = sp.getString(ApiKeyConstants.description);
    String? logo = sp.getString(ApiKeyConstants.logo);
    if (imageForLicence != null && imageForTax != null) {
      inAsyncCall = true;
      notifyListeners();
      bodyParams = {
        ApiKeyConstants.typeId: typeId,
        ApiKeyConstants.name: name,
        ApiKeyConstants.location: location,
        ApiKeyConstants.budget: budget,
        ApiKeyConstants.description: description,
      };
      imageMap = {
        ApiKeyConstants.logo: File(logo ?? ''),
        ApiKeyConstants.license: imageForLicence!,
        ApiKeyConstants.tax: imageForTax!,
      };
      UserModel? userModel = await ApiMethods.createBusiness(
        context: context,
        imageMap: imageMap,
        bodyParams: bodyParams,
      );
      if (userModel != null &&
          userModel.data != null &&
          userModel.data!.accessToken != null &&
          userModel.data!.accessToken!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.token, userModel.data!.accessToken!);
      }
      if (userModel != null &&
          userModel.data != null &&
          userModel.data!.dependency != null &&
          userModel.data!.dependency!.isNotEmpty &&
          userModel.data!.dependency == '1') {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.dependency, userModel.data!.dependency!);
        NavigationMethods.pushMethod(
            context: context, widget: const BottomNavBarScreen());
      }
    } else {
      CommonWidgets.toastView(context: context, title: 'Both image required!');
    }
    inAsyncCall = false;
    notifyListeners();
  }

  clickOnAddLogo({required BuildContext context, required String type}) {
    showAlertDialog(context: context, type: type);
  }

  void showAlertDialog({required BuildContext context, required String type}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(context: context),
              onPressed: () =>
                  clickCameraTextButtonView(context: context, type: type),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(context: context),
              onPressed: () =>
                  clickGalleryTextButtonView(context: context, type: type),
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
      {required BuildContext context, required String type}) async {
    pickCamera(context: context, type: type);
    NavigationMethods.popMethod(context: context);
  }

  Future<void> clickGalleryTextButtonView(
      {required BuildContext context, required String type}) async {
    pickGallery(context: context, type: type);
    NavigationMethods.popMethod(context: context);
  }

  Future<void> pickCamera(
      {required BuildContext context, required String type}) async {
    if (type == StringConstants.businessLicense) {
      imageForLicence = await ImagePickerAndCropper.pickImage(
        context: context,
        wantCropper: true,
        color: Theme.of(context).primaryColor,
      );
      notifyListeners();
    } else {
      imageForTax = await ImagePickerAndCropper.pickImage(
        context: context,
        wantCropper: true,
        color: Theme.of(context).primaryColor,
      );
      notifyListeners();
    }
  }

  Future<void> pickGallery(
      {required BuildContext context, required String type}) async {
    if (type == StringConstants.businessLicense) {
      imageForLicence = await ImagePickerAndCropper.pickImage(
          context: context,
          wantCropper: true,
          color: Theme.of(context).primaryColor,
          pickImageFromGallery: true);
      notifyListeners();
    } else {
      imageForTax = await ImagePickerAndCropper.pickImage(
          context: context,
          wantCropper: true,
          color: Theme.of(context).primaryColor,
          pickImageFromGallery: true);
      notifyListeners();
    }
  }
}
