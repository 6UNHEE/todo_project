import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/providers/draft_todo_provider.dart';
import 'package:todo_project/providers/todo_image_provider.dart';
import 'package:todo_project/providers/todo_provider.dart';

class DoneButton extends ConsumerWidget {
  /// 완료 버튼
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draftTodo = ref.read(draftTodoNotifierProvider);
    final imagePath = ref.watch(todoImageNotifierProvider);

    return TextButton(
      onPressed: () async {
        final now = DateTime.now();

        if (imagePath != null) {
          await ref
              .read(todoImageNotifierProvider.notifier)
              .saveImage(originPath: imagePath);
        }

        final newTodo = TodoModel(
          id: now.millisecondsSinceEpoch,
          title: draftTodo.title,
          tag: draftTodo.tag,
          createdAt: now.toIso8601String(),
          isDone: false,
          imagePath: imagePath,
        );

        // To do list 추가
        await ref.read(todoNotifierProvider.notifier).addList(todo: newTodo);

        if (context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Text('완료'),
    );
  }
}
