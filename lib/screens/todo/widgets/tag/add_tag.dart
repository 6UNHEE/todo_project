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
                final tagList = ref.read(tagProvider.notifier);
                String name = '';
                return CustomDialog(
                  title: '태그 추가',
                  content: CustomTextField(
                    globalKey: tagNameKey,
                    onChanged: (value) {
                      name = value;
                    },
                    validate: (value) {
                      if (tagList.isDuplicate(name)) {
                        return '중복된 태그 입니다.';
                      }
                      return null;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('취소'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (name.isEmpty) return;
                        if (!(tagNameKey.currentState!.validate())) return;

                        final newTag = TagModel(
                          id: DateTime.now().millisecondsSinceEpoch,
                          name: name,
                        );

                        tagList.addTag(tag: newTag);
                      },
                      child: Text('완료'),
                    ),
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
