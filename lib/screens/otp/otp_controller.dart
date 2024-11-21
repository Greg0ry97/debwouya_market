import 'package:debwouya_market/screens/create_new_password/create_new_password_screen.dart';
import 'package:debwouya_market/utils/navigation_methos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/api/api_key_constants.dart';
import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/user_model.dart';
import '../../utils/common_widgets.dart';

class OtpController extends ChangeNotifier {
  TextEditingController pin = TextEditingController();
  String email = '';

  bool inAsyncCall = false;

  Map<String, dynamic> bodyParams = {};

  clickOnSubmitButton({required BuildContext context}) async {
    if (pin.text.trim().isNotEmpty && email.trim().isNotEmpty) {
      inAsyncCall = true;
      notifyListeners();
      bodyParams = {
        ApiKeyConstants.email: email,
        ApiKeyConstants.otp: pin.text,
      };
      UserModel? userModel = await ApiMethods.checkOtp(
        context: context,
        bodyParams: bodyParams,
      );
      if (userModel != null &&
          userModel.status != null &&
          userModel.status != '0') {
        notifyListeners();
        NavigationMethods.pushMethod(
            context: context, widget: const CreateNewPasswordScreen());
        if (userModel.message != null && userModel.message!.isNotEmpty) {
          CommonWidgets.toastView(
              context: context, title: userModel.message ?? '');
        }
      } else {
        if (userModel != null &&
            userModel.message != null &&
            userModel.message!.isNotEmpty) {
          CommonWidgets.toastView(
              context: context, title: userModel.message ?? '');
        }
      }
      inAsyncCall = false;
      notifyListeners();
    } else {
      CommonWidgets.toastView(context: context, title: 'All field required');
    }
  }
}
