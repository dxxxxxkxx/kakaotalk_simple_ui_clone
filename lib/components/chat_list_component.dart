import 'package:flutter/material.dart';

import '../data/chat.dart';
import '../data/constants.dart';
import 'unread_count_chip.dart';

class ChatListComponent extends StatelessWidget {
  final Icon _noPictureIcon = const Icon(
    Icons.person_outline,
    size: 32.0,
    color: Colors.white,
  );

  final CircleAvatar _myCircleAvatar = const CircleAvatar(
    radius: 10.0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    child: Text(
      '나',
      style: TextStyle(
        fontSize: 10.0,
        height: 1.2,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  final Chat chat;
  final List<Widget> _titleRow = [];

  ChatListComponent({required this.chat, Key? key}) : super(key: key) {
    if (chat.isMyChat) {
      _titleRow.add(_myCircleAvatar);
      _titleRow.add(const SizedBox(width: 8.0));
    }

    _titleRow.add(
      Text(
        chat.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style:
            const TextStyle(fontSize: 16.0, color: Colors.white, height: 1.0),
      ),
    );

    if (chat.peopleCnt >= 3) {
      _titleRow.add(const SizedBox(width: 8.0));
      _titleRow.add(
        Text(
          '${chat.peopleCnt}',
          style: const TextStyle(fontSize: 16.0, color: greyColor),
        ),
      );
    }

    if (!chat.hasNotification) {
      _titleRow.add(const SizedBox(width: 8.0));
      _titleRow.add(
        const Icon(Icons.notifications_off, size: 16.0, color: greyColor),
      );
    }
  }

  Widget _getPicture({required String? pictureSrc}) {
    if (pictureSrc != null && pictureSrc.isNotEmpty) {
      return Image.network(pictureSrc, fit: BoxFit.cover);
    }

    return _noPictureIcon;
  }

  Widget _setPicture() {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: _getPicture(pictureSrc: chat.pictureSrc),
      ),
    );
  }

  Widget _setContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: _titleRow),
        const SizedBox(height: 3.0),
        Text(
          chat.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget _setInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          _formatDateTime(chat.lastMsgTime),
          style: const TextStyle(fontSize: 12.0, color: greyColor),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 20,
          child: chat.unreadCnt > 0
              ? UnreadCountChip(unreadCnt: chat.unreadCnt, height: 0.5)
              : null,
        )
      ],
    );
  }

  String _formatDateTime(DateTime lastMsgTime) {
    final DateTime now = DateTime.now();
    final StringBuffer hour;
    final StringBuffer minute;

    if (lastMsgTime.hour >= 0 && lastMsgTime.hour < 12) {
      hour = StringBuffer('오전 ');

      if (lastMsgTime.hour == 0) {
        hour.write('12:');
      } else {
        hour.write('${lastMsgTime.hour}:');
      }
    } else {
      hour = StringBuffer('오후 ');

      if (lastMsgTime.hour == 12) {
        hour.write('12:');
      } else {
        hour.write('${lastMsgTime.hour - 12}:');
      }
    }

    if (lastMsgTime.minute < 10) {
      minute = StringBuffer('0')..write('${lastMsgTime.minute}');
    } else {
      minute = StringBuffer('${lastMsgTime.minute}');
    }

    if (!lastMsgTime.isBefore(DateTime(now.year, 1, 1))) {
      if (!lastMsgTime.isBefore(DateTime(now.year, now.month, now.day))) {
        return (hour..write(minute)).toString(); // today
      } else if (!lastMsgTime
          .isBefore(DateTime(now.year, now.month, now.day - 1))) {
        return '어제'; // yesterday
      }

      // this year ~ 3 days ago
      return '${lastMsgTime.month}월 ${lastMsgTime.day}일';
    }

    // ~ last year
    return '${lastMsgTime.year}. ${lastMsgTime.month}. ${lastMsgTime.day}.';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Row(
        children: [
          SizedBox(width: 60.0, child: _setPicture()),
          const SizedBox(width: 14.0),
          Expanded(child: _setContents()),
          const SizedBox(width: 14.0),
          SizedBox(width: 70.0, child: _setInfo())
        ],
      ),
    );
  }
}
