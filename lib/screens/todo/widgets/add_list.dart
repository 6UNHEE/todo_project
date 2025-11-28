import 'package:flutter/material.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class AddList extends StatefulWidget {
  /// Todo 리스트 추가
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final TextEditingController _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            controller: _todoController,
            onChanged: (value) {
              // TODO 상태관리로 setState 없이 입력 감지하기
              setState(() {});
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
            visible: _todoController.text.isNotEmpty,
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
                TextButton(onPressed: () {}, child: Text('완료')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
