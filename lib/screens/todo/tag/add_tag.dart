import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_dialog.dart';
import 'package:todo_project/common/widgets/custom_text_field.dart';
import 'package:todo_project/models/tag_model.dart';
import 'package:todo_project/providers/tag_provider.dart';

class AddTag extends StatelessWidget {
  /// 태그 추가 위젯
  const AddTag({super.key});

  @override
  Widget build(BuildContext context) {
    final tagNameKey = GlobalKey<FormState>();

    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Consumer(
              builder: (context, ref, child) {
                final tagProvider = ref.read(tagNotifierProvider.notifier);
                String tagName = '';
                return CustomDialog(
                  title: '태그 추가',
                  //#region 태그입력
                  content: CustomTextField(
                    globalKey: tagNameKey,
                    onChanged: (value) {
                      tagName = value;
                    },
                    validate: (value) {
                      // 중복 검사
                      if (tagProvider.isDuplicate(name: tagName)) {
                        return '중복된 태그 입니다';
                      }
                      return null;
                    },
                  ),
                  //#endregion
                  actions: [
                    //#region 취소 버튼
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('취소'),
                    ),
                    //#endregion

                    //#region 완료 버튼
                    ElevatedButton(
                      onPressed: () async {
                        // 공백 X
                        if (tagName.isEmpty) return;
                        // 중복 X
                        if (!(tagNameKey.currentState!.validate())) return;

                        final newTag = TagModel(
                          id: DateTime.now().millisecondsSinceEpoch,
                          name: tagName,
                        );

                        tagName = ''; // 중복안되게 처리

                        await tagProvider.addTag(tag: newTag);
                      },
                      child: Text('완료'),
                    ),
                    //#endregion
                  ],
                );
              },
            );
          },
        );
      },
      leading: Icon(Icons.add),
      title: Text('태그 추가', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
