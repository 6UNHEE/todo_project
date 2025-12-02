import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_dialog.dart';
import 'package:todo_project/common/widgets/custom_text_field.dart';
import 'package:todo_project/providers/tag_provider.dart';

class TagList extends ConsumerWidget {
  final int index;

  /// 태그 리스트
  const TagList({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newTagNameKey = GlobalKey<FormState>();

    final tagProvider = ref.read(tagNotifierProvider.notifier);

    final tagList = ref.read(tagNotifierProvider);

    String name = '';

    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return CustomDialog(
              title: '태그 수정',
              //#region 태그 입력
              content: CustomTextField(
                initialValue: tagList[index].name,
                globalKey: newTagNameKey,
                onChanged: (value) {
                  name = value;
                },
                validate: (value) {
                  if (tagProvider.isDuplicate(name: name)) {
                    return '중복된 태그 입니다.';
                  }
                  return null;
                },
              ),
              //#endregion
              actions: [
                //#region 취소 버튼
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('취소'),
                ),
                //#endregion

                //#region 완료 버튼
                ElevatedButton(
                  onPressed: () async {
                    // 공백 X
                    if (name.isEmpty) return;
                    // 중복 X
                    if (!(newTagNameKey.currentState!.validate())) return;

                    await tagProvider.updateTag(
                      index: index,
                      id: tagList[index].id,
                      newName: name,
                    );

                    name = ''; // 중복안되게 처리
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text('완료'),
                ),
                //#endregion
              ],
            );
          },
        );
      },
      //#region 태그 이름
      title: Text(tagList[index].name),
      //#endregion

      //#region 아이콘
      leading: Icon(Icons.sell_outlined),
      //#endregion

      //#region 삭제 버튼
      trailing: IconButton(
        onPressed: () async {
          await ref
              .read(tagNotifierProvider.notifier)
              .removeTag(id: tagList[index].id);
        },
        icon: Icon(Icons.delete),
      ),
      //#endregion
    );
  }
}
