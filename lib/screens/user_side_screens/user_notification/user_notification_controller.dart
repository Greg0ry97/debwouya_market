import 'package:flutter/material.dart';

class UserNotificationController extends ChangeNotifier {
  bool switchValue = false;
  bool inAsyncCall = false;

  clickOnSwitchButton() {
    switchValue = !switchValue;
    notifyListeners();
  }
}
