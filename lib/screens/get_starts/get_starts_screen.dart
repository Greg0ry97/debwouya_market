import 'package:debwouya_market/utils/common_methods.dart';
import 'package:debwouya_market/utils/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import '../../utils/constants/image_constants.dart';
import '../../utils/constants/string_constants.dart';
import 'get_starts_controller.dart';

class GetStartsScreen extends StatefulWidget {
  const GetStartsScreen({super.key});

  @override
  State<GetStartsScreen> createState() => _GetStartsScreenState();
}

class _GetStartsScreenState extends State<GetStartsScreen> {
  @override
  void initState() {
    super.initState();
    var getStartsController =
        Provider.of<GetStartsController>(context, listen: false);
    //getStartsController.manage(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetStartsController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(ImageConstants.imageGetStarts),
              Padding(
                padding: EdgeInsets.all(24.px),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 30.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () =>
                          controller.clickOnBuyerButton(context: context),
                      text: StringConstants.buyer,
                      child: Row(
                        children: [
                          CommonMethods.appIconsReal(
                              assetName: IconConstants.icBuyer),
                          SizedBox(width: 10.px),
                          const Text(StringConstants.buyer),
                        ],
                      ),
                      context: context,
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnRegisteredSellerButton(
                          context: context),
                      text: StringConstants.registeredSeller,
                      child: Row(
                        children: [
                          CommonMethods.appIconsReal(
                              assetName: IconConstants.icSeller),
                          SizedBox(width: 10.px),
                          const Text(StringConstants.registeredSeller),
                        ],
                      ),
                      context: context,
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnUnRegisteredSellerButton(
                          context: context),
                      text: StringConstants.unRegisteredSeller,
                      child: Row(
                        children: [
                          CommonMethods.appIconsReal(
                              assetName: IconConstants.icSeller),
                          SizedBox(width: 10.px),
                          const Text(StringConstants.unRegisteredSeller),
                        ],
                      ),
                      context: context,
                    ),
                    SizedBox(height: 30.px),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
