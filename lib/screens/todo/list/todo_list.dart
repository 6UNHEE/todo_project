import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/filtered_todo_provider.dart';
import 'package:todo_project/providers/todo_provider.dart';
import 'package:todo_project/screens/todo/list/todo_detail.dart';
import 'package:todo_project/screens/todo/list/widgets/todo_edit_button.dart';
import 'package:todo_project/theme/app_size.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(filteredTodoProvider);
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return TodoDetail(index: index);
              },
            );
          },
          title: Text(todoList[index].title),
          leading: Checkbox(
            value: todoList[index].isDone,
            onChanged: (value) {
              ref
                  .read(todoProvider.notifier)
                  .toggleCheck(index: index, isDone: value!);
            },
          ),
          trailing: TodoEditButton(id: todoList[index].id),
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
