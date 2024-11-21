import 'package:debwouya_market/screens/setting/setting_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/progress_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
    var settingController =
        Provider.of<SettingController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingController>(
      builder: (context, controller, child) {
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall,
          child: Scaffold(
            appBar: CommonWidgets.appBar(
              title: StringConstants.notifications,
              context: context,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: ListView(
                children: [
                  SizedBox(height: 10.px),
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    trailing: CupertinoSwitch(
                      activeColor: Theme.of(context).primaryColor,
                      value: controller.switchValue,
                      onChanged: (bool value) =>
                          controller.clickOnSwitchButton(),
                    ),
                    title: Text(
                      'Booking updates',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.px, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "We'll remind you about all upcoming trips, payments, and cancellations.",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 14.px),
                    ),
                  ),
                  SizedBox(height: 10.px),
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    trailing: CupertinoSwitch(
                      activeColor: Theme.of(context).primaryColor,
                      value: controller.switchValue,
                      onChanged: (bool value) =>
                          controller.clickOnSwitchButton(),
                    ),
                    title: Text(
                      'Reviews',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.px, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "Receive reminders to leave a review to help other travellers",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 14.px),
                    ),
                  ),
                  SizedBox(height: 10.px),
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    trailing: CupertinoSwitch(
                      activeColor: Theme.of(context).primaryColor,
                      value: controller.switchValue,
                      onChanged: (bool value) =>
                          controller.clickOnSwitchButton(),
                    ),
                    title: Text(
                      'Activities & Attractions',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.px, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "Receive important messages and updates from your tour operator",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 14.px),
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
