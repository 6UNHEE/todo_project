import 'package:flutter/material.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
import 'package:todo_project/screens/todo/widgets/profile_info.dart';
import 'package:todo_project/screens/todo/widgets/search_list.dart';
import 'package:todo_project/screens/todo/widgets/filter.dart';
import 'package:todo_project/screens/todo/widgets/todo_list.dart';
import 'package:todo_project/theme/app_size.dart';

class MainScreen extends StatefulWidget {
  /// 메인 Todo 화면
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isMainScreen: true,
      actions: [Filter()],
      child: Column(
        spacing: AppSize.appPaddingS,
        children: [
          ProfileInfo(),
          SearchList(),
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}
