import 'package:debwouya_market/screens/create_new_password/create_new_password_screen.dart';
import 'package:debwouya_market/utils/navigation_methos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailController extends ChangeNotifier {
  TextEditingController pin = TextEditingController();

  clickOnSubmitButton({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const CreateNewPasswordScreen());
  }
}
