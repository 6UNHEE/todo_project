import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_scrollbar.dart';
import 'package:todo_project/providers/edit_todo_provider.dart';
import 'package:todo_project/providers/scroll/scroll_provider.dart';
import 'package:todo_project/providers/todo_provider.dart';
import 'package:todo_project/screens/todo/list/widgets/select_tag.dart';
import 'package:todo_project/screens/todo/list/widgets/upload_image.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class TodoForm extends ConsumerStatefulWidget {
  final int index;
  final bool isEditing;

  const TodoForm({super.key, required this.index, required this.isEditing});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoFormState();
}

class _TodoFormState extends ConsumerState<TodoForm> {
  @override
  void initState() {
    super.initState();
    final todoList = ref.read(todoNotifierProvider);
    ref
        .read(editTodoNotifierProvider.notifier)
        .loadSavedTodo(id: todoList[widget.index].id);
  }

  @override
  Widget build(BuildContext context) {
    final todoList = ref.watch(todoNotifierProvider);
    final scrollController = ref.watch(selectedTagScrollProvider);
    final editList = ref.watch(editTodoNotifierProvider);

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
      child: editList == null
          ? SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //#region 체크박스
                Checkbox(
                  value: editList.isDone,
                  onChanged: widget.isEditing
                      ? (value) {
                          ref
                              .read(editTodoNotifierProvider.notifier)
                              .toggleCheck(isDone: value!);
                        }
                      : null,
                ),
                //#endregion
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.appPaddingM,
                  ),
                  //#region To do list 제목
                  child: widget.isEditing
                      ? TextFormField(
                          onChanged: (value) {
                            ref
                                .read(editTodoNotifierProvider.notifier)
                                .updateTitle(title: value);
                          },
                          initialValue: editList.title,
                          maxLines: null,
                          maxLength: 100, // 줄바꿈
                          decoration: InputDecoration(border: InputBorder.none),
                        )
                      : Text(
                          todoList[widget.index].title,
                          style: TextStyle(fontSize: 20.0),
                        ),
                  //#endregion
                ),

                //#region 이미지
                Expanded(
                  child: editList.imagePath != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.appPaddingM,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppSize.containerRadiusS,
                            ),
                            child: widget.isEditing
                                ? GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(
                                            editTodoNotifierProvider.notifier,
                                          )
                                          .deleteImage();
                                    },
                                    child: Image.file(
                                      File(editList.imagePath!),
                                      width: AppSize.imageSizeM,
                                      height: AppSize.imageSizeM,
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : Image.file(
                                    File(editList.imagePath!),
                                    width: AppSize.imageSizeM,
                                    height: AppSize.imageSizeM,
                                    fit: BoxFit.contain,
                                  ),
                          ),
                        )
                      : SizedBox.shrink(),
                ),
                //#endregion
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: AppSize.appPaddingM),
                      child: CustomScrollbar(
                        controller: scrollController,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          //TODO 색상 변경이 안 되는 이유??
                          //#region 태그
                          child: Row(
                            spacing: AppSize.appPaddingS,
                            children: editList.tag
                                .map(
                                  (tag) => InputChip(
                                    label: Text(tag.name),
                                    labelStyle: TextStyle(
                                      color: AppTheme.charcoal,
                                    ),
                                    backgroundColor: AppTheme.lightGray,
                                    side: BorderSide.none,
                                    onDeleted: widget.isEditing
                                        ? () {
                                            ref
                                                .read(
                                                  editTodoNotifierProvider
                                                      .notifier,
                                                )
                                                .deleteTag(tag: tag);
                                          }
                                        : null,
                                  ),
                                )
                                .toList(),
                          ),
                          //#endregion
                        ),
                      ),
                    ),
                    if (widget.isEditing)
                      Row(
                        children: [
                          SelectTag(),
                          UploadImage(),
                          TextButton(
                            onPressed: () async {
                              await ref
                                  .read(editTodoNotifierProvider.notifier)
                                  .updateModel();

                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            },
                            child: Text('완료'),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
    );
  }
}
