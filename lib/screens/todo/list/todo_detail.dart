import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/todo_provider.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class TodoDetail extends ConsumerWidget {
  final int index;

  /// To do 리스트 상세 보기
  const TodoDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.read(todoProvider);
    //final image = ref.read(todoImageNotifierProvider);

    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.containerRadiusS),
          topRight: Radius.circular(AppSize.containerRadiusS),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(value: todoList[index].isDone, onChanged: (value) {}),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.appPaddingS),
            child: Text(
              todoList[index].title,
              style: TextStyle(fontSize: 20.0),
            ),
          ),

          Expanded(
            child: todoList[index].imagePath != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.appPaddingS,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSize.containerRadiusS,
                      ),
                      child: Image.file(
                        File(todoList[index].imagePath!),
                        width: AppSize.imageSize,
                        height: AppSize.imageSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.appPaddingS),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: AppSize.appPaddingS,
                children: todoList[index].tag
                    .map(
                      (tag) => InputChip(
                        label: Text(tag.name),
                        labelStyle: TextStyle(color: AppTheme.charcoal),
                        backgroundColor: AppTheme.lightGray,
                        side: BorderSide.none,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
