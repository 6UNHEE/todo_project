import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_scrollbar.dart';
import 'package:todo_project/providers/scroll/scroll_provider.dart';
import 'package:todo_project/providers/todo_provider.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class TodoDetail extends ConsumerWidget {
  final int index;

  /// To do 리스트 상세 보기
  const TodoDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.read(todoNotifierProvider);
    final scrollController = ref.watch(selectedTagScrollProvider);

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
          //#region 체크박스
          Checkbox(value: todoList[index].isDone, onChanged: (value) {}),
          //#endregion
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.appPaddingM),
            //#region To do list 제목
            child: Text(
              todoList[index].title,
              style: TextStyle(fontSize: 20.0),
            ),
            //#endregion
          ),

          //#region 이미지
          Expanded(
            child: todoList[index].imagePath != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.appPaddingM,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSize.containerRadiusS,
                      ),
                      child: Image.file(
                        File(todoList[index].imagePath!),
                        width: AppSize.imageSizeM,
                        height: AppSize.imageSizeM,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          //#endregion
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.appPaddingL),
            child: CustomScrollbar(
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                //TODO 색상 변경이 안 되는 이유??
                //#region 태그
                child: Row(
                  spacing: AppSize.appPaddingL,
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
                //#endregion
              ),
            ),
          ),
        ],
      ),
    );
  }
}
