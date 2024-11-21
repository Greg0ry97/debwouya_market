import 'dart:io';

import 'package:debwouya_market/utils/navigation_methos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/api/api_key_constants.dart';
import '../../utils/api/api_methods.dart';
import '../../utils/api/api_models/user_model.dart';
import '../../utils/common_widgets.dart';

class AddProductsController extends ChangeNotifier {
  bool inAsyncCall = false;

  Map<String, dynamic> bodyParams = {};
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<File> selectedImages = [];

  clickOnSubmitButton({required BuildContext context}) async {
    if (productNameController.text.trim().isNotEmpty &&
        priceController.text.trim().isNotEmpty &&
        stockController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        selectedImages.isNotEmpty) {
      inAsyncCall = true;
      notifyListeners();
      bodyParams = {
        ApiKeyConstants.productName: productNameController.text,
        ApiKeyConstants.productPrice: priceController.text,
        ApiKeyConstants.productStock: stockController.text,
        ApiKeyConstants.productDescription: descriptionController.text,
      };
      UserModel? userModel = await ApiMethods.productsCreate(
        context: context,
        bodyParams: bodyParams,
        imageKey: ApiKeyConstants.images,
        images: selectedImages,
      );
      if (userModel != null &&
          userModel.status != null &&
          userModel.status!.isNotEmpty &&
          userModel.status != '0') {
        productNameController.clear();
        priceController.clear();
        stockController.clear();
        descriptionController.clear();
        selectedImages.clear();
        NavigationMethods.popMethod(context: context);
      }
    } else {
      CommonWidgets.toastView(context: context, title: 'All field required!');
    }
    inAsyncCall = false;
    notifyListeners();
  }

  Future<void> clickOnSelectImage({required BuildContext context}) async {
    selectedImages.clear();
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      if (images.length + selectedImages.length > 10) {
        CommonWidgets.toastView(
            context: context, title: 'You can only select up to 10 images.');
      } else {
        selectedImages.addAll(images.map((image) => File(image.path)).toList());
        notifyListeners();
      }
    }
  }
}
