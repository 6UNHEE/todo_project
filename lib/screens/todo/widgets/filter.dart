import 'package:flutter/material.dart';
import 'package:todo_project/enums/todo_status_enum.dart';

class Filter extends StatefulWidget {
  /// 전체, 완료, 진행중 필터 위젯
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {},
      itemBuilder: (context) => TodoStatusEnum.values
          .map(
            (value) =>
                PopupMenuItem(value: value.value, child: Text(value.title)),
          )
          .toList(),
      icon: Icon(Icons.filter_alt),
    );
  }
}
