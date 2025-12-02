import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_scrollbar.dart';
import 'package:todo_project/providers/edit_todo_provider.dart';
import 'package:todo_project/providers/scroll/scroll_provider.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class SelectedTag extends ConsumerWidget {
  /// 선택한 태그 표시/취소
  const SelectedTag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTag = ref.read(editTodoNotifierProvider).tag;
    final scrollController = ref.watch(editTagScrollProvider);

    return CustomScrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: AppSize.appPaddingS,
          children: selectedTag
              .map(
                (tag) => InputChip(
                  label: Text(tag.name),
                  labelStyle: TextStyle(color: AppTheme.charcoal),
                  onDeleted: () {
                    ref
                        .read(editTodoNotifierProvider.notifier)
                        .deleteTag(tag: tag);
                  },
                  backgroundColor: AppTheme.lightGray,
                  deleteIconColor: AppTheme.charcoal,
                  side: BorderSide.none,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
