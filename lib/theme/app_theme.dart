import 'package:flutter/material.dart';
import 'package:todo_project/theme/app_size.dart';

class AppTheme {
  /// 자주 사용하는 밝은 회색
  static final lightGray = Colors.grey[200];

  /// 자주 사용하는 진한 회색
  static final charcoal = Colors.grey[600];

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
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((
        Set<WidgetState> states,
      ) {
        return lightGray!;
      }),
      side: BorderSide.none,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightGray,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppSize.containerRadiusS),
        ),
      ),
    ),
  );
}
