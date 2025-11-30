import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/todo_provider.dart';
import 'package:todo_project/screens/todo/list/widgets/todo_edit_button.dart';
import 'package:todo_project/theme/app_size.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoProvider);
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          title: Text(todoList[index].title),
          leading: Checkbox(value: false, onChanged: (value) {}),
          trailing: TodoEditButton(),
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(vertical: -4.0),
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: AppSize.appPaddingS),
      itemCount: todoList.length,
    );
  }
}
