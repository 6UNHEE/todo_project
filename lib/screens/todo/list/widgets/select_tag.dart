import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/edit_todo_provider.dart';
import 'package:todo_project/providers/tag_provider.dart';

class SelectTag extends ConsumerWidget {
  /// 태그 선택
  const SelectTag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagList = ref.read(tagNotifierProvider);

    return PopupMenuButton(
      color: Colors.white,
      icon: Icon(Icons.sell),
      itemBuilder: (context) {
        return tagList
            .map(
              (tag) => PopupMenuItem(
                onTap: () {
                  ref.read(editTodoProvider.notifier).addTag(tag: tag);
                },
                child: Text(tag.name),
              ),
            )
            .toList();
      },
    );
  }
}
