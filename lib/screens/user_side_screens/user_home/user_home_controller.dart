import 'package:debwouya_market/screens/add_products/add_products_screen.dart';
import 'package:debwouya_market/screens/order/order_screen.dart';
import 'package:debwouya_market/screens/user_side_screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/api/api_key_constants.dart';
import '../../../utils/api/api_methods.dart';
import '../../../utils/api/api_models/user_model.dart';
import '../../../utils/common_widgets.dart';
import '../../../utils/navigation_methos.dart';

class UserHomeController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  bool inAsyncCall = true;
  UserData? userData;
  SharedPreferences? sp;

  String? name;

  String? email;

  String? image;

  clickOnAddButton({required BuildContext context}) {
    NavigationMethods.pushMethod(context: context, widget: AddProductsScreen());
  }

  clickOnCard({required BuildContext context}) {
    NavigationMethods.pushMethod(context: context, widget: OrderScreen());
  }

  clickOnSearchField({required BuildContext context}) {
    NavigationMethods.pushMethod(context: context, widget: SearchScreen());
  }

  getProfileApi({required BuildContext context}) async {
    inAsyncCall = true;
    UserModel? userModel = await ApiMethods.getProfile(
      context: context,
    );
    if (userModel != null && userModel.data != null) {
      userData = userModel.data!;
      sp = await SharedPreferences.getInstance();
      sp?.setString(ApiKeyConstants.image, userData?.image ?? '');
      sp?.setString(ApiKeyConstants.userName, userData?.userName ?? '');
      sp?.setString(ApiKeyConstants.siretNumber, userData?.siretNumber ?? '');
      sp?.setString(ApiKeyConstants.email, userData?.email ?? '');
      sp?.setString(ApiKeyConstants.mobile, userData?.mobile ?? '');
      sp?.setString(ApiKeyConstants.countryCode, userData?.countryCode ?? '');
      sp = await SharedPreferences.getInstance();
      name = sp?.getString(ApiKeyConstants.userName);
      email = sp?.getString(ApiKeyConstants.email);
      image = sp?.getString(ApiKeyConstants.image);
      notifyListeners();
      notifyListeners();
    } else {
      CommonWidgets.toastView(context: context, title: "Something went wrong");
    }
    inAsyncCall = false;
    notifyListeners();
  }
}
