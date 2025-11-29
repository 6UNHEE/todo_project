import 'package:flutter/material.dart';
import 'package:todo_project/screens/todo/widgets/filter_setting.dart';
import 'package:todo_project/screens/todo/widgets/tag_setting.dart';

class MainSetting extends StatefulWidget {
  /// Main 화면 AppBar action
  const MainSetting({super.key});

  @override
  State<MainSetting> createState() => _MainSettingState();
}

class _MainSettingState extends State<MainSetting> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {},
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => TagSetting(),
              isScrollControlled: true,
            ),
            child: Text('태그 편집'),
          ),
          PopupMenuItem(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => FilterSetting(),
            ),

            child: Text('필터 설정'),
          ),
        ];
      },
      icon: Icon(Icons.more_horiz),
    );
  }
}
