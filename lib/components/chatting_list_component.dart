import 'package:flutter/material.dart';

import '../data/chatting.dart';
import '../screens/main_screen.dart';
import 'unread_cnt_chip.dart';

class ChattingListComponent extends StatelessWidget {
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
      style:
          TextStyle(fontSize: 10.0, height: 1.2, fontWeight: FontWeight.bold),
    ),
  );

  final Chatting chatting;
  final List<Widget> _titleRow = [];

  ChattingListComponent({required this.chatting, Key? key}) : super(key: key) {
    if (chatting.myChatting) {
      _titleRow.add(_myCircleAvatar);
      _titleRow.add(const SizedBox(width: 8.0));
    }

    _titleRow.add(
      Text(
        chatting.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style:
            const TextStyle(fontSize: 16.0, color: Colors.white, height: 1.0),
      ),
    );

    if (chatting.peopleCnt >= 3) {
      _titleRow.add(const SizedBox(width: 8.0));
      _titleRow.add(
        Text(
          '${chatting.peopleCnt}',
          style: const TextStyle(fontSize: 16.0, color: greyColor),
        ),
      );
    }

    if (!chatting.notification) {
      _titleRow.add(const SizedBox(width: 8.0));
      _titleRow.add(
        const Icon(Icons.notifications_off, size: 16.0, color: greyColor),
      );
    }
  }

  Widget _setPicture({required String? picture}) {
    if (picture != null) {
      return Image.network(chatting.picture!, fit: BoxFit.cover);
    }

    return _noPictureIcon;
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
        hour.write('${lastMsgTime.hour}:');
      }
    }

    if (lastMsgTime.minute < 10) {
      minute = StringBuffer('0')..write('${lastMsgTime.minute}');
    } else {
      minute = StringBuffer('${lastMsgTime.minute}');
    }

    if (!lastMsgTime.isBefore(DateTime(now.year, 1, 1))) {
      if (!lastMsgTime.isBefore(DateTime(now.year, now.month, now.day))) {
        // today
        return (hour..write(minute)).toString();
      } else if (!lastMsgTime
          .isBefore(DateTime(now.year, now.month, now.day - 1))) {
        // yesterday
        return '어제';
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
          /* 1 */
          SizedBox(
            width: 60.0,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: _setPicture(picture: chatting.picture),
              ),
            ),
          ),

          /* 2 */
          const SizedBox(width: 14.0),

          /* 3 */
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: _titleRow),
                const SizedBox(height: 3.0),
                Text(
                  chatting.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),

          /* 4 */
          const SizedBox(width: 14.0),

          /* 5 */
          SizedBox(
            width: 70.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _formatDateTime(chatting.lastMsgTime),
                  style: const TextStyle(fontSize: 12.0, color: greyColor),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  height: 20,
                  child: chatting.unreadCnt > 0
                      ? UnreadCntChip(
                          unreadCnt: chatting.unreadCnt,
                          height: 0.5,
                        )
                      : null,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
