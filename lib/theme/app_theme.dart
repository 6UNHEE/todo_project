import 'package:flutter/material.dart';

class AppTheme {
  /// 자주 사용하는 밝은 회색
  static final lightGray = Colors.grey[200];

  /// 라이트 모드
  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
