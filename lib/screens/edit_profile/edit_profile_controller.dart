import 'dart:io';

import 'package:debwouya_market/screens/home/home_controller.dart';
import 'package:debwouya_market/screens/profile/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
import '../user_side_screens/user_home/user_home_controller.dart';
import '../user_side_screens/user_profile/user_profile_controller.dart';

class EditProfileController extends ChangeNotifier {
  DateTime? dateTime;

  Map<String, dynamic> params = {};

  SharedPreferences? sp;

  UserData? userData;

  File? image;

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

  clickSaveButton({required BuildContext context}) async {
    if (fullNameController.text.trim().isNotEmpty) {
      inAsyncCall = true;
      notifyListeners();
      UserModel? userModel = await ApiMethods.updateProfile(
          image: image,
          imageKey: ApiKeyConstants.image,
          context: context,
          bodyParams: {
            ApiKeyConstants.userName: fullNameController.text,
          });
      if (userModel != null &&
          userModel.status != null &&
          userModel.status != '0') {
        await getProfileApi(context: context);
        NavigationMethods.popMethod(context: context);
        notifyListeners();
      } else {
        if (userModel != null &&
            userModel.message != null &&
            userModel.message!.isNotEmpty) {
          CommonWidgets.toastView(context: context, title: userModel.message!);
        } else {
          CommonWidgets.toastView(
              context: context, title: "Something went wrong");
        }
      }
      inAsyncCall = false;
      notifyListeners();
    } else {
      CommonWidgets.toastView(context: context, title: 'All fields required!');
    }
  }

  bool inAsyncCall = false;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();

  Future<void> initMethod({required BuildContext context}) async {
    sp = await SharedPreferences.getInstance();
    await getProfileApi(context: context);
  }

  getProfileApi({required BuildContext context}) async {
    inAsyncCall = true;
    notifyListeners();
    UserModel? userModel = await ApiMethods.getProfile(context: context);
    if (userModel != null && userModel.data != null) {
      userData = userModel.data!;
      fullNameController.text = userData?.userName ?? '';
      emailAddressController.text = userData?.email ?? '';
      sp?.setString(ApiKeyConstants.image, userData?.image ?? '');
      sp?.setString(ApiKeyConstants.userName, userData?.userName ?? '');
      sp?.setString(ApiKeyConstants.siretNumber, userData?.siretNumber ?? '');
      sp?.setString(ApiKeyConstants.email, userData?.email ?? '');
      sp?.setString(ApiKeyConstants.mobile, userData?.mobile ?? '');
      sp?.setString(ApiKeyConstants.countryCode, userData?.countryCode ?? '');
      notifyListeners();
      Provider.of<ProfileController>(context, listen: false)
          .initMethod(context: context);
      Provider.of<HomeController>(context, listen: false)
          .getProfileApi(context: context);
      Provider.of<UserProfileController>(context, listen: false)
          .initMethod(context: context);
      Provider.of<UserHomeController>(context, listen: false)
          .getProfileApi(context: context);
    } else {
      CommonWidgets.toastView(context: context, title: "Something went wrong");
    }
    inAsyncCall = false;
    notifyListeners();
  }
}
