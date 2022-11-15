import 'package:flutter/material.dart';

import '../components/chat_list_component.dart';
import '../components/my_app_bar.dart';
import '../data/chat.dart';

class ChatsScreen extends StatelessWidget {
  final List<String> tabBarName = ['채팅', '오픈채팅'];

  final bool hasChatsUnread;
  final bool hasOpenChatsUnread;

  final Map<String, List<Chat>> _chatMap = {};

  ChatsScreen(
      {required List<Chat> chats,
      required List<Chat> openChats,
      required this.hasChatsUnread,
      required this.hasOpenChatsUnread,
      Key? key})
      : super(key: key) {
    _chatMap.addAll({
      tabBarName[0]: chats,
      tabBarName[1]: openChats,
    });
  }

  Widget _setTap({required String tabName, required bool unread}) {
    return Tab(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tabName,
            style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          if (unread)
            Container(
              margin: const EdgeInsets.only(left: 4.0, top: 3.5),
              width: 5.0,
              height: 5.0,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            )
        ],
      ),
    );
  }

  Widget _setTabBarView({required List<Chat> tabBarItem}) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      itemCount: tabBarItem.length,
      itemBuilder: (context, index) =>
          ChatListComponent(chat: tabBarItem[index]),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 28.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: MyAppBar(
          tabs: [
            _setTap(
              tabName: _chatMap.keys.elementAt(0),
              unread: hasChatsUnread,
            ),
            _setTap(
              tabName: _chatMap.keys.elementAt(1),
              unread: hasOpenChatsUnread,
            )
          ],
        ),
        body: TabBarView(
          children: [
            _setTabBarView(tabBarItem: _chatMap.values.elementAt(0)),
            _setTabBarView(tabBarItem: _chatMap.values.elementAt(1))
          ],
        ),
      ),
    );
  }
}
