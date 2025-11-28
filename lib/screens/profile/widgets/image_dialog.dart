import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  /// 프로필 이미지를 수정/삭제/취소할 수 있는 위젯
  const ImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = 15.0;
    return AlertDialog(
      title: Text('프로필 이미지', textAlign: TextAlign.center),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),

      actions: [
        ElevatedButton(onPressed: () {}, child: Text('수정')),
        ElevatedButton(onPressed: () {}, child: Text('삭제')),
        ElevatedButton(onPressed: () {}, child: Text('취소')),
      ],
      backgroundColor: Colors.white,
    );
  }
}
