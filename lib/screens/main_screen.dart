import 'package:flutter/material.dart';

import '../components/bottom_navigation_bar_items.dart';
import '../data/chat.dart';
import '../data/constants.dart';
import '../repositories/chat_repository.dart';
import 'chats_screen.dart';
import 'friends_screen.dart';
import 'more_screen.dart';
import 'shopping_screen.dart';
import 'view_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Chat> _chats = ChatRepository().chats;
  final List<Chat> _openChats = ChatRepository().openChats;

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    int chatsUnreadCnt = 0;
    int openChatsUnreadCnt = 0;

    for (var chats in _chats) {
      chatsUnreadCnt += chats.unreadCnt;
    }

    for (var openChats in _openChats) {
      openChatsUnreadCnt += openChats.unreadCnt;
    }

    final int unreadCnt = chatsUnreadCnt + openChatsUnreadCnt;

    final List<Widget> screens = [
      const FriendsScreen(),
      ChatsScreen(
        chats: _chats,
        openChats: _openChats,
        hasChatsUnread: chatsUnreadCnt > 0 ? true : false,
        hasOpenChatsUnread: openChatsUnreadCnt > 0 ? true : false,
      ),
      const ViewScreen(),
      const ShoppingScreen(),
      const MoreScreen()
    ];

    return SafeArea(
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.black,
          iconSize: 32.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: greyColor,
          items: BottomNavigationBarItems(unreadCnt: unreadCnt)
              .setBottomNavigationBarItems(),
        ),
      ),
    );
  }
}
