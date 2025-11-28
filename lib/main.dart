import 'package:flutter/material.dart';
import 'package:todo_project/screens/profile/profile_setting_screen.dart';
import 'package:todo_project/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.light, home: ProfileSettingScreen());
  }
}
