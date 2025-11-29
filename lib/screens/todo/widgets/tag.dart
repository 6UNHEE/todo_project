import 'package:flutter/material.dart';
import 'package:todo_project/common/widgets/custom_dialog.dart';
import 'package:todo_project/common/widgets/name_container.dart';
import 'package:todo_project/theme/app_theme.dart';

class Tag extends StatefulWidget {
  /// 태그 선택
  const Tag({super.key});

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    final tagKey = GlobalKey<FormState>();

    return PopupMenuButton(
      onSelected: (value) {},
      // TODO 태그 설정
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDialog(
                    title: '태그 추가',
                    content: NameContainer(
                      child: Form(
                        key: tagKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) return value;
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                          cursorErrorColor: AppTheme.charcoal,
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('취소'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (tagKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                          return;
                        },
                        child: Text('완료'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('태그 추가'),
          ),
        ];
      },
      icon: Icon(Icons.tag),
    );
  }
}
