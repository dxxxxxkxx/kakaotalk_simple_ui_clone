import 'package:flutter/material.dart';

class UnreadCntChip extends StatelessWidget {
  final int unreadCnt;
  final double height;

  const UnreadCntChip({required this.unreadCnt, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: -4.0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: Colors.red,
      label: Text(
        unreadCnt <= 999 ? '$unreadCnt' : '999+',
        style: TextStyle(color: Colors.white, height: height),
      ),
    );
  }
}
