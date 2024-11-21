import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_widgets.dart';
import 'market_controller.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  void initState() {
    super.initState();
    var marketController =
        Provider.of<MarketController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.market),
          body: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.px),
                  Center(
                    child: Wrap(
                      children: List.generate(
                        10,
                        (index) => GestureDetector(
                          onTap: () => controller.clickOnCard(
                              index: index, context: context),
                          child: Padding(
                            padding: EdgeInsets.all(10.px),
                            child: Column(
                              children: [
                                CommonWidgets.imageView(
                                  image:
                                      'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                                  width: 50.px,
                                  height: 50.px,
                                  fit: BoxFit.cover,
                                  borderRadius: BorderRadius.circular(25.px),
                                ),
                                SizedBox(height: 8.px),
                                Text(
                                  'Cloths',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                        fontWeight: FontWeight.w400,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
