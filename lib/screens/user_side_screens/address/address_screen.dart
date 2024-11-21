import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_methods.dart';
import '../../../utils/common_widgets.dart';
import '../../../utils/constants/icons_constant.dart';
import 'address_controller.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    var addressController =
        Provider.of<AddressController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.address),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.px),
            child: CommonWidgets.commonElevatedButton(
                text: 'Continue', onPressed: () =>controller.clickOnContinueButton(context: context), context: context),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.px, vertical: 10.px),
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
                          Column(
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
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.px),
                Image.asset('lib/assets/images/image_add_address.png')
              ],
            ),
          ),
        );
      },
    );
  }
}
