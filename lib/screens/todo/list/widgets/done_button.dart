import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  /// 완료 버튼
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final now = DateTime.now();
        // final newTodo = TodoModel(
        //   id: now.millisecondsSinceEpoch,
        //   title: todoText,
        //   tag: null,
        //   createdAt: now.toIso8601String(),
        //   updatedAt: null,
        // );
        // ref.read(todoProvider.notifier).addList(todo: newTodo);
        Navigator.pop(context);
      },
      child: Text('완료'),
    );
  }
}
