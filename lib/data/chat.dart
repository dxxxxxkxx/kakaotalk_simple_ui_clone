class Chat {
  String? pictureSrc;
  String title;
  String body;
  DateTime lastMsgTime;
  int peopleCnt;
  int unreadCnt;
  bool hasNotification;
  bool isMyChat;

  Chat({
    required this.title,
    required this.body,
    required this.lastMsgTime,
    required this.peopleCnt,
    required this.unreadCnt,
    this.pictureSrc,
    this.hasNotification = true,
    this.isMyChat = false,
  }) {
    if (lastMsgTime.isUtc) {
      lastMsgTime = lastMsgTime.toLocal();
    }

    if (lastMsgTime.isAfter(DateTime.now())) {
      throw Exception('lastMsgTime.isAfter(DateTime.now()) == true');
    }

    if (peopleCnt < 1) {
      throw Exception('peopleCnt < 1');
    }

    if (unreadCnt < 0) {
      throw Exception('unreadCnt < 0');
    }
  }
}
