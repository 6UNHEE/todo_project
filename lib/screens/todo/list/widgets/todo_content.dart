import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/edit_todo_provider.dart';

class TodoContent extends ConsumerWidget {
  /// 할 일 입력
  const TodoContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editTodo = ref.read(editTodoProvider.notifier);
    return TextFormField(
      onChanged: (value) {
        editTodo.updateTitle(title: value);
      },
      maxLines: null,
      maxLength: 100,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '할 일 입력',
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}
