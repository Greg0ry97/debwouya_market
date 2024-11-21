import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_methods.dart';
import 'details_controller.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    var detailController =
        Provider.of<DetailController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.detail),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.px),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonWidgets.imageView(
                            image:
                                'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                            width: 100.px,
                            height: 100.px,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(50.px),
                          ),
                          SizedBox(width: 10.px),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonMethods.textGradient(
                                  text: 'Ruben Vaccaro',
                                  context: context,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 20.px,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                SizedBox(height: 10.px),
                                Text(
                                  'iamjohndukarshi@gmail.com',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10.px),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.px),
                    Text(
                      'Shipping Address',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontSize: 18.px),
                    ),
                    SizedBox(height: 10.px),
                    Text(
                      '''Home- 21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria''',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 14.px),
                    ),
                    SizedBox(height: 20.px),
                    Text(
                      'Payment Mode',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontSize: 18.px),
                    ),
                    SizedBox(height: 10.px),
                    Text(
                      'Cash On Delivery',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 14.px),
                    ),
                    SizedBox(height: 20.px),
                    Text(
                      'Ordered items',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontSize: 18.px),
                    ),
                    SizedBox(height: 10.px),
                    Text(
                      'John Ordered 4 Items',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 14.px),
                    ),
                    SizedBox(height: 34.px),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
