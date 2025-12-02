import 'package:flutter/material.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
import 'package:todo_project/screens/todo/list/todo_list.dart';
import 'package:todo_project/screens/todo/widgets/main_setting.dart';
import 'package:todo_project/screens/todo/widgets/profile_info.dart';
import 'package:todo_project/screens/todo/widgets/search_box.dart';
import 'package:todo_project/theme/app_size.dart';

class MainScreen extends StatelessWidget {
  /// 메인 화면
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isMainScreen: true,
      actions: [MainSetting()],
      child: Column(
        spacing: AppSize.appPaddingM,
        children: [
          ProfileInfo(),
          SearchList(),
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}
