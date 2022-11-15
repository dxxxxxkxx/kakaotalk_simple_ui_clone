import '../data/chat.dart';

class ChatRepository {
  static final DateTime now = DateTime.now();

  final List<Chat> _chats = [
    /* 1 */
    Chat(
      pictureSrc:
          'https://upload.wikimedia.org/wikipedia/commons/7/72/180417_%EB%B3%B4%EC%95%84_01.png',
      title: '권보아',
      body: '사랑해❤️',
      lastMsgTime: DateTime(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute - 1,
      ),
      peopleCnt: 2,
      unreadCnt: 5,
    ),

    /* 2 */
    Chat(
      pictureSrc:
          'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMDdfMjgx%2FMDAxNjY1MTI0NjEzOTQ2.zBI_Ptcar-W98osLVpC56ZikWn1zqgDEeYaPXSimmucg._k0G_oQSkI8gP6TuA_3I-K0T2ryauQoLXAro1g2CXRIg.JPEG.winsome0705%2Foutput_723617519.jpg&type=sc960_832',
      title: '채형원',
      body: 'ㅋㅋㅋㅋㅋㅋㅋ',
      lastMsgTime: DateTime(now.year, now.month, now.day, now.hour - 1, 32),
      peopleCnt: 2,
      unreadCnt: 0,
    ),

    /* 3 */
    Chat(
      title: '이연주, 박현주, 민하늘',
      body: '응',
      lastMsgTime: DateTime(now.year, now.month, now.day, 0, 0),
      peopleCnt: 4,
      unreadCnt: 1234,
      hasNotification: false,
    ),

    /* 4 */
    Chat(
      pictureSrc:
          'https://static.wikia.nocookie.net/arendelle/images/2/2c/Elsa4.jpg/revision/latest?cb=20151103112320&path-prefix=ko',
      title: 'dxxxxxkxx',
      body: '생분해성 섬유유연제',
      lastMsgTime: DateTime(now.year, now.month, now.day - 1, 22, 32),
      peopleCnt: 1,
      unreadCnt: 0,
      isMyChat: true,
    ),

    /* 5 */
    Chat(
      title: '누구',
      body: '자니?',
      lastMsgTime: DateTime(now.year, now.month, now.day - 1, 21, 48),
      peopleCnt: 1,
      unreadCnt: 13,
    ),

    /* 6 */
    Chat(
      pictureSrc:
          'https://k.kakaocdn.net/dn/lwwoY/btqRoRekOAC/9oa62XQ2Cx6LbAfRKecVG0/img.jpg',
      title: 'Hogwarts 3학년',
      body:
          '30일 2교시 \'마법의 역사\' 수업이 \'변신술\' 수업으로 대체되었습니다. 자세한 사항은 각 기숙사 반장에게 문의 바랍니다.',
      lastMsgTime: DateTime(now.year, now.month - 2, 29, 9, 0),
      peopleCnt: 40,
      unreadCnt: 0,
    ),

    /* 7 */
    Chat(
      pictureSrc: 'https://www.wwfkorea.or.kr/img/newbird/main/logo.png',
      title: '세계자연기금WWF-Korea',
      body: '''김도현 후원자님
      
      10월 판다메일에서는 WWF가 각국의 금융 당국에 강력한 정책을 촉구하는 내용으로 시작합니다.
      WWF (세계자연기금)는 각국의 중앙은행과 금융감독기관이 기후변화와 생물 다양성 위기 대응에 보다 강력한 조치를 취할 것을 촉구하는 성명서를 발표했습니다.''',
      lastMsgTime: DateTime(now.year, now.month - 7, 18, 12, 9),
      peopleCnt: 1,
      unreadCnt: 0,
    ),

    /* 8 */
    Chat(
      pictureSrc:
          'https://lh3.googleusercontent.com/-g7IOVBQYMxk/W8IBpkAh0CI/AAAAAAAFIKY/a85KemtGu7MYKA4EDvlHJT-qfg5pDCZCgCHMYCw/s0/4b0ec017bb5b4d69f3980107e08436e8576996c6.jpg',
      title: '죽먹자',
      body: '메시지가 도착했습니다.',
      lastMsgTime: DateTime(now.year - 1, 10, 21, 0, 52),
      peopleCnt: 20,
      unreadCnt: 1,
      hasNotification: false,
    ),
  ];

  final List<Chat> _openChats = [
    Chat(
      pictureSrc:
          'https://static.wikia.nocookie.net/harrypotter/images/8/8d/Broomsticks.jpg/revision/latest?cb=20140603221848',
      title: '빗자루 공동 구매',
      body: '참여',
      lastMsgTime: DateTime(
        now.year,
        now.month,
        now.day,
        now.hour - 2,
        now.minute - 7,
      ),
      peopleCnt: 187,
      unreadCnt: 4,
      hasNotification: false,
    )
  ];

  List<Chat> get chats => _chats;

  List<Chat> get openChats => _openChats;
}
