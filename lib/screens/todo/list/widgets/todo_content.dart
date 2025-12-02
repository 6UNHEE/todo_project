import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/draft_todo_provider.dart';
import 'package:todo_project/theme/app_size.dart';

class TodoContent extends ConsumerWidget {
  /// 할 일 입력
  const TodoContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      onChanged: (value) {
        // 입력 관찰
        ref.read(draftTodoNotifierProvider.notifier).updateTitle(title: value);
      },
      maxLines: null,
      maxLength: 100, // 줄바꿈
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '할 일 입력',
        contentPadding: EdgeInsets.symmetric(horizontal: AppSize.appPaddingM),
      ),
    );
  }
}
