import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/draft_todo_provider.dart';
import 'package:todo_project/screens/todo/list/widgets/done_button.dart';
import 'package:todo_project/screens/todo/list/widgets/select_tag.dart';
import 'package:todo_project/screens/todo/list/widgets/selected_tag.dart';
import 'package:todo_project/screens/todo/list/widgets/temporay_button.dart';
import 'package:todo_project/screens/todo/list/widgets/todo_content.dart';
import 'package:todo_project/screens/todo/list/widgets/todo_image.dart';
import 'package:todo_project/screens/todo/list/widgets/upload_image.dart';
import 'package:todo_project/theme/app_size.dart';

class AddList extends ConsumerWidget {
  /// To do 리스트 추가
  const AddList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(draftTodoNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            //#region 제목 입력
            TodoContent(),
            //#endregion
            Visibility(
              // 타이틀을 입력해야 활성화
              visible: draft.title.isNotEmpty,
              child: Column(
                spacing: AppSize.appPaddingM,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //#region 선택된 이미지
                  TodoImage(),
                  //#endregion
                  Row(
                    spacing: AppSize.appPaddingS,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // textbutton 패딩이랑 비슷하게 주기
                      SizedBox(width: 1.0),

                      //#region 선택된 태그 표시
                      Expanded(child: SelectedTag()),
                      //#endregion

                      //#region 이미지 업로드
                      UploadImage(),
                      //#endregion

                      //#region 태그 선택
                      SelectTag(),
                      //#endregion

                      //#region 임시저장 버튼
                      TemporayButton(),
                      //#endregion

                      //#region 완료 버튼
                      DoneButton(),
                      //#endregion
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
