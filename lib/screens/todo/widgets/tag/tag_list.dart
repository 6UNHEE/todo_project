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

    final tagList = ref.read(tagProvider);
    final tagP = ref.read(tagProvider.notifier);

    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            String name = '';
            return CustomDialog(
              title: '태그 수정',
              content: CustomTextField(
                initialValue: tagList[index].name,
                globalKey: newTagNameKey,
                onChanged: (value) {
                  name = value;
                },
                validate: (value) {
                  if (tagP.isDuplicate(name: name)) {
                    return '중복된 태그 입니다.';
                  }
                  return null;
                },
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('취소'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (name.isEmpty) return;
                    if (!(newTagNameKey.currentState!.validate())) return;

                    tagP.updateTag(id: tagList[index].id, newName: name);

                    name = ''; // 중복안되게 처리
                  },
                  child: Text('완료'),
                ),
              ],
            );
          },
        );
      },
      title: Text(tagList[index].name),
      leading: Icon(Icons.sell_outlined),
      trailing: IconButton(
        onPressed: () {
          ref.read(tagProvider.notifier).removeTag(index: index);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
