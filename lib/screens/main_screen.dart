import 'package:flutter/material.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
import 'package:todo_project/enums/todo_status_enum.dart';
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
      actions: [
        PopupMenuButton(
          onSelected: (value) {},
          itemBuilder: (context) => TodoStatusEnum.values
              .map(
                (value) =>
                    PopupMenuItem(value: value.value, child: Text(value.title)),
              )
              .toList(),
          icon: Icon(Icons.filter_alt),
        ),
      ],
      child: Row(
        spacing: AppSize.appPaddingS,
        children: [
          // TODO 프로필 사진 추가
          SizedBox(width: 50, height: 50, child: Placeholder()),
          // TODO 설정된 이름으로 설정, 기본값은 공백
          Text('이름', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
