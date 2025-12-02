import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/screens/todo/list/widgets/todo_form.dart';

class EditingTodo extends ConsumerWidget {
  final int index;

  /// To do list 수정
  const EditingTodo({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TodoForm(index: index, isEditing: true);
  }
}
