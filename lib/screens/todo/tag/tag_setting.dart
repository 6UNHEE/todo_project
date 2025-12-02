import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/tag_provider.dart';
import 'package:todo_project/screens/todo/tag/add_tag.dart';
import 'package:todo_project/screens/todo/tag/tag_list.dart';
import 'package:todo_project/theme/app_size.dart';

class TagSetting extends StatefulWidget {
  /// 태그 추가, 삭제, 수정 위젯
  const TagSetting({super.key});

  @override
  State<TagSetting> createState() => _TagSettingState();
}

class _TagSettingState extends State<TagSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.containerPaddingS),
          topRight: Radius.circular(AppSize.containerRadiusS),
        ),
      ),
      child: Consumer(
        builder: (context, ref, child) {
          final tagListLength = ref.watch(tagNotifierProvider).length;
          return ListView.builder(
            itemCount: tagListLength + 1, // 리스트 + 태그 추가 버튼
            itemBuilder: (context, index) {
              // 태그 추가
              if (index == 0) {
                return AddTag();
              }
              return TagList(index: index - 1); // 태그 추가때문에 1빼기
            },
          );
        },
      ),
    );
  }
}
