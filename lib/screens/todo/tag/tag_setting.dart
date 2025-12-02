import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_scrollbar.dart';
import 'package:todo_project/providers/scroll/scroll_provider.dart';
import 'package:todo_project/providers/tag_provider.dart';
import 'package:todo_project/screens/todo/tag/add_tag.dart';
import 'package:todo_project/screens/todo/tag/tag_list.dart';
import 'package:todo_project/theme/app_size.dart';

class TagSetting extends StatelessWidget {
  /// 태그 추가, 삭제, 수정 위젯
  const TagSetting({super.key});

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
          final scrollController = ref.watch(tagScrollProvider);
          return Padding(
            padding: EdgeInsets.only(right: AppSize.scrollPadding),
            child: CustomScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: tagListLength + 1, // 리스트 + 태그 추가 버튼
                itemBuilder: (context, index) {
                  // 태그 추가
                  if (index == 0) {
                    return AddTag();
                  }
                  return TagList(index: index - 1); // 태그 추가때문에 1빼기
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
