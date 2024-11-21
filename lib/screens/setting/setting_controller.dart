import 'package:flutter/material.dart';

class SettingController extends ChangeNotifier {
  bool switchValue = false;
  bool inAsyncCall = false;

  clickOnSwitchButton() {
    switchValue = !switchValue;
    notifyListeners();
  }
}
