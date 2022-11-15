import 'package:flutter/material.dart';

class UnreadCountChip extends StatelessWidget {
  final int unreadCnt;
  final double height;

  const UnreadCountChip({
    required this.unreadCnt,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: -4.0),
      backgroundColor: Colors.red,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      label: Text(
        unreadCnt <= 999 ? '$unreadCnt' : '999+',
        style: TextStyle(color: Colors.white, height: height),
      ),
    );
  }
}
