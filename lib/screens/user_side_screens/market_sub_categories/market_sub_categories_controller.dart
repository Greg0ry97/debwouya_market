import 'package:flutter/material.dart';

import '../../../utils/navigation_methos.dart';
import '../product_detail/product_detail_screen.dart';

class MarketSubCategoriesController extends ChangeNotifier {
  clickOnCard({required int index, required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const ProductDetailScreen());
  }
}
