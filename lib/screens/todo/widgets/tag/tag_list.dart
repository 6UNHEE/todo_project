import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_dialog.dart';
import 'package:todo_project/providers/tag_provider.dart';

class TagList extends ConsumerWidget {
  final int index;

  /// 태그 리스트
  const TagList({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagList = ref.read(tagProvider);

    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return CustomDialog(title: '태그 수정');
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
