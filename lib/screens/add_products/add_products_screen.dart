import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/image_constants.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:debwouya_market/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'add_products_controller.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  @override
  void initState() {
    super.initState();
    var addProductsController =
        Provider.of<AddProductsController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductsController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(
                context: context, title: StringConstants.addProducts),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(24.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: () =>
                    controller.clickOnSubmitButton(context: context),
                text: StringConstants.submit,
                context: context,
              ),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          controller: controller.productNameController,
                          context: context,
                          hintText: StringConstants.productName,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          controller: controller.priceController,
                          context: context,
                          hintText: StringConstants.price,
                          keyboardType: TextInputType.number
                        ),SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          controller: controller.stockController,
                          context: context,
                          hintText: StringConstants.stock,
                          keyboardType: TextInputType.number
                        ),
                        SizedBox(height: 20.px),
                        Text(
                          'Photo',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 20.px),
                        ),
                        SizedBox(height: 20.px),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.selectedImages.isNotEmpty
                              ? controller.selectedImages.length
                              : 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => controller.clickOnSelectImage(context: context),
                              child: controller.selectedImages.isNotEmpty
                                  ? Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(8.px),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.px),
                                        child: Image.file(
                                          controller.selectedImages[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Image.asset(ImageConstants.imageAddPhoto),
                            );
                          },
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          controller: controller.descriptionController,
                          context: context,
                          maxLength: 5,
                          hintText: StringConstants.description,
                        ),
                        SizedBox(height: 20.px),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
