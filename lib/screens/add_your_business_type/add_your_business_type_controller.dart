import 'package:debwouya_market/utils/api/api_key_constants.dart';
import 'package:debwouya_market/utils/api/api_methods.dart';
import 'package:debwouya_market/utils/navigation_methos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api/api_models/business_types_model.dart';
import '../../utils/common_widgets.dart';
import '../add_your_business_details/add_your_business_details_screen.dart';

class AddYourBusinessTypeController extends ChangeNotifier {
  List<BusinessTypesData> businessTypesData = [];
  bool inAsyncCall = true;
  int selectedType = 0;
  List<String> listOfTypesId = [];

  clickOnNextButton({required BuildContext context}) async {
    listOfTypesId.clear();
    businessTypesData.forEach(
      (element) {
        if (element.isSelected) {
          listOfTypesId.add(element.typeId.toString());
        }
      },
    );

    if (listOfTypesId.isNotEmpty) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(ApiKeyConstants.typeId, listOfTypesId.join(','));
      NavigationMethods.pushMethod(
        context: context,
        widget: const AddYourBusinessDetailsScreen(),
      );
    } else {
      CommonWidgets.toastView(context: context, title: 'Minimum one select');
    }
  }

  Future<void> initMethod({required BuildContext context}) async {
    BusinessTypesModel? businessTypesModel =
        await ApiMethods.businessTypes(context: context);
    if (businessTypesModel != null &&
        businessTypesModel.data != null &&
        businessTypesModel.data!.isNotEmpty) {
      businessTypesData = businessTypesModel.data!;
    }
    inAsyncCall = false;
    notifyListeners();
  }

  clickOnCard({required int index}) {
    businessTypesData[index].isSelected = !businessTypesData[index].isSelected;
    selectedType = index;
    notifyListeners();
  }
}
