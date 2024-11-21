import 'package:flutter/material.dart';

import '../../utils/navigation_methos.dart';
import '../details/details_screen.dart';

class OrderController extends ChangeNotifier {

  clickOnAcceptButton({required BuildContext context}) {}

  clickOnDeclineButton({required BuildContext context}) {}

  clickOnDetail({required BuildContext context}) {
    NavigationMethods.pushMethod(context: context, widget: DetailScreen());
  }
}
