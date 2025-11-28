import 'package:flutter/material.dart';
import 'package:todo_project/common/widgets/custom_dialog.dart';
import 'package:todo_project/theme/app_size.dart';

class TodoList extends StatefulWidget {
  /// Todo List 위젯
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  /// `isChecked` : 체크 여부
  ///
  /// `index` : 항목 index
  List<(bool isChecked, int index)> list = List.generate(3, (i) => (false, i));

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return CheckboxListTile(
          value: list[index].$1,
          onChanged: (value) {
            // TODO 상태관리로 체크박스 변경
            setState(() {});
            list[index] = (value!, index);
          },
          title: Text('리스트 ${index + 1}'),
          controlAffinity: ListTileControlAffinity.leading,
          secondary: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  content: Column(
                    spacing: AppSize.appPaddingM,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: Text('메모 수정'),
                        icon: Icon(Icons.delete),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          list.removeAt(index);
                          setState(() {});
                          Navigator.pop(context);
                        },
                        label: Text('메모 삭제'),
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: Icon(Icons.more_horiz),
          ),
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity(vertical: -4.0),
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: AppSize.appPaddingS),
      itemCount: list.length,
    );
  }
}
