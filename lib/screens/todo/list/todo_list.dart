import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_scrollbar.dart';
import 'package:todo_project/providers/filtered_todo_provider.dart';
import 'package:todo_project/providers/scroll/scroll_provider.dart';
import 'package:todo_project/providers/todo_provider.dart';
import 'package:todo_project/screens/todo/list/todo_detail.dart';
import 'package:todo_project/screens/todo/list/widgets/todo_edit_button.dart';
import 'package:todo_project/theme/app_size.dart';

class TodoList extends ConsumerWidget {
  /// To do list 위젯
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(filteredTodoProvider);
    final scrollController = ref.watch(todoScrollProvider);

    return Padding(
      padding: EdgeInsets.only(right: AppSize.scrollPadding),
      child: CustomScrollbar(
        controller: scrollController,
        child: ListView.separated(
          controller: scrollController,
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
              //#region 제목
              title: Text(todoList[index].title),
              //#endreigon

              //#region 체크 박스
              leading: Checkbox(
                value: todoList[index].isDone,
                onChanged: (value) async {
                  await ref
                      .read(todoNotifierProvider.notifier)
                      .toggleCheck(index: index, isDone: value!);
                },
              ),
              //#endregion

              //#region 수정 버튼
              trailing: TodoEditButton(id: todoList[index].id),
              //#endregion
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4.0),
            );
          },
          separatorBuilder: (context, index) =>
              SizedBox(height: AppSize.appPaddingM),
          itemCount: todoList.length,
        ),
      ),
    );
  }
}
