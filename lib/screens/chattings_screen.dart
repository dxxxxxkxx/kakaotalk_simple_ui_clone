import 'package:flutter/material.dart';

import '../components/chatting_list_component.dart';
import '../data/chatting.dart';
import 'main_screen.dart';

class ChattingsScreen extends StatelessWidget {
  final Map<String, List<Chatting>> _chattingMap = {};
  final bool chattingsUnread;
  final bool openChattingsUnread;

  ChattingsScreen({
    required List<Chatting> chattings,
    required List<Chatting> openChattings,
    required this.chattingsUnread,
    required this.openChattingsUnread,
    Key? key,
  }) : super(key: key) {
    _chattingMap.addAll({'채팅': chattings, '오픈채팅': openChattings});
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

  Widget _setTabBarView({required List<Chatting> tabBarItem}) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      itemCount: tabBarItem.length,
      itemBuilder: (context, index) =>
          ChattingListComponent(chatting: tabBarItem[index]),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 28.0),
    );
  }

  Widget _setIconButton({required Widget icon}) {
    return IconButton(
      onPressed: () {},
      visualDensity: const VisualDensity(horizontal: -4.0),
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: TabBar(
            isScrollable: true,
            indicator: const BoxDecoration(),
            unselectedLabelColor: greyColor,
            tabs: [
              _setTap(
                tabName: _chattingMap.keys.elementAt(0),
                unread: chattingsUnread,
              ),
              _setTap(
                tabName: _chattingMap.keys.elementAt(1),
                unread: openChattingsUnread,
              )
            ],
          ),
          actions: [
            _setIconButton(icon: const Icon(Icons.search)),
            _setIconButton(icon: const Icon(Icons.chat_outlined)),
            _setIconButton(icon: const Icon(Icons.music_note_outlined)),
            _setIconButton(icon: const Icon(Icons.settings_outlined))
          ],
        ),
        body: TabBarView(
          children: [
            _setTabBarView(tabBarItem: _chattingMap.values.elementAt(0)),
            _setTabBarView(tabBarItem: _chattingMap.values.elementAt(1))
          ],
        ),
      ),
    );
  }
}
