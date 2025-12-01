import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/edit_todo_provider.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class SelectedTag extends ConsumerWidget {
  /// 선택한 태그 표시/취소
  const SelectedTag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTag = ref.read(editTodoProvider).tag;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: AppSize.appPaddingS,
        children: selectedTag
            .map(
              (tag) => InputChip(
                label: Text(tag.name),
                labelStyle: TextStyle(color: AppTheme.charcoal),
                onDeleted: () {
                  ref.read(editTodoProvider.notifier).deleteTag(tag: tag);
                },
                backgroundColor: AppTheme.lightGray,
                deleteIconColor: AppTheme.charcoal,
                side: BorderSide.none,
              ),
            )
            .toList(),
      ),
    );
  }
}
