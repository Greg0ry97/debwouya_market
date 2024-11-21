import 'package:flutter/material.dart';
import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/my_products_model.dart';

class MyProductsController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  bool inAsyncCall = true;
  List<MyProductsData> myProductsData = [];


  initMethod({required BuildContext context}) async {
    MyProductsModel? myProductsModel = await ApiMethods.myProducts(context: context);
    if(myProductsModel!=null && myProductsModel.data!=null && myProductsModel.data!.isNotEmpty)
      {
        myProductsData = myProductsModel.data!;
        notifyListeners();
      }
    inAsyncCall = false;
    notifyListeners();
  }
}
