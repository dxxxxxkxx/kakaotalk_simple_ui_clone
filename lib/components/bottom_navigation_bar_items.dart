import 'package:flutter/material.dart';

import 'unread_count_chip.dart';

class BottomNavigationBarItems {
  final Map<String, List<Widget>> _bottomNavigationBarItems = {
    '친구': const [Icon(Icons.person_outline), Icon(Icons.person)],
    '채팅': const [Icon(Icons.chat_bubble_outline), Icon(Icons.chat_bubble)],
    '뷰': const [
      Icon(Icons.remove_red_eye_outlined),
      Icon(Icons.remove_red_eye)
    ],
    '쇼핑': const [Icon(Icons.shopping_bag_outlined), Icon(Icons.shopping_bag)],
    '더보기': const [Icon(Icons.more_horiz_outlined), Icon(Icons.more_horiz)]
  };

  final int unreadCnt;

  BottomNavigationBarItems({required this.unreadCnt});

  Widget _setChipIcon({required Widget icon, required Widget chip}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        icon,
        Positioned(
          top: -8.0,
          right: -12.0,
          child: SizedBox(height: 18.0, child: FittedBox(child: chip)),
        )
      ],
    );
  }

  List<BottomNavigationBarItem> setBottomNavigationBarItems() {
    BottomNavigationBarItem? bottomNavigationBarItem;

    if (unreadCnt > 0) {
      Widget chip = UnreadCountChip(unreadCnt: unreadCnt, height: 1.0);

      bottomNavigationBarItem = BottomNavigationBarItem(
        icon: _setChipIcon(
          icon: _bottomNavigationBarItems.values.elementAt(1)[0],
          chip: chip,
        ),
        activeIcon: _setChipIcon(
          icon: _bottomNavigationBarItems.values.elementAt(1)[1],
          chip: chip,
        ),
        label: _bottomNavigationBarItems.keys.elementAt(1),
      );
    }

    return [
      /* 1 */
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _bottomNavigationBarItems.values.elementAt(0)[0],
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _bottomNavigationBarItems.values.elementAt(0)[1],
        ),
        label: _bottomNavigationBarItems.keys.elementAt(0),
      ),

      /* 2 */
      bottomNavigationBarItem ??
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _bottomNavigationBarItems.values.elementAt(1)[0],
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: _bottomNavigationBarItems.values.elementAt(1)[1],
            ),
            label: _bottomNavigationBarItems.keys.elementAt(1),
          ),

      /* 3 */
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _bottomNavigationBarItems.values.elementAt(2)[0],
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _bottomNavigationBarItems.values.elementAt(2)[1],
        ),
        label: _bottomNavigationBarItems.keys.elementAt(2),
      ),

      /* 4 */
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _bottomNavigationBarItems.values.elementAt(3)[0],
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _bottomNavigationBarItems.values.elementAt(3)[1],
        ),
        label: _bottomNavigationBarItems.keys.elementAt(3),
      ),

      /* 5 */
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _bottomNavigationBarItems.values.elementAt(4)[0],
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _bottomNavigationBarItems.values.elementAt(4)[1],
        ),
        label: _bottomNavigationBarItems.keys.elementAt(4),
      )
    ];
  }
}
