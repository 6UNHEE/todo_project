import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/providers/edit_todo_provider.dart';
import 'package:todo_project/providers/todo_provider.dart';

class DoneButton extends ConsumerWidget {
  /// 완료 버튼
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editTodo = ref.read(editTodoProvider);
    final doneTodo = ref.read(todoProvider.notifier);

    return TextButton(
      onPressed: () {
        final now = DateTime.now();

        final addTodo = TodoModel(
          id: now.millisecondsSinceEpoch,
          title: editTodo.title,
          tag: [],
          createdAt: now.toIso8601String(),
          isDone: false,
        );

        doneTodo.addList(todo: addTodo);
        Navigator.pop(context);
      },
      child: Text('완료'),
    );
  }
}
