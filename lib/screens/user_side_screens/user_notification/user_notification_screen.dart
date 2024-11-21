import 'package:debwouya_market/screens/user_side_screens/user_notification/user_notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_widgets.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/progress_bar.dart';

class UserNotificationScreen extends StatefulWidget {
  const UserNotificationScreen({super.key});

  @override
  State<UserNotificationScreen> createState() => _UserNotificationScreenState();
}

class _UserNotificationScreenState extends State<UserNotificationScreen> {
  @override
  void initState() {
    super.initState();
    var userNotificationController =
        Provider.of<UserNotificationController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserNotificationController>(
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
                      'General Notification',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.px, fontWeight: FontWeight.w600),
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
                      'Sound',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.px, fontWeight: FontWeight.w600),
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
                      'Vibrate',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.px, fontWeight: FontWeight.w600),
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
                      'App Updates',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.px, fontWeight: FontWeight.w600),
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
                      'New Tips Available',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.px, fontWeight: FontWeight.w600),
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
