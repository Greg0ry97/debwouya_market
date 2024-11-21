import 'package:debwouya_market/screens/otp/otp_screen.dart';
import 'package:debwouya_market/utils/navigation_methos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/api/api_key_constants.dart';
import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/user_model.dart';
import '../../utils/common_widgets.dart';
import '../create_new_password/create_new_password_controller.dart';
import '../otp/otp_controller.dart';

class PasswordResetController extends ChangeNotifier {
  bool inAsyncCall = false;

  TextEditingController emailAddressController = TextEditingController();

  Map<String, dynamic> bodyParams = {};

  clickOnSendButton({required BuildContext context}) async {
    if (emailAddressController.text.trim().isNotEmpty) {
      inAsyncCall = true;
      notifyListeners();
      bodyParams = {
        ApiKeyConstants.email: emailAddressController.text,
      };
      UserModel? userModel = await ApiMethods.sendForgotPasswordOtp(
        context: context,
        bodyParams: bodyParams,
      );
      if (userModel != null &&
          userModel.status != null &&
          userModel.status != '0') {
        var otpController = Provider.of<OtpController>(context, listen: false);
        otpController.email = emailAddressController.text;
        var createNewPasswordController = Provider.of<CreateNewPasswordController>(context, listen: false);
        createNewPasswordController.email = emailAddressController.text;
        notifyListeners();
        NavigationMethods.pushMethod(
            context: context, widget: const OtpScreen());
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
