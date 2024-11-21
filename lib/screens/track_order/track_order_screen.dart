import 'package:debwouya_market/utils/common_methods.dart';
import 'package:debwouya_market/utils/constants/icons_constant.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import '../../utils/constants/image_constants.dart';
import 'track_order_controller.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  void initState() {
    super.initState();
    var trackOrderController =
        Provider.of<TrackOrderController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrackOrderController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
            title: StringConstants.myOrders,
            context: context,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          shadowColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          surfaceTintColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: Padding(
                            padding: EdgeInsets.all(4.px),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Image.asset(
                                      ImageConstants.imageLogoSplash,
                                      height: 40.px,
                                      width: 40.px,
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ID: 546414 4002',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(fontSize: 10.px),
                                        ),
                                        Text(
                                          'Jaylon Lipshutz',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 14.px,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    trailing: Text(
                                      '\$149',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 18.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  ),
                                  SizedBox(height: 10.px),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '1 x Butter Chicken',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(fontSize: 14.px),
                                      ),
                                      Text(
                                        '1 x Butter Chicken',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(fontSize: 14.px),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.px),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.px),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface
                                              .withOpacity(.4.px),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.px),
                                          child: Row(
                                            children: [
                                              Text(
                                                '+ 20 Mins -',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                        fontSize: 14.px,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'This is Special Delivery',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 14.px,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.px),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CommonMethods.appIcons(context: context,
                                          assetName: IconConstants.icCall,
                                          width: 60.px,
                                          height: 60.px),
                                      SizedBox(width: 10.px),
                                      Expanded(
                                        child:
                                            CommonWidgets.commonElevatedButton(
                                                text: StringConstants.track,
                                                onPressed: () =>
                                                    controller.clickOnTrack(
                                                        context: context),
                                                context: context),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.px),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 30.px),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  cardWidget({
    required String title,
    required String subTitle,
  }) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(4.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 10.px, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 6.px),
            Text(
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 10.px),
            ),
          ],
        ),
      ),
    );
  }
}
