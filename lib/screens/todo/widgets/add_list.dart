import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/providers/todo_provider.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class AddList extends ConsumerWidget {
  /// To do 리스트 추가
  const AddList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoText = ref.watch(todoTextProvider);

    return Container(
      height: 150,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            onChanged: (value) {
              ref.read(todoTextProvider.notifier).state = value;
            },
            maxLines: null,
            maxLength: 100,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '할 일 입력',
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ),
          Visibility(
            visible: todoText.isNotEmpty,
            child: Row(
              spacing: AppSize.appPaddingS,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '임시저장',
                    style: TextStyle(color: AppTheme.charcoal),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final now = DateTime.now();
                    final newTodo = TodoModel(
                      id: now.millisecondsSinceEpoch,
                      title: todoText,
                      tag: null,
                      createdAt: now.toIso8601String(),
                      updatedAt: null,
                    );
                    ref.read(todoProvider.notifier).addList(todo: newTodo);
                    Navigator.pop(context);
                  },
                  child: Text('완료'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
