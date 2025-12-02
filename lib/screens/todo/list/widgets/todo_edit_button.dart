import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_dialog.dart';
import 'package:todo_project/providers/todo_provider.dart';
import 'package:todo_project/theme/app_size.dart';

class TodoEditButton extends StatelessWidget {
  final int id;

  /// 메모 수정/삭제 위젯
  const TodoEditButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            content: Column(
              spacing: AppSize.appPaddingL,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('메모 수정'),
                  icon: const Icon(Icons.delete),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton.icon(
                      onPressed: () async {
                        await ref
                            .read(todoNotifierProvider.notifier)
                            .deleteList(id: id);

                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      label: const Text('메모 삭제'),
                      icon: const Icon(Icons.edit),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
      icon: const Icon(Icons.more_horiz),
    );
  }
}
