import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_project/models/tag_model.dart';
import 'package:todo_project/screens/todo/main_screen.dart';

import 'package:todo_project/theme/app_theme.dart';

void main() async {
  // Hive 초기화
  await Hive.initFlutter();
  Hive.registerAdapter(TagModelAdapter());
  // databox = 저장공간
  await Hive.openBox('userbox');
  await Hive.openBox<TagModel>('tagbox');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: MainScreen(),
    );
  }
}
