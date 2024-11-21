import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_methods.dart';
import '../../../utils/common_widgets.dart';
import '../../../utils/constants/icons_constant.dart';
import 'product_detail_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    var productDetailController =
        Provider.of<ProductDetailController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailController>(
      builder: (context, controller, child) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              gradient:
                  CommonMethods.commonLinearGradientView(context: context),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Price',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        ),
                        SizedBox(height: 4.px),
                        Text(
                          'RS. 239.00',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 16.px,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        ),
                      ],
                    ),
                    CommonWidgets.commonElevatedButton(
                      wantContentSizeButton: true,
                      text: 'Add to Bag',
                      buttonColor: Colors.black45,
                      onPressed: () =>
                          controller.clickOnAddToBag(context: context),
                      context: context,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  CommonWidgets.imageView(
                    image:
                        'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2.4,
                    fit: BoxFit.cover,
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.px, vertical: 10.px),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CommonMethods.appIconsReal(
                          assetName: IconConstants.icBack,
                          height: 34.px,
                          width: 34.px,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Boult Audio W20\nBluetooth Headset',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(height: 10.px),
                    Row(
                      children: [
                        Text(
                          '100+ viewed in past month',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 12.px),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.px),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'RS. 239.00',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 16.px),
                        ),
                        SizedBox(width: 2.px),
                        Text(
                          'RS. 420.00',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                  fontSize: 10.px,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor:
                                      Theme.of(context).colorScheme.surface),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.px),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. In vitae habitasse lacus in mauris. Proin pellentesque enim eu fermentum in eget sed congue est. Nulla sed faucibus quisque id dui arcu non cursus aliquet purus suspendisse.',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 12.px),
                    ),
                    SizedBox(height: 10.px),
                    Text(
                      'Color',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 16.px),
                    ),
                    SizedBox(height: 10.px),
                    SizedBox(
                      height: 20.px,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: 20.px,
                              width: 20.px,
                              decoration: BoxDecoration(
                                color: Color(
                                  Random().nextInt(0xff000000),
                                ),
                                borderRadius: BorderRadius.circular(10.px),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.px),
                  ],
                ),
              ),
              SizedBox(height: 10.px),
            ],
          ),
        );
      },
    );
  }
}
