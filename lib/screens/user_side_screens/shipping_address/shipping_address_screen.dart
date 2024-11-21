import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_methods.dart';
import '../../../utils/common_widgets.dart';
import '../../../utils/constants/icons_constant.dart';
import 'shipping_address_controller.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  @override
  void initState() {
    super.initState();
    var shippingAddressController =
        Provider.of<ShippingAddressController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShippingAddressController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.shippingAddress),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.px),
            child: CommonWidgets.commonElevatedButton(
                text: 'Add', onPressed: () =>controller.clickOnAddButton(context: context), context: context),
          ),
          body: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20.px, vertical: 10.px),
                child: Card(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CommonMethods.appIcons(
                          context: context,
                          assetName: IconConstants.icHome,
                          width: 34.px,
                          height: 34.px,
                        ),
                        SizedBox(width: 10.px),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Home',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 14.px),
                              ),
                              SizedBox(height: 4.px),
                              Text(
                                'PV2M+H46, No.8, Residency Area, 200 Ro...',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontSize: 12.px),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.px),
                        CommonMethods.appIcons(
                          context: context,
                          assetName: IconConstants.icEdit,
                          width: 34.px,
                          height: 34.px,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
