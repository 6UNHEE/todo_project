import 'package:flutter/material.dart';
import 'package:todo_project/screens/todo/list/widgets/todo_form.dart';

class TodoDetail extends StatelessWidget {
  final int index;

  /// To do list 상세 보기
  const TodoDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return TodoForm(index: index, isEditing: false);
  }
}
