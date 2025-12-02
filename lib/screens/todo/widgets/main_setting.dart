import 'package:flutter/material.dart';
import 'package:todo_project/screens/todo/filter/filter_setting.dart';
import 'package:todo_project/screens/todo/tag/tag_setting.dart';

class MainSetting extends StatelessWidget {
  /// Main 화면 AppBar action
  ///
  /// 태그 편집, 필터 설정
  const MainSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          //#region 태그 편집
          PopupMenuItem(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => TagSetting(),
              isScrollControlled: true,
            ),
            child: Text('태그 편집'),
          ),
          //#endregion

          //#region 필터 설정
          PopupMenuItem(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => FilterSetting(),
            ),

            child: Text('필터 설정'),
          ),
          //#endregion
        ];
      },
      icon: Icon(Icons.more_horiz),
      color: Colors.white,
    );
  }
}
