import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_methods.dart';
import '../../utils/common_widgets.dart';
import '../../utils/constants/icons_constant.dart';
import '../../utils/constants/string_constants.dart';
import 'chat_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    var chatController = Provider.of<ChatController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatController>(
      builder: (context, controller, child) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              CommonWidgets.commonTextFieldForLoginSignUP(
                context: context,
                controller: controller.textController,
                borderRadius: 30.px,
                fillColor:
                    Theme.of(context).colorScheme.onSecondary.withOpacity(.2),
                hintText: StringConstants.typeHere,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.px),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonMethods.appIcons(context: context,
                        assetName: IconConstants.icSend,
                        height: 34.px,
                        width: 34.px,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          appBar:
              CommonWidgets.appBar(title: 'Daniel Austin', context: context),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    Center(
                      child: Text(
                        'Today 01:25 PM',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.px,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: Container(
                        padding: EdgeInsets.all(8.px),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.px),
                        ),
                        child: Text(
                          'How can I assist you?',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Container(
                          padding: EdgeInsets.all(8.px),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.2),
                            borderRadius: BorderRadius.circular(10.px),
                          ),
                          child: Text(
                            'I would like to book a personal training session.',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
