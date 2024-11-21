import 'package:flutter/material.dart';

class NavigationMethods {
  static pushMethod({required BuildContext context, required Widget widget}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static pushReplacementMethod(
      {required BuildContext context, required Widget widget}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static pushAndRemoveUntilMethod(
      {required BuildContext context, required Widget widget}) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  static popMethod({required BuildContext context}) {
    Navigator.pop(context);
  }
}
