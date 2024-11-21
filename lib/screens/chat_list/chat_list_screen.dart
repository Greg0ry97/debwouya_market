import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_widgets.dart';
import '../../utils/constants/icons_constant.dart';
import '../../utils/constants/image_constants.dart';
import '../../utils/constants/string_constants.dart';
import 'chat_list_controller.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  void initState() {
    super.initState();
    var chatListController =
        Provider.of<ChatListController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatListController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              title: StringConstants.chats, context: context,wantBackButton: false),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.searchController,
                      borderRadius: 15.px,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.2),
                      hintText: StringConstants.search,
                      //prefixIcon: IconConstants.icSearch,
                      context: context,
                    ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => controller.clickOnListTile(
                        context: context, index: index),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20.px),
                      child: Image.asset(
                        ImageConstants.imageLogoSplash,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      'Jenny Wilson',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 16.px),
                    ),
                    subtitle: Text(
                      'Have you spoken to the delivery...',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 14.px),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "08:00am",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 14.px),
                        ),
                        Container(
                          height: 20.px,
                          width: 20.px,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.px),
                              color: Theme.of(context).primaryColor),
                          child: Center(
                            child: Text(
                              "2",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 10.px,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.px),
            ],
          ),
        );
      },
    );
  }
}
