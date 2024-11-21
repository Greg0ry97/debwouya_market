import 'package:debwouya_market/screens/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/navigation_methos.dart';

class ChatListController extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  clickOnListTile({required BuildContext context,required int index}) {
    NavigationMethods.pushMethod(
        context: context, widget: const ChatScreen());
  }
}
