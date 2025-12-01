import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/edit_todo_provider.dart';
import 'package:todo_project/screens/todo/list/widgets/done_button.dart';
import 'package:todo_project/screens/todo/list/widgets/select_tag.dart';
import 'package:todo_project/screens/todo/list/widgets/selected_tag.dart';
import 'package:todo_project/screens/todo/list/widgets/temporay_button.dart';
import 'package:todo_project/screens/todo/list/widgets/todo_content.dart';
import 'package:todo_project/theme/app_size.dart';

class AddList extends ConsumerWidget {
  /// To do 리스트 추가
  const AddList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editing = ref.watch(editTodoProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TodoContent(),
            Visibility(
              visible: editing.title.isNotEmpty,
              child: Row(
                spacing: AppSize.appPaddingS,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 16.0), // textbutton 패딩이랑 비슷하게 주기
                  Expanded(child: SelectedTag()),
                  SelectTag(),
                  TemporayButton(),
                  DoneButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
