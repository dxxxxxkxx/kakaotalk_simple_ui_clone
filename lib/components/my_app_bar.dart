import 'package:flutter/material.dart';

import '../data/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Icon> _icons = const [
    Icon(Icons.search),
    Icon(Icons.chat_outlined),
    Icon(Icons.music_note_outlined),
    Icon(Icons.settings_outlined)
  ];

  final List<Widget> tabs;

  const MyAppBar({required this.tabs, Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _setIconButton({required Widget icon}) {
    return IconButton(
      onPressed: () {},
      visualDensity: const VisualDensity(horizontal: -4.0),
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.black,
      title: TabBar(
        isScrollable: true,
        indicator: const BoxDecoration(),
        unselectedLabelColor: greyColor,
        tabs: tabs,
      ),
      actions: [
        _setIconButton(icon: _icons[0]),
        _setIconButton(icon: _icons[1]),
        _setIconButton(icon: _icons[2]),
        _setIconButton(icon: _icons[3])
      ],
    );
  }
}
