import 'package:flutter/material.dart';

import '../components/chatting_list_component.dart';
import '../data/chatting.dart';
import 'main_screen.dart';

class ChattingsScreen extends StatelessWidget {
  final List<Chatting> chattings;

  const ChattingsScreen({required this.chattings, Key? key}) : super(key: key);

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
          title: const TabBar(
            isScrollable: true,
            indicator: BoxDecoration(),
            unselectedLabelColor: greyColor,
            tabs: [
              Tab(
                child: Text(
                  '채팅',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  '오픈채팅',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
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
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              itemCount: chattings.length,
              itemBuilder: (context, index) =>
                  ChattingListComponent(chatting: chattings[index]),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 28.0),
            ),
            const Center(
              child: Text('오픈채팅', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
